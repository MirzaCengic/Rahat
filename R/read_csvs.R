#' Read multiple csv files
#'
#' This function is \emph{deprecated}. Use purrr with \code{map(read_csv); reduce(rbind)}approach.
#' This function will load all the csv files from the given directory with the selected pattern.
#'
#' @param folder_path Folder path where the files will be loaded from.
#' @param pattern Pattern to match files. Default is "*.csv"
#'
#' @return Multiple dataframes
#' @export
#'
#' @examples None.
read_csvs <- function(folder_path, pattern = "*.csv$")
{
  files_to_read <- list.files(path = folder_path, pattern = pattern)

  for(file in files_to_read)
  {
    perpos <- which(strsplit(file, "")[[1]] == ".")
    assign(gsub(" ","", substr(file, 1, perpos - 1)), read.csv(paste(folder_path, file, sep = "")), envir = .GlobalEnv)
  }
}
