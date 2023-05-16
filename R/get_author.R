#' get author ID from  working path
#'
#' @param path a string vector of one indicating current path.
#'
#' @return string, author ID
#' @export
get_author <- function(path) {
  author <- stringr::str_extract(path, "(?<=home/)\\w+")
  if (is.na(author)) {
    return("")
  }
  author
}