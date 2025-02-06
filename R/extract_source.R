#' Extract srource file
#'
#' @param line a 1L character vector may or may not contains source file path.
#'
#' @return source file path/name
#' @noRd
#'
#' @examples extr_src_file('source("src/utils/utils.R")')
extr_src_file <- function(line) {
  pattern_out <- "source"
  extract <- stringr::str_split(line, pattern_out)[[1]]
  no_target <- is.na(stringr::str_extract(line, pattern_out))
  if (no_target) {
    return(NULL)
  } else {
    pattern <- "(?<=\'|\")[^\'|\"]*"
    rst <- stringr::str_extract(extract, pattern)
    return(rst[!is.na(rst)])
  }
}


#' Scan R script and extract non-duplicated source code files
#'
#' @param doc_contents a character vector of a R script
#'
#' @return extracted non-duplicated source code files
#' @noRd
#'
extract_uniq_src <- function(doc_contents) {
  return(unique(unlist(lapply(doc_contents, extr_src_file))))
}
