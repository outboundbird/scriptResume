#' Remove Quotes from Strings
#'
#' This function removes all quotation marks from the input strings.
#'
#' @return A character vector with all quotation marks removed.
#' @examples
#' rm_quotes("Hello, \"world\"!")
#' # [1] "Hello, world!"
#' @export
rm_quotes <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s", selected))
    output <- stringr::str_replace_all(text, "\"|'", "")
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}
