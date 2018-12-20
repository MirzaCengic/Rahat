#'
#' Insert script description
#'
#' Use this function to insert template used to give some basic information on the current R script to its top.
#' This function will only work in RStudio, as it uses \code{rstudioapi} package to add text.
#'
#' @param script_title Character. Script title.
#' @param project_title Character. To which project does script relate to.
#' @param script_type Character. Type of script. Eg. data analysis, modeling, plotting.
#' @param script_description Character. What it does, and why, in more detial.
#' @param script_date Character. Default is Day, Month Year.
#' @param creator_name Character. Default is "Mirza Cengic".
#' @param creator_email Character. Default is "mirzaceng@gmail.com"
#'
#' @return None.
#' @export
#'
#' @examples insert_slurm_header()
#' @importFrom glue glue
#' @importFrom rstudioapi insertText
insert_script_description <- function(script_title = "Script title", project_title = "My research project", script_type = "Data processing",
                                      script_description = "Description", script_date = Rahat::today(format = "human"), creator_name = "Mirza Cengic",
                                creator_email = "mirzaceng@gmail.com"
                                )
{

  # if (template = "science")
  # {}
  # if (template = "fun")
  # {}


  slurm_text <- glue::glue(
"
##########################################
####  {script_title}
##########################################
#### | Project name: {project_title}
#### | Script type: {script_type}
#### | What it does: {script_description}
#### | Date created: {script_date}
#### | Creator: {creator_name}
#### | Contact: {creator_email}
##########################################

\n
\n")

  rstudioapi::insertText(location = c(1, 1), text = slurm_text)

}


