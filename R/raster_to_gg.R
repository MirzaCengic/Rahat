#' Raster* to ggplot object
#' Convert raster* object to dataframe suitable for making maps with ggplot2.
#'
#' @param x Raster* object.
#'
#' @return dataframe
#' @export
#'
#' @examples
#' library(raster)
#' library(Rahat)
#'
#' raster_to_gg(raster(volcano))
raster_to_gg <- function(x)
{
  stopifnot(inherits(x, "Raster"))

  x <- as(x, "SpatialPixelsDataFrame")
  x <- as.data.frame(x)
  return(x)
}
