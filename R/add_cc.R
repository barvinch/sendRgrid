#' add "cc" email adresses
#'
#' add "cc" email adresses to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_cc   list of characters
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_to(my_mail, 'mail1@foo.com')
#
add_cc <- function(mail_base, em_cc = NULL) {
  mail_base$cc <- e_mail(em_cc)
  return(mail_base)
}
