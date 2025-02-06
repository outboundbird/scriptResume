#' Extract library from one line text
#'
#' @param line character text from code
#'
#' @return NULL or library name extracted from text
#' @noRd
#'
#' @examples extract_lib("library(apple)")
extract_lib <- function(line) {
  patterns <- c(
    "(?<=library\\()\\w+",
    '(?<=library\\(")\\w+',
    '(?<=require\\(")\\w+',
    "(?<=require\\()\\w+",
    "\\w+(?=::)"
  )
  lib <- lapply(patterns, function(p) {
    out <- stringr::str_extract(line, p)
    ifelse(is.na(out), return(NULL), out)
  })
  return(unlist(lib[!is.na(lib)]))
}


#' Extract unique libraries from the R script
#'
#' @param doc_contents character vector of R script can be
#' extracted from rstudioapi::getActiveDocumentContext
#' function
#'
#' @return unique libraries used in the document
#' @noRd
extract_uniq_libs <- function(doc_contents) {
  libs <- unique(unlist(lapply(doc_contents, extract_lib)))
  return(sort(libs))
}
