#' print input output table
#'
#' @param rst S3 io class object
#'
#' @return IO summary table
#' @export
print.io <- function(rst) {
  message("extracting info...")

  input <- do.call(c, lapply(rst, function(obj) obj[["input"]]))
  transit <- do.call(c, lapply(rst, function(obj) obj[["transit"]]))
  output <- do.call(c, lapply(rst, function(obj) obj[["output"]]))

  input0 <- Map(function(x) {
    if (is.na(x["target"])) {
      x["target"] <- NA
    }
    x <- c(x["target"], x["io"])
    return(x)
  }, input)


  input_df <- data.frame(do.call(rbind, input0))
  transit_df <- data.frame(do.call(rbind, transit))
  output_df <- data.frame(do.call(rbind, output))

  if (length(transit_df)) {
    it <- merge(input_df, transit_df, by = "target", all = T)
    to <- merge(transit_df, output_df,
      by.x = "transit", by.y = "target", all = T
    )
    ito <- merge(it, to,
      by.x = c("transit", "target"),
      by.y = c("transit", "target"), all = T
    )
    dplyr::distinct(ito)
    summary_tab <- stats::setNames(
      ito,
      c("renv-obj", "readin-obj", "read-in", "write-out")
    )
  }

  if (!length(transit_df)) {
    io <- merge(input_df, output_df, by = "target", all = T)
    summary_tab <- stats::setNames(io, c("renv_obj", "read-in", "write-out"))
  }
  return(summary_tab)
}
