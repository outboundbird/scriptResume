

#' Create a css file in the current directory
#'
#' @param css_content content of css file.
#'
#' @return Null. Create a .css file in the current directory
#' @examples
#' create_css()
create_css <- function() {
  current_f_path <- rstudioapi::getActiveDocumentContext()$path
  current_dir <- dirname(current_f_path)
  css_path <- system.file("src", "theme.css",
    package = "scriptResume",
    mustWork = T
  )
  system2("cp",
    args = c(
      css_path,
      paste(current_dir, "sanofi.css", sep = "/")
    )
  )
}
