#' get author ID from  working path
#'
#' @param path a string vector of one indicating current path.
#'
#' @return string, author ID
#' @export
get_author <- function(path) {
  author <- stringr::str_extract(path, "(?<=home/)\\w+")
  env_author <- exists("W_USER")
  if (is.na(author) & env_author) {
    return(get("W_USER"))
  }
  author
}