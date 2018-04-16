#' Today
#' Get today's date
#' @param sep Format separator. Character. Default is "_".
#'
#' @return Character. Day Month Year format.
#' @export
#'
#' @examples today()
today <- function(sep = "_")
  {
  today_date <- format(Sys.Date(), paste0("%d", sep, "%m", sep,"%Y"))
  return(today_date)
}





