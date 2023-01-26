
#' get the triplet information and
#'
#' FUNCTION_DESCRIPTION
#'
#' @param path string character of current file path.
#'
#' @return if detected the triplet will return the triplet info. if not, will
#' return empty space.
#' @export
get_triplet <- function(path) {
  trip_list <- stringr::str_extract(path, "(?<=SAR).+") %>%
    stringr::str_split("\\/")
  if (is.na(trip_list[[1]][1])) {
    return(c("", "", ""))
  }
  sar <- trip_list[[1]][1]
  studyid <- trip_list[[1]][2]
  codeid <- trip_list[[1]][3]
  c(sar, studyid, codeid)
}
