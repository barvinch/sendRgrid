#' create base of email
#'
#' create base of email
#' Email components may be added on creation or later
#'
#' @param em_to   list of characters
#' @param em_cc   prefix, to be added on beginning of string
#' @param em_from suffix, to be added on end of the strin
#' @param em_subject  separator, in normal paste(), here used as 'collapse' argument
#' @param content_type
#' @param content_value
#' @param att_content
#' @param att_type
#' @param att_filename
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' email_base()
#
email_base <- function(em_to='', em_cc='', em_from='', em_subject='',
                       content_type = '', content_value = '',
                       att_content  = '', att_type = '', att_filename = '') { # att_type = "html"
msclt <- list(
to   = em_to ,
cc   = em_cc,
from = em_from,
subject = em_subject,
content =  list(type = content_type, value = content_value) ,
attachments =  list(content=att_content, type=att_type, filename=att_filename)
)
return(msclt)
}
