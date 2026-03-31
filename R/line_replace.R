#' Replace lines within char-vector
#'
#' @param txt File input
#' @param parameter Content to replace
#' @param pattern Content to look for
#' @return txt, with line containing \var{pattern} replaced with \var{parameter}
#'
#' @export
line_replace <- function(txt, parameter, pattern){
  if(!missing(parameter)){
    i <- grep(pattern,txt)
    #if(!any(i)){
    #  print(paste("   ",pattern,"   ","does not exist"))
    #  break()
    #}
    txt[i] <- paste(as.character(parameter),"\t",pattern)
  }
  return(txt)
}
