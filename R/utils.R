#' append list
#'
#' @param list_obj list object
#' @param ... anything to be appended to the list
#' @return list
#' @export
#' @examples
#' a <- list()
#' append_list(a, 1, 2, 3)
append_list <- function(list_obj = list(), ...) {
  i <- length(list_obj) + 1
  list_obj[[i]] <- c(...)
  return(list_obj)
}
