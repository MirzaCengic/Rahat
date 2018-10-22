#' Insert SLURM header
#'
#' Use this function to insert SLURM header to the top of the current R script.
#' This function will only work in RStudio, as it uses \code{rstudioapi} package to add text. Default values are higly customized for me!
#'
#' @param partition Character. Cluster partition. Default is milkun. Use either milkun or milkunshort.
#' @param email_type Character. Type of email to send to user. See SLURM help. Default is FAIL.
#' @param email Character. Email address to which send the emails to. Default is mirzaceng@gmail.com.
#' @param memory Character. Memory allocated to the process. Default is 20G. Add the required unit to the memory amount.
#' @param time Character. Time allocated to the process. Default is 6 hours (6:00:00).
#' @param log_file Character. Path for the log file. Default path is empty. Example: \code{log_file = "/vol/milkun/my_log.log"}
#'
#' @return None.
#' @export
#'
#' @examples insert_slurm_header()
#' @importFrom glue glue
#' @importFrom rstudioapi insertText
#'
insert_slurm_header <- function(partition = "milkun", email_type = "FAIL", email = "mirzaceng@gmail.com",
                                memory = "20G", time = "6:00:00", log_file = "")
{

  slurm_text <- glue::glue("
#!/usr/bin/env Rscript

#SBATCH --partition={partition}
#SBATCH --mail-type={email_type}
#SBATCH --mail-user={email}
#SBATCH --time={time}
#SBATCH --output \"{log_file}\"
#SBATCH --mem={memory}
\n
\n")

  rstudioapi::insertText(location = c(1, 1), text = slurm_text)

}
