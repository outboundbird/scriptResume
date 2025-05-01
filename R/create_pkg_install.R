#' Create a pkg_install.R file in the current directory
#' @return Null. Create a .css file in the current directory
#' @noRd
create_pkg <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  current_f_path <- doc$path
  current_dir <- dirname(current_f_path)
  message(paste("Creating pkg_install.R file in", current_dir, "/"))
  f_path <- system.file("extdata", "pkg_install.R",
    package = "scriptResume",
    mustWork = T
  )
  tryCatch(
    {
      file.copy(f_path, current_dir)
    },
    error = function(e) {
      warning("File cannot be copied!")
    }
  )
}
