## Plot all croix palettes
croix_all <- function(...) {
    names <- names(croix_palettes)
    max_len <- max(lengths(croix_palettes))
    par(mar = c(0.5, 12, 2, 1), pty = "s")

    plot(
        x = c(0, max_len),
        y = c(0, length(names)),
        type = "n",
        axes = FALSE,
        xlab = "",
        ylab = "",
        main = "All palettes"
    )

    for (i in seq_len(max_len)) {
        for (j in seq_along(names)) {
            rect(
                xleft = i - 1,
                ybottom = j - 1,
                xright = i,
                ytop = j - 0.2,
                col = croix_palette(names[j])[i],
                border = "white",
                lwd = 5
            )
        }
    }

    text(
        rep(-0.1, length(names)),
        seq_along(names) - 0.6,
        labels = names,
        xpd = TRUE,
        adj = 1
    )
}
