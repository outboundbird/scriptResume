#' Insert the header of R script which contains the libraries used in the script
#'
#' @return text summary of R script at the top of the document
#' @export
#'
insert_header <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  doc_libs <- extract_uniq_libs(doc$contents)
  output_files <- extract_uniq_outputs(doc$contents)
  input_data <- extract_uniq_inputs(doc$contents)
  src_file <- extract_uniq_src(doc$contents)
  current_file <- current_fname(doc$path)
  sep_star <- paste0(rep("*", 78), collapse = "")

  header <- sprintf(
    "#%s\n# Property of SANOFI\n# Program name     : %s\n# Description      : \n# Author           : Siying Huang (E0482362)\n# Compound number  : SAR\n# Study code       : SAR\n# Analysis code    : BMK\n# Date created     : %s \n# Input files      : %s \n# Input programs   : %s \n# Packages needed  : %s \n# Outputs created  : %s  \n# R version        : %s\n# Platform         : %s\n# %s\n# Modification status :\n# %s \n# Description: \n# %s",
    sep_star,
    paste0(current_file),
    Sys.Date(),
    paste0(input_data, collapse = ", "),
    paste0(src_file, collapse = ", "),
    paste0(doc_libs, collapse = ", "),
    paste0(output_files, collapse = ", "),
    version$version.string,
    paste(Sys.info()[1:2], collapse = "-"),
    sep_star,
    paste("In progress", Sys.Date(), "Siying Huang", sep = " | "),
    sep_star
  )
  rstudioapi::insertText(c(1, 1), header)
}
