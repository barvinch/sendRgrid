
emailJSON <- function(mails) {

mailJSON <- paste0('{\"email\": \"',
       paste(mails, collapse = '\"}, {\"email\": \"'),
       '\"}')
if (length(mails) > 1) {
  mailJSON <-  paste0('[', mailJSON, ']')
}
return(mailJSON)
}
