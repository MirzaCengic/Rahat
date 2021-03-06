% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_project.R
\name{create_project}
\alias{create_project}
\title{Create new project scaffolding.}
\usage{
create_project(name, github = FALSE, private_repo = FALSE,
  manuscript = TRUE, travis = FALSE)
}
\arguments{
\item{name}{Name of the new project. A new folder will be created with that name.}

\item{github}{Logical. Create GitHub repo? Note this requires a \code{GITHUB_PAT}. See \code{\link[devtools]{use_github}}.}

\item{private_repo}{Logical. Default is FALSE.}

\item{manuscript}{Logical. Create manuscript folder. Default is TRUE.}

\item{travis}{Logical. Set Travis? If TRUE, a badge will be added automatically to README.Rmd. But the project will need to be activated at \url{https://travis-ci.org/profile}.}
}
\value{
A new directory with R package structure, slightly modified.
}
\description{
Create all the scaffolding for a new project in a new directory.
The scaffolding includes a \code{README.Rmd} file, different folders to hold raw data, analyses, etc, and \code{testthat} infrastructure. Also, optionally, set a GitHub repo and add Travis-CI.
}
\note{
This function has been forked and modified from \code{github.com/pakillo/template}.
}
