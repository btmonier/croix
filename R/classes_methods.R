#' @title The croix palette generator
#'
#' @description A collection of color palettes from LaCroix, movies and
#'    whatever else that's colorful and interesting.
#'
#' @param n Number of colors desired.
#' @param name Name of desired palette. To see list of available palettes,
#'    use \code{names(croix_palettes)}, or use \code{croix_all()} to generate
#'    a plot of all color schemes.
#' @param type How do you want the colors displayed? Current options are
#'    \code{discrete} or \code{continuous}. \code{discrete} will generate
#'    specific colors in the desired palette. \code{continous} will generate
#'    a gradient between the specified colors desired.
#'
#' @return A vector of colours.
#'
#' @importFrom grDevices colorRampPalette
#'
#' @keywords colors
#'
#' @examples
#' # Return vector
#' crPal <- croix_palette("croix_pure")
#' crPal
#'
#' # Visualize palette
#' crPal <- croix_palette("mov_the_shining")
#' plot(crPal)
#'
#' # Get summary statistics of palette
#' crPal <- croix_palette("mov_akira")
#' summary(crPal)
#'
#' # Get a gradient of palette
#' crPal <- croix_palette("croix_coconut", n = 50, type = "continuous")
#' plot(crPal)
#'
#' @export
croix_palette <- function(name, n = NULL, type = c("discrete", "continuous")) {
    type <- match.arg(type)

    name <- fuzzy_croix(x = name)
    pal <- croix_pal_data[[name]]
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
                "  Displaying the palette you asked for with that many",
                " colors.", "\n"
            )
        )
        n <- length(pal)
    }

    if (type == "discrete") {
        pal <- pal[seq_len(n)]
    } else if (type == "continuous") {
        pal <- grDevices::colorRampPalette(pal)(n)
    } else {
        stop("Incorrect palette type.")
    }

    structure(pal, class = "croix", name = name, type = type)
}


#' @importFrom graphics image rect text par
#' @importFrom grDevices rgb
#'
#' @export
plot.croix <- function(x, ...) {
    n <- length(x)
    old <- graphics::par(pty = "m", mar = c(3, 1, 3, 1))
    on.exit(par(old))

    graphics::image(
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

    graphics::rect(
        xleft = 0,
        ybottom = 0,
        xright = n,
        ytop = 0.5,
        col = grDevices::rgb(1, 1, 1),
        border = NA
    )

    graphics::rect(
        xleft = 0,
        ybottom = 2,
        xright = n,
        ytop = 2.5,
        col = rgb(1, 1, 1),
        border = NA
    )
    graphics::text(n * 0.5, 2.25, labels = t_lab, cex = 1, font = 2)
    graphics::text(n * 0.5, 0.25, labels = b_lab, cex = 1, font = 1)
}


#' @export
summary.croix <- function(object , ...) {
    cat("LaCroix , so tasty...\n")
    cat("  Class.....", class(object ), "\n")
    cat("  Length....", length(object ), "\n")
    cat("  Palette...", attr(object , "name"), "\n")
    cat("  Type......", attr(object , "type"), "\n")
}


#' @export
print.croix <- function(x, ...) {
    print(as.vector(x))
}
