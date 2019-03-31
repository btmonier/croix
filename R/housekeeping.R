## Format syntax of palette ID when plotting - not exported
syntax <- function(x) {
    if (grepl("_", x)) {
        x <- gsub("_", " ", x)
    }

    x <- strsplit(x, " ")[[1]]
    x <- paste(
        toupper(
            substring(x, 1, 1)
        ),
        substring(x, 2),
        sep = "", collapse = " "
    )
    return(x)
}


## Simple fuzzy finding function for searching palettes
fuzzy_croix <- function(x, md = 0.2) {
    croix_names <- names(croix_pal_data)
    croix_names[agrep(pattern = x, x = croix_names, max.distance = md)][1]
}
