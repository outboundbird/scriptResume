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
  triplet_info <- get_triplet(doc$path)
  author <- get_author(doc$path)
  sep_star <- paste0(rep("*", 78), collapse = "")
  nextline <- paste0(",\n#", paste0(rep(" ", 20), collapse = ""))

  # header <- sprintf(
  #   "# %s\n# Property of SANOFI\n# Program name     : %s\n# Description      : \n# Author           : Siying Huang (E0482362)\n# Compound number  : SAR%s\n# Study code       : %s\n# Analysis code    : BMK-%s\n# Date created     : %s \n# Input files      : %s \n# Input programs   : %s \n# Packages needed  : %s \n# Outputs created  : %s  \n# R version        : %s\n# Platform         : %s\n# %s\n# Modification status :\n# %s \n# Description: \n# %s\n",
  #   sep_star,
  #   paste0(current_file),
  #   author,
  #   triplet_info[1],
  #   triplet_info[2],
  #   triplet_info[3],
  #   Sys.Date(),
  #   paste0(input_data, collapse = nextline),
  #   paste0(src_file, collapse = nextline),
  #   paste0(doc_libs, collapse = nextline),
  #   paste0(output_files, collapse = nextline),
  #   version$version.string,
  #   paste(Sys.info()[1:2], collapse = "-"),
  #   sep_star,
  #   paste("In progress", Sys.Date(), "Siying Huang", sep = " | "),
  #   sep_star
  # )
  header <- glue::glue("# {sep_star}
# Property of SANOFI
# Program name     : {paste0(current_file)}
# Description      :
# Author           : {author}
# Compound number  : SAR{triplet_info[1]}
# Study code       : {triplet_info[2]}
# Analysis code    : BMK-{triplet_info[3]}
# Date created     : {Sys.Date()}
# Input files      : {paste0(input_data, collapse = nextline)}
# Input programs   : {paste0(src_file, collapse = nextline)}
# Packages needed  : {paste0(doc_libs, collapse = nextline)}
# Outputs created  : {paste0(output_files, collapse = nextline)}
# R version        : {version$version.string}
# Platform         : {paste(Sys.info()[1:2], collapse = ' - ')}
# {sep_star}
# Modification status :
# {paste('In progress', Sys.Date(), author, sep = ' | ')}
# Description:
# {sep_star}")
  rstudioapi::insertText(c(1, 1), header)
}
