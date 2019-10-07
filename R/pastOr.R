#' paste for regex OR
#'
#' paste for regex OR
#' creates regex with OR condutions for all character values in 1st argument
#'
#' @param ... list of characters
#' @param pref prefix, to be added on beginning of string
#' @param suff suffix, to be added on end of the strin
#' @param sep  separator, in normal paste(), here used as 'collapse' argument
#' @keywords regex
#' @keywords or
#' @keywords string
#' @export
#' @examples
#' pastOr()
#
pastOr <- function(..., pref=NULL, suff=NULL, sep='|') {
  margs <- as.list(match.call(expand.dots = FALSE))
  strng <- ''
  strng <- paste0(pref, paste(margs$... , collapse = sep), suff)
  return(strng)
}
