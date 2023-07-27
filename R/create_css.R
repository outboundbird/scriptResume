#' Create a css file in the current directory
#'
#' @param css_content content of css file.
#'
#' @return Null. Create a .css file in the current directory
#' @export
create_css <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  current_f_path <- doc$path
  current_dir <- dirname(current_f_path)
  message(paste("Creating css file in", current_dir))
  css_path <- system.file("extdata", "theme.css",
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
