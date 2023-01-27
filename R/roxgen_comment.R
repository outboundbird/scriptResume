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


#' add roxygen comment with quotation sign.
#'
#' @param txt a string vector.
#'
#' @return quoted roxygen comments
#' @export
#' @examples
#' # ADD_EXAMPLES_HERE
roxygen_quote <- function(txt) {
  txt_split <- stringr::str_split(txt, "\\\n")[[1]]
  stringr::str_c("#' > ", txt_split, collapse = "\n")
}


#' Undo roxygen comment
#' @importFrom magrittr  %>%
#' @name  %>%
#' @rdname pipe
#' @param text a string vector with roxygen comment sign.
#'
#' @return a string vector without roxygen comment
#' @export
redo_roxycomment <- function(text) {
  stringr::str_split(text, "\n") %>%
    unlist() %>%
    stringr::str_extract_all("(?<=#').+") %>%
    unlist() %>%
    stringr::str_trim("left") %>%
    stringr::str_c(collapse = "\n")
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


#' Transform current text selection into roxygen comment with quotation.
#'
#' @return quoted roxygen text
#' @export
selection2roxygen_quote <- function(){
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s",selected))
    output <- roxygen_quote(selected)
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}


uncomment_roxygen <-  function(){
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s",selected))
    output <- redo_roxycomment(selected)
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}
