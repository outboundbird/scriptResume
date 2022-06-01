#' Extract the output files from a text line
#'
#' @param line 1L character the text line to be read
#'
#' @return the file name output from the R script
#' @export
#'
#' @examples extr_output_file("saveRDS('test.Rds')")
extr_output_file <- function(line) {
  pattern_out <- '(save)|(write)[A-Zaz\\.a-z]*'
  extract <- stringr::str_split(line, pattern_out)[[1]]
  no_target <- is.na(stringr::str_extract(line, pattern_out))
  if(no_target){
    return(NULL)
  }else{
    pattern = "(?<=\'|\")[^\'|\"]*"
    rst <- stringr::str_extract(extract, pattern)
    return(rst[!is.na(rst)])
  }
}

#' Extract output files from R script
#'
#' @param doc_contents character vector of R script
#'
#' @return a vector of output files written in the R script if any
#' NULL if there isn't any
#' @export
#'
extract_uniq_outputs <- function(doc_contents) {
  return(unique(unlist(lapply(doc_contents, extr_output_file))))
}
