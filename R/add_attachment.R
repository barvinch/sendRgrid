#' add attachment to email
#'
#' add attachment to email to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param att_content   string, path and filename
#' @param att_type      string, type of content, default 'html'
#' @param att_filename  string, filename
#' @param tobase64      logical. By default attachment files converted to base64 inside function. Set to FALSE otherwise
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_attachment(my_mail, 'picture.png')
#
add_attachment <- function(mail_base,
                           att_content  = NULL,
                           att_type     = 'html',
                           att_filename = NULL,
                           tobase64     = TRUE) {
  if (tobase64) {
    mail_base$attachments$content  <- base64enc::base64encode(att_content)
  } else {
    mail_base$attachments$content  <- att_content
  }

  if (is.null(att_filename) & tobase64) {
    att_filename <- att_content
  }
  mail_base$attachments$filename <- att_filename
  mail_base$attachments$type     <- att_type
  return(mail_base)
}
