
#' Create new project scaffolding.
#'
#' Create all the scaffolding for a new project in a new directory. The scaffolding includes a \code{README.Rmd} file, different folders to hold raw data, analyses, etc, and \code{testthat} infrastructure. Also, optionally, set a GitHub repo and add Travis-CI.
#'
#' @param name Name of the new project. A new folder will be created with that name.
#' @param github Logical. Create GitHub repo? Note this requires a \code{GITHUB_PAT}. See \code{\link[devtools]{use_github}}.
#' @param private.repo Logical. Default is TRUE.
#' @return A new directory with R package structure, slightly modified.
#' @export
#' @importFrom devtools create use_package_doc use_readme_rmd
#' @importFrom fs dir_create
new_project <- function(name, github = FALSE, private.repo = TRUE){

  devtools::create(name)

  try(use_package_doc(name), silent = TRUE)

  try(use_readme_rmd(name), silent = TRUE)

  use_testthat(name)

  fs::dir_create(file.path(name, "Data"))
  fs::dir_create(file.path(paste0(name, "/Data/", "Data_RAW")))
  fs::dir_create(file.path(paste0(name, "/Data/", "Data_derived")))
  fs::dir_create(file.path(name, "Analyses"))
  fs::dir_create(file.path(name, "Manuscript"))

  cat("\n^analyses$ \n^manuscript$ \n", sep = "",
      file = file.path(name, ".Rbuildignore"), append = TRUE)

  if (github){
    use_github(pkg = name, private = private.repo)
    use_github_links(name)

   }

}

setwd("Y:/Mirza_Cengic/Temp/")
new_project("Testis")
