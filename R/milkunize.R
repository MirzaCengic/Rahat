#' Milkunize
#'
#' Generate file path for the milkun drives
#'
#' @param path Folder path
#' @param drive Milkun drive. One in c("m1", "m2", "m5", "m17").
#' @param method Method how the local system is detected. Either sysname (windows or linux), or user (mcengic on cluster or mirzacengic on the laptop).
#'
#' @return Folder path with milkun location
#' @export
#'
#' @examples milkunize("Projects/Land_use")
milkunize <- function(path, drive = "m1", method = "user")
{

  stopifnot(drive %in% c("m1", "m2", "m5", "m17"), method %in% c("user", "sysname"))

  if (method == "user")
  {
    if(Sys.info()["user"] == "mirzacengic"){
      basepath_milkun1 <- "/home/mirzacengic/milkun1/Mirza_Cengic/"
      # .basepath_LU <- "\\\\milkun1-srv.science.ru.nl/Mirza_Cengic/Projects/Land_use/"
      basepath_milkun2 <- "/home/mirzacengic/milkun2/Mirza_Cengic/"
      basepath_milkun5 <- "/home/mirzacengic/milkun5/Merit/"
      basepath_milkun17 <- "/home/mirzacengic/milkun17/"
      }
    if (Sys.info()["user"] == "mcengic")
    {
      basepath_milkun1 <- "/vol/milkun1/Mirza_Cengic/"
      basepath_milkun2 <- "/vol/milkun2/Mirza_Cengic/"
      # .basepath_LU <- "/vol/milkun1/Mirza_Cengic/Projects/Land_use/"
      basepath_milkun5 <- "/vol/milkun5/Merit/"
      basepath_milkun17 <- "/vol/milkun17/"
    }
  }
  if (method == "sysname")
  {
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



#' Milkunize2
#'
#' Generate file path for the milkun drives. Version 2 of the function is for updated milkun drives (milkundata, milkunB, and milkunarc)
#'
#' @param path Path that will be milkunized
#' @param drive Milkun drive. One in c("home", "archive", "data").
#' @param method Method how the local system is detected. Either sysname (windows or linux), or user (mcengic on cluster or mirzacengic on the laptop).
#'
#' @return Folder path with milkun2 location
#' @export
#'
#' @examples milkunize("Projects/Land_use")
milkunize2 <- function(path, drive = "home", method = "user")
{

  stopifnot(drive %in% c("home", "archive", "data"), method == "user")

  if (method == "user")
  {
    if(Sys.info()["user"] == "mirzacengic"){
      basepath_milkunB <- "/home/mirzacengic/milkunB/"
      basepath_milkunarc <- "/home/mirzacengic/milkunarc/"
      basepath_milkundata <- "/home/mirzacengic/milkundata/"
    }
    if (Sys.info()["user"] == "mcengic")
    {
      basepath_milkunB <- "/vol/milkunB/mcengic/"
      basepath_milkunarc <- "/vol/milkunarc/mcengic/"
      basepath_milkundata <- "/vol/milkundata/"
    }
    if(Sys.info()["user"] == "mirza")
      {
      basepath_milkunB <- "/home/mirza/milkunB/"
      basepath_milkunarc <- "/home/mirza/milkunarc/"
      basepath_milkundata <- "/home/mirza/milkundata/"
    }
  }
  if (method == "sysname")
  {
    if(Sys.info()["sysname"] == "Windows"){

      basepath_milkunB <- "M:/"
      basepath_milkunarc <- "R:/"
      basepath_milkundata <- "Z:/"

    } else {

      if (Sys.info()["user"] == "mirzacengic"){
        basepath_milkunB <- "/home/mirzacengic/milkunB/"
        basepath_milkunarc <- "/home/mirzacengic/milkunarc/"
        basepath_milkundata <- "/home/mirzacengic/milkundata/"
      }
      if (Sys.info()["user"] == "mcengic")
      {
        basepath_milkunB <- "/vol/milkunB/mcengic/"
        basepath_milkunarc <- "/vol/milkunarc/mcengic/"
        basepath_milkundata <- "/vol/milkundata/"
      }
    }
  }


  if (drive == "home")
  {
    path <- paste0(basepath_milkunB, path)
  }
  if (drive == "archive")
  {
    path <- paste0(basepath_milkunarc, path)
  }
  if (drive == "data")
  {
    path <- paste0(basepath_milkundata, path)
  }

  return(path)
}
