#' Today
#' Get today's date
#'
#' @param sep Character. Format separator. Default is "_".
#' @param format Character. Return computer-friendly or human-friendly format. One in c("computer", "human").
#'
#' @return Character.
#' @export
#'
#' @examples today()
today <- function(format = "computer", sep = "_")
  {

  stopifnot(format %in% c("computer", "human"))

  if (format == "computer")
  {
    today_date <- format(Sys.Date(), paste0("%d", sep, "%m", sep,"%Y"))
    return(today_date)
    }
  if (format == "human")
  {
    today_date <- format(Sys.time(), "%B %d, %Y.")
    return(today_date)
  }
}





