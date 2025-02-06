#' get_names closure function
#'
#' @param pattern_split character, pattern for spliting
#' @param pattern character for extract contents
#' @return functions
#' @noRd
get_names <- function(pattern_split, pattern) {
  function(line) {
    extract <- stringr::str_split(line, pattern_split)[[1]]
    no_target <- is.na(stringr::str_extract(line, pattern_split))
    if (no_target) {
      return(NULL)
    } else {
      rst <- stringr::str_extract(extract, pattern)
      return(rst[!is.na(rst)])
    }
  }
}


#' name of importing files
#'
#' @param line string entry.
#'
#' @return string, file name
#' @noRd 
import_name <- get_names("read|load", ".+(?=\\s*\\<\\-)")


#' name of exporting file
#'
#' @param line string entry.
#'
#' @return string, file name
#' @noRd
export_name <- get_names(
  "(save)|(write)[A-Zaz\\.a-z]*",
  "[^(].+(?=\\s*\\,)"
)
