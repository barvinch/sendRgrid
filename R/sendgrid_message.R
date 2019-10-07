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
        [{\"to\": ',mail$to, '}],
              \"from\": ', mail$from ,',
              \"subject\": \"',mail$subject , '",
              \"content\": [{\"type\": \"text/plain\", \"value\": \"', mail$content$value , '\"}]',
              ifelse(mail$attachments$content == '', '',
                     paste0(' \"attachments\": [{\"content\": \"',mail$attachments$content,
                     '", \"type\": \"html\", \"filename\": \"',mail$attachments$filename,'\"}]')),
              '}')
return(msg)
}
