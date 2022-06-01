#' get_io get input output information.
#' create S3 class object of io
#'
#' @param filename char pathway and R or Rmd file name to be scanned
#' @param ... other things pass to the function
#'
#' @return S3 class object of io and inheritated from list class
#' @export
get_io <- function(filename, ...) {
    # read in file
    stopifnot(is.character(filename))

    rfile <- readLines(filename)
    input_list <- list()
    output_list <- list()
    transit_list <- list()
    target_list <- list()

    message("scanning the file...")

    rst <- lapply(rfile, function(line) {
        input <- trace_input(line)
        output <- trace_output(line)

        if (length(input)) {
            input_list <- append_list(input_list, input)
            if (!is.na(input["target"])) {
                target_list <<- append_list(target_list, input["target"])
            }
        }

        transit <- lapply(target_list, function(target) {
            data_transit(line, target)
        })

        transit_list <- append_list(transit_list, unlist(transit))

        if (length(output)) {
            output_list <- append_list(output_list, output)
        }

        return(list(
            input = input_list,
            transit = transit_list,
            output = output_list
        ))
    })

    structure(rst, filename = filename, class = c("io", "list"))
}

