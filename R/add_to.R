#' add "to" email adresses
#'
#' cadd "to" email adresses to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_to   list of characters
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_to(my_mail, 'mail1@foo.com')
#
add_to <- function(mail_base, to_mail) {
    mail_base$to <- e_mail(to_mail)
  return(mail_base)
}

