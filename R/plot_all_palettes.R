#' @title Visualize all croix palettes
#'
#' @description Plots all croix palettes simultaneously.
#'
#' @param palType Which palette type should be plotted? Choices are
#'    \code{all} which plots all palette types, \code{brand} which plots
#'    only brand-type palettes, \code{croix} which plots only croix-type
#'    palettes, or \code{mov} which plots only movie-based palettes. Defaults
#'    to \code{all}.
#' @param ... Additional parameters to pass to inner functions.
#'
#' @importFrom graphics plot rect text
#'
#' @export
croix_all <- function(palType = c("all", "brand", "croix", "mov"), ...) {

    palType <- match.arg(palType)

    if (palType == "all") {
        main_title <- "All palettes"
        palType <- "*"
    } else if (palType == "brand") {
        main_title <- "Brand palettes"
    } else if (palType == "croix") {
        main_title <- "Croix palettes"
    } else if (palType == "mov") {
        main_title <- "Movie palettes"
    }

    croix_sub <- croix_pal_data[grepl(palType, names(croix_pal_data))]

    names <- names(croix_sub)
    max_len <- max(lengths(croix_sub))

    graphics::par(mar = c(0.5, 12, 2, 1))

    graphics::plot(
        x = c(0, max_len),
        y = c(0, length(names)),
        type = "n",
        axes = FALSE,
        xlab = "",
        ylab = "",
        main = main_title
    )

    for (i in seq_len(max_len)) {
        for (j in seq_along(names)) {
            graphics::rect(
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

    graphics::text(
        rep(-0.1, length(names)),
        seq_along(names) - 0.6,
        labels = names,
        xpd = TRUE,
        adj = 1
    )
}
