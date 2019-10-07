#' add "content" email adresses
#'
#' add "content" email adresses to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_content   list of characters
#' @param content_type
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_content(my_mail, 'Hello world!')
#
add_content <- function(mail_base, em_content = NULL, content_type = "text/plain") {
  mail_base$content$value <- em_content
  mail_base$content$type <- content_type
  return(mail_base)
}



