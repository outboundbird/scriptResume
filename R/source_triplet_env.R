#' Source Triplet Environment
#'
#' This function sources a specific R script located within a triplet directory structure.
#' It retrieves the active document's path, constructs the triplet path, and sources the
#' specified script from the constructed path.
#'
#' @return None
#' @noRd
source_triplet_env <- function() {
  path <- rstudioapi::getActiveDocumentContext()$path

  triplet <- stringr::str_split(path, "/") %>%
    unlist() %>%
    .[1:6] %>%
    paste(., collapse = "/")

  source_loc <- "METADATA/WISE/alloc_ana.R"
  triplet_source_path <- file.path(triplet, source_loc)
  tryCatch(
    {
      source(triplet_source_path)
    },
    error = function(e) {
      warning(e)
    }
  )
}
