#' Remove duplicated libraries and insert cleaned up library
#'
#' @return Insert the libraries in the script at the
#' cursor position
#' @noRd
#'
remove_dup_libs <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  doc_libs <- extract_uniq_libs(doc$contents)
  # n_libs <- length(doc_libs)
  # col <- sapply(doc_libs, nchar)
  cusor_pos <- rstudioapi::primary_selection(
    rstudioapi::getActiveDocumentContext()
  )

  cursor_row <- cusor_pos$range$start[1]
  rstudioapi::insertText(
    c(cursor_row, 1),
    paste0("library(", doc_libs, ")", collapse = "\n")
  )
}
