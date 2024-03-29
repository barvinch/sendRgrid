% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pastOr.R
\name{pastOr}
\alias{pastOr}
\title{paste for regex OR}
\usage{
pastOr(..., pref = NULL, suff = NULL, sep = "|")
}
\arguments{
\item{...}{list of characters}

\item{pref}{prefix, to be added on beginning of string}

\item{suff}{suffix, to be added on end of the strin}

\item{sep}{separator, in normal paste(), here used as 'collapse' argument}
}
\description{
paste for regex OR
creates regex with OR condutions for all character values in 1st argument
}
\examples{
pastOr()
}
\keyword{or}
\keyword{regex}
\keyword{string}
