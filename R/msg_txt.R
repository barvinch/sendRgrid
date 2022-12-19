#' compose message body from character lines
#'
#' Takes character lines as input and paste it together with 2 line breaks
#'  Use blank string (i.e. '') to add extra line
#'
#' @param ... list of characters
#' @keywords email
#' @keywords text
#' @keywords string
#' @export
#' @examples
#' msg_txt('hello','world!','','goodbye!')
#
msg_txt <- function(...)  paste0('\\n', paste0(c(...), collapse = '\\n\\n'))

