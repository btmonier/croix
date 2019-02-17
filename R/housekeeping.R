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
