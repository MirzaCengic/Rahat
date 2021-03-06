% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/raster_to_gg.R
\name{raster_to_gg}
\alias{raster_to_gg}
\title{Raster* to ggplot object
Convert raster* object to dataframe suitable for making maps with ggplot2.}
\usage{
raster_to_gg(x)
}
\arguments{
\item{x}{Raster* object.}
}
\value{
dataframe
}
\description{
Raster* to ggplot object
Convert raster* object to dataframe suitable for making maps with ggplot2.
}
\examples{
library(raster)
library(Rahat)

raster_to_gg(raster(volcano))
}
