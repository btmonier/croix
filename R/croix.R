## Croix class generation
croix_palette <- function(name, n = NULL, type = c("discrete", "continuous")) {
    type <- match.arg(type)

    pal <- croix_palettes[[name]]
    if (is.null(pal)) {
        stop("This palette could not be found.")
    }

    if (is.null(n)) {
        n <- length(pal)
    } else if (type == "discrete" && n > length(pal)) {
        warning(
            paste0(
                "n too large, allowed maximum for palette ",
                "\"", name, "\"", " is ", length(pal), ".\n",
                "  Displaying the palette you asked for with that many colors.",
                "\n"
            )
        )
        n <- length(pal)
    }

    if (type == "discrete") {
        pal <- pal[seq_len(n)]
    } else if (type == "continuous") {
        pal <- grDevices::colorRampPalette(pal)(n)
    }

    structure(pal, class = "croix", name = name, type = type)
}

## Plotting method for croix class
plot.croix <- function(x, ...) {
	n <- length(x)
	old <- par(pty = "m", mar = c(3, 1, 3, 1))
	on.exit(par(old))

	image(
		x = seq(from = 0, to = n),
		y = c(0, 2.5),
		z = as.matrix(1:n),
		col = x,
		ylab = "",
		xlab = "",
		xaxt = "n",
		yaxt = "n",
		bty = "n"
	)

	t_lab <- syntax(attr(x, "name"))
	b_lab <- paste("Colors:", n)

	rect(
		xleft = 0,
		ybottom = 0,
		xright = n,
		ytop = 0.5,
		col = rgb(1, 1, 1),
		border = NA
	)

	rect(
		xleft = 0,
		ybottom = 2,
		xright = n,
		ytop = 2.5,
		col = rgb(1, 1, 1),
		border = NA
	)
	text(n * 0.5, 2.25, labels = t_lab, cex = 1, font = 2)
	text(n * 0.5, 0.25, labels = b_lab, cex = 1, font = 1)
}

## Summary method for croix class
summary.croix <- function(x, ...) {
	cat("La Croix, so tasty...\n")
	cat("  Class.....", class(x), "\n")
	cat("  Length....", length(x), "\n")
	cat("  Palette...", attr(x, "name"), "\n")
	cat("  Type......", attr(x, "type"), "\n")
}

## Print method for croix class
print.croix <- function(x, ...) {
    print(as.vector(x))
}