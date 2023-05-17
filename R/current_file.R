#' Extract current active file name
#'
#' @param line 1L-character vector contains the path of current file. Can be passed from `rstudioapi::getActiveDocumentContext()$path`
#'
#' @return the name of current active file
#' @export
#'
#' @examples current_fname("~/Work/cheat_sheet/snippets.R")
current_fname <- function(line) {
  return(stringr::str_extract(line, "\\w+\\.R"))
}
