#' Selection to markdown bullet point list
#' @return markdown bulle point list
#' @export
md_bullet <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s",selected))
    output <- stringr::str_replace_all(txt, "\\n","\\\n - ")
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}
