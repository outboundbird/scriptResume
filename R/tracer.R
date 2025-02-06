
#' trace to trace certain pattern
#'
#' @param get_target function object
#' @param extract_file function object
#'
#' @noRd
tracer <- function(get_target, extract_file) {
  function(line) {
    target <- get_target(line)
    io_file <- extract_file(line)
    return(c(target = target, io = io_file))
  }
}


#' Tracing inputs
#'
#' @param line DESCRIPTION.
#'
#' @return list of target and input files
#' @noRd
trace_input <- tracer(import_name, extr_input_file)


#' tracing output
#' @param line DESCRIPTION.
#'
#' @return list of target and output files
#' @noRd
trace_output <- tracer(export_name, extr_output_file)


#' data_transit, track data transition from readin files
#'
#' @importFrom stats setNames
#' @param line char, the text line to be read
#' @param target char, the key word target
#'
#' @return list of transit and target
#' @noRd
data_transit <- function(line, target) {
  pattern_target <- paste0(".+\\<\\-\\s*", target, "(?!\\w)")
  extract <- stringr::str_extract(line, pattern_target)
  no_target <- is.na(extract)
  if (no_target) {
    return(NULL)
  } else {
    pattern <- "\\<\\-"
    rst <- stringr::str_split(extract, pattern)[[1]]
    rst <- sapply(rst, stringr::str_trim)
    return(setNames(rst, c("transit", "target")))
  }
}
