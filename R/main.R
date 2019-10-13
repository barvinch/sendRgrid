# email_ base ----
#
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

# add_to ------------------------------------------------------------------

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
  mail_base$to <- sendgrid_json_emails(to_mail)
  return(mail_base)
}

# add_cc ------------------------------------------------------------------

#' add "cc" email adresses
#'
#' cadd "cc" email adresses to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_cc   list of characters
#' @keywords email
#' @keywords sendgrid
#' @export
#' @examples
#' my_mail <- email_base()
#' add_cc(my_mail, 'mail2@foo.com')
#
add_cc <- function(mail_base, cc_mail) {
  mail_base$cc <- sendgrid_json_emails(cc_mail)
  return(mail_base)
}


# add_from ----------------------------------------------------------------

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
  mail_base$from <- sendgrid_json_emails(em_from)
  return(mail_base)
}


# add_subject -------------------------------------------------------------

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


# add_content -------------------------------------------------------------

#' add content to email
#'
#' add content i.e. message body to email base created earlier by email_base()
#'
#'
#' @param mail_base base of email, created by email_base()
#' @param em_content   list of characters
#' @param content_type string, default "text/plain"
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


# add_attachment ----------------------------------------------------------

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


# sendgrid_message --------------------------------------------------------

#' finalize message as request body
#'
#' Takes chracter lines as input and paste it together with 2 linebreacks
#'  Use black string (i.e. '') to add extra line
#'
#' @param mail list, mail created
#' @keywords email
#' @keywords text
#' @keywords string
#' @export
#' @examples
#' sendgrid_message(my_mail)
#
sendgrid_message <- function(mail) {
  msg <- paste0('{\"personalizations\":
        [{\"to\": [',mail$to, ']}],
                ',
                ifelse(mail$cc == '', '',
              paste0('\"cc\": ',mail$cc, ',
                     ')),
              '\"from\": ', mail$from ,',
              \"subject\": \"',mail$subject , '",
              \"content\": [{\"type\": \"text/plain\", \"value\": \"', mail$content$value , '\"}]',
                ifelse(mail$attachments$content == '', '',
                       paste0(',
              \"attachments\": [{\"content\": \"',mail$attachments$content,
                              '\", \"type\": \"', mail$attachments$type,
                              '\", \"filename\": \"',mail$attachments$filename,'\"}]')),
                '}')
  return(msg)
}
