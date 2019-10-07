#' add "from" email adresses
#'
#' add "from" email adresses to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_from   list of characters
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_from(my_mail, 'mail1@foo.com')
#
add_from <- function(mail_base, em_from = NULL) {
  mail_base$from <- emailJSON(em_from)
  return(mail_base)
}
