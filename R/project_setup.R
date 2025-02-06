#' Setup Project
#'
#' This function initializes the project environment by setting up necessary configurations,
#' loading required libraries, and preparing the workspace for further analysis.
#'
#' @return None
#' @noRd
setup_project <- function() {
  # find active path
  doc <- rstudioapi::getActiveDocumentContext()
  current_path <- dirname(doc$path)
  src_exist <- dir.exists("src")
  data_exist <- dir.exists("data")
  output_exist <- dir.exists("output")
  if (!all(src_exist, data_exist, output_exist)) {
    dir.create(file.path(current_path, "src"))
    dir.create(file.path(current_path, "data"))
    dir.create(file.path(current_path, "output"))
  }

  r_pkg_path <- system.file("extdata", "pkg_install.R",
    package = "scriptResume",
    mustWork = TRUE
  )
  py_pkg_path <- system.file("extdata", "requirements.txt",
    package = "scriptResume",
    mustWork = TRUE
  )
  file.copy(r_pkg_path, file.path(current_path, "src"))
  file.copy(py_pkg_path, file.path(current_path, "src"))
  file.create(file.path(current_path, "README.md"))
  file.create(file.path(current_path, ".gitignore"))
}
