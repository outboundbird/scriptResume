utils::globalVariables(".")
#' Selection to markdown bullet point list
#' @return markdown bulle point list
#' @export
md_bullet <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s", selected))
    output <- stringr::str_replace_all(selected, "\\n", "\\\n - ") %>%
      glue::glue(" - ", .)

    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}


#' Pad the begining and end of a vector. If one wants to evaluate
#' a text string, use `<< >>` to quote the code to be evaluted.
#' @param txt string vector with length of one.
#' @param pattern pattern to pad.
#'
#' @return padded string
padding <- function(txt, pattern) {
  lapply(txt, function(x) {
    glue::glue(pattern, x, pattern,
      .open = "<<", .close = ">>"
    )
  }) %>%
    unlist()
}


#' Transform code to markdown table
#' cells must be separated by colons `:`
#' @return markdown table format
#' @export
md_tab <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  id <- doc$id
  selected <- doc$selection[[1]]$text
  select_pos <- doc$selection[[1]]$range
  if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s", selected))
    subunit <- stringr::str_split(selected, "\\\n") %>%
      unlist() %>%
      stringr::str_replace_all(":", "\\|") %>%
      padding("|")

    n_bar <- stringr::str_count(subunit[1], "\\|")
    tab_edge <- paste(rep("|", n_bar), collapse = " --- ")

    output <- append(subunit, tab_edge, after = 1) %>%
      paste(collapse = "\n")
    message(output)
  } else {
    message("Nothing selected.")
    output <- ""
  }
  print(select_pos)
  rstudioapi::insertText(select_pos, output, id)
}
