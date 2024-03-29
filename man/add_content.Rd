% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{add_content}
\alias{add_content}
\title{add content to email}
\usage{
add_content(mail_base, em_content = NULL, content_type = "text/plain")
}
\arguments{
\item{mail_base}{base of email, created by email_base()}

\item{em_content}{list of characters}

\item{content_type}{string, default "text/plain"}
}
\description{
add content i.e. message body to email base created earlier by email_base()
}
\examples{
my_mail <- email_base()
add_content(my_mail, 'Hello world!')
}
\keyword{email}
\keyword{sendgrid}
