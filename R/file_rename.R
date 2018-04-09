#' Rename file
#'
#' @param from File to be renamed
#' @param to Name of output file name
#'
#' @return None.
#'
#'
#' @examples None.
file_rename <- function(from, to) {
  todir <- dirname(to)
  if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
  file.rename(from = from,  to = to)
}

# my.file.rename(from = "C:/Users/msc2/Desktop/rabata.txt",
#                to = "C:/Users/msc2/Desktop/Halwa/BADMASHI/SCOP/rabata.txt")
