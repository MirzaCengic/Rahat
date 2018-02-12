#' Generate file path for the milkun drives
#'
#' @param path Folder path
#' @param drive Milkun drive.
#'
#' @return Folder path with milkun location
#' @export
#'
#' @examples milkunize("Projects/Land_use")
milkunize <- function(path, drive = "m1")
{
  stopifnot(drive %in% c("m1", "m2", "m5", "m17"))

  if(Sys.info()["sysname"] == "Windows"){
  basepath_milkun1 <- "\\\\milkun1-srv.science.ru.nl/milkun1/Mirza_Cengic/"
  # .basepath_LU <- "\\\\milkun1-srv.science.ru.nl/Mirza_Cengic/Projects/Land_use/"
  basepath_milkun2 <- "\\\\milkun2-srv.science.ru.nl/milkun2/Mirza_Cengic/"
  basepath_milkun5 <- "\\\\milkun5-srv.science.ru.nl/milkun5/Merit/"
  basepath_milkun17 <- "\\\\milkun17-srv.science.ru.nl/milkun17/"

} else {
  basepath_milkun1 <- "/vol/milkun1/Mirza_Cengic/"
  basepath_milkun2 <- "/vol/milkun2/Mirza_Cengic/"
  # .basepath_LU <- "/vol/milkun1/Mirza_Cengic/Projects/Land_use/"
  basepath_milkun5 <- "/vol/milkun5/Merit/"
  basepath_milkun17 <- "/vol/milkun17/"
}

  if (drive == "m1")
    {
  mypath <- paste0(basepath_milkun1, path)
  }
  if (drive == "m2")
  {
    mypath <- paste0(basepath_milkun2, path)
  }
  if (drive == "m5")
  {
    mypath <- paste0(basepath_milkun5, path)
  }
  if (drive == "m17")
  {
    mypath <- paste0(basepath_milkun17, path)
  }
  return(mypath)
}
