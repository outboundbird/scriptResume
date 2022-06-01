#' Extract input data file
#'
#' @param line a 1L character vector may or may not contains input data line.
#'
#' @return input file name
#' @export
#'
#' @examples extr_input_file('read.csv("something.csv", header = T)')
extr_input_file <- function(line) {
  pattern_out <- 'read|load'
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


#' Scan R script and extract non-duplicated input data files
#'
#' @param doc_contents a character vector of a R script
#'
#' @return extracted non-duplicated input data files
#' @export
#'
extract_uniq_inputs <- function(doc_contents) {
  return(unique(unlist(lapply(doc_contents ,extr_input_file))))
}
