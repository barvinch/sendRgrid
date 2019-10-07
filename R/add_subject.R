#' add "subject" email adresses
#'
#' add "subject" email adresses to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_subject   string
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_subject(my_mail, 'mail1@foo.com')
#
add_subject <- function(mail_base, em_subject = NULL) {
  mail_base$subject <- em_subject
  return(mail_base)
}
