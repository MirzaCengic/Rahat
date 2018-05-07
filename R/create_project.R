#' Create new project scaffolding.
#'
#' Create all the scaffolding for a new project in a new directory.
#' The scaffolding includes a \code{README.Rmd} file, different folders to hold raw data, analyses, etc, and \code{testthat} infrastructure. Also, optionally, set a GitHub repo and add Travis-CI.
#'
#' @param name Name of the new project. A new folder will be created with that name.
#' @param github Logical. Create GitHub repo? Note this requires a \code{GITHUB_PAT}. See \code{\link[devtools]{use_github}}.
#' @param private_repo Logical. Default is FALSE.
#' @param travis Logical. Set Travis? If TRUE, a badge will be added automatically to README.Rmd. But the project will need to be activated at \url{https://travis-ci.org/profile}.
#' @param manuscript Logical. Create manuscript folder. Default is TRUE.
#' @note This function has been forked and modified from \code{github.com/pakillo/template}.
#'
#' @return A new directory with R package structure, slightly modified.
#' @export
#' @import devtools
#'
create_project <- function(name, github = FALSE, private_repo = FALSE, manuscript = TRUE, travis = FALSE)
{
  devtools::create(name)
  try(use_package_doc(name), silent = TRUE)
  try(use_readme_rmd(name), silent = TRUE)
  # use_data_raw(name)
  # use_testthat(name)

  dir.create(file.path(name, "Data"))
  dir.create(file.path(name, "Data_raw"))
  dir.create(file.path(name, "Analyses"))
  dir.create(file.path(name, "Tests"))

  if (manuscript)
  {
    dir.create(file.path(name, "Manuscript"))
  }

  cat("\n^Analyses$ \n^Manuscript$ \n", sep = "",
      file = file.path(name, ".Rbuildignore"), append = TRUE)

  if (github)
  {
    use_github(pkg = name, private = private_repo)
    use_github_links(name)

    if (travis)
    {
      use_travis(name)
      cat("\n\n\n[![Travis-CI Build Status](https://travis-ci.org/",
          devtools:::github_info(name)$username, "/",
          name, ".svg?branch=master)](https://travis-ci.org/",
          devtools:::github_info(name)$username, "/", name, ")",
          file = file.path(name, "README.Rmd"), sep = "", append = TRUE)
    }
  }
}
