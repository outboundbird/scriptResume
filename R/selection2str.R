#' Convert object tostring
#' @param line a char vector.
#'
#' @return quoted test
#' @export
#' line = "a, b, c"
#' tostring(line)
tostring <- function(line) {
    splited <- stringr::str_split(line, ",")[[1]]
    trimmed <-  stringr::str_trim(splited, "both")
    padded <- stringr::str_pad(trimmed,1,"both","'")
    return(deparse1(padded))
}

#' make the selected text into string/characters
#' @param Null
#' @return quoted text
#' @export
selection2str <- function() {
    doc <- rstudioapi::getActiveDocumentContext()
    id <- doc$id
    selected <- doc$selection[[1]]$text
    select_pos <- doc$selection[[1]]$range
    if (nchar(selected) > 0) {
    message(sprintf("You have selected:\n %s",selected))
        output <- tostring(selected)
        message(output)
    } else {
        message("Nothing selected.")
        output <- ""
    }
    print(select_pos)
    rstudioapi::insertText(select_pos, output, id)
}
