#' Make json list of emails
#'
#' Make json list of emails from character vector
#'  strings test for email format to be added
#'
#' @param ... list of characters
#' @keywords regex
#' @keywords or
#' @keywords string
#' @export
#' @examples
#' msg_txt('hello','world!','','goodbye!')
#
e_mail <- function(...) {
  a <- unlist(eval(substitute(alist(...))))
  # print(a)
  stopifnot(!is.null(a[[1]]))
  jsonlite::toJSON(data.frame(email = a, stringsAsFactors = FALSE))
}
# jsonlite::toJSON(data.frame(email = readers))
