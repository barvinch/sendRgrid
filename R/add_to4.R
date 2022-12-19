#' add "to" email adresses
#'
#' add "to" email adresses to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_to   list of characters
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_to3(my_mail, 'mail1@foo.com')
#
add_to4 <- function(mail_base, to_mail) {
    mail_base$to <- sendgrid_json_emails(to_mail)
  return(mail_base)
}

