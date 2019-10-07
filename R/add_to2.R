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
add_to2 <- function(mail_base, to_mail) {
    mail_base$to <- paste0('{\"email\": \"',
                           paste(to_mail, collapse = '\"}, {\"email\": \"'),
                           '\"}')
  return(mail_base)
}

