#' Make json list of emails
#'
#' Make json list of emails from character vector
#'  strings test for email format to be added
#'
#' partly from https://github.com/rhochreiter/sendgridR/
#'
#' @param input character or list of characters
#' @keywords email
#' @keywords sendgrid
#' @keywords string
#' @export
#' @examples
#' sendgrid_json_emails(c('bar@example.com', 'foo@example.com'))
#' # add name for email address with list
#' sendgrid_json_emails(list(list('bar@example.com', ' bar_bar'), 'foo@example.com'))
#
sendgrid_json_emails <- function(input) {
  output <- ""
  counter <- 1
  for(part in input) {
    if (counter > 1) { output <- paste0(output, ', ') }
    if(length(part) == 1) {
      output <- paste0(output, '{ "email": "', part,'" }')
    } else {
      output <- paste0(output, '{ "email": "', part[1],'", "name": "', part[2],'" }')
    }
    counter <- counter + 1
  }
  # if (counter > 2) {
    # output <-  paste0('[', output, ']')
  # }
  return(output)
}
