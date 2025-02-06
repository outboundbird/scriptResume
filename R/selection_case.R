#' Tranform selected text to upper case
#' @return upper case text
#' @noRd
to_upper <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s", selected))
    output <- toupper(selected)
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}

#' Tranform selected text to lower case
#' @return lower case text
#' @noRd
to_lower <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s", selected))
    output <- tolower(selected)
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}


#' Remove the row ID print out from selected text
#' @return text with ID removed
#' @noRd
rm_rowID <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s", selected))
    output <- stringr::str_replace_all(selected, "\\[\\d+\\]", "")
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}
