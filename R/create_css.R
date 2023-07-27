#' Create a css file in the current directory
#' @return Null. Create a .css file in the current directory
#' @export
create_css <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  current_f_path <- doc$path
  current_dir <- dirname(current_f_path)
  message(paste("Creating css file in", current_dir, "/"))
  css_path <- system.file("extdata", "theme.css",
    package = "scriptResume",
    mustWork = T
  )
  tryCatch(
    {
      file.copy(css_path, current_dir)
    },
    error = function(e) {
      warning("File cannot be copied!")
    }
  )
}
