#' Convert selected text to roxygen comment
#'
#' @param txt , a string vector
#'
#' @return a string vector with roxygen commet at each prefix
#' @export
#'
#' @examples
#' txt <- "a
#' b
#' c
#' d"
#' convert_roxygen(txt)
convert_roxygen <- function(txt) {
  txt_split <- stringr::str_split(txt, "\\\n")[[1]]
  stringr::str_c("#' ", txt_split, collapse = "\n")
}

#' Roxygen comment on currently selected section
#'
#' @return
#' @export
#'
#' @examples
selection2roxygen <- function(){
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s",selected))
    output <- convert_roxygen(selected)
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}