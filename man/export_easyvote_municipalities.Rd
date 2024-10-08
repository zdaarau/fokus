% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{export_easyvote_municipalities}
\alias{export_easyvote_municipalities}
\title{Export easyvote municipality details}
\usage{
export_easyvote_municipalities(
  ballot_date = pal::pkg_config_val("ballot_date"),
  canton = cantons(ballot_date),
  upload_to_g_drive = TRUE,
  g_drive_folder =
    glue::glue("fokus/{canton}/Umfragen/Dateien für Umfrageinstitut/easyvote-Gemeinden/"),
  auth_token = pal::pkg_config_val("token_repo_private"),
  quiet = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{ballot_date}{FOKUS-covered ballot date. One of
\itemize{
\item \code{"2018-09-23"}
\item \code{"2018-11-25"}
\item \code{"2019-10-20"}
\item \code{"2020-09-27"}
\item \code{"2020-10-18"}
\item \code{"2021-11-28"}
\item \code{"2023-06-18"}
\item \code{"2024-10-20"}
}}

\item{canton}{FOKUS-covered canton name. One of
\itemize{
\item \code{"aargau"}
}}

\item{upload_to_g_drive}{Whether or not to upload the generated files to the Google Drive folder \code{g_drive_folder}.}

\item{g_drive_folder}{Google Drive folder to upload the generated files to. Ignored if \code{upload_to_g_drive = FALSE}.}

\item{auth_token}{\href{https://gitlab.com/-/user_settings/personal_access_tokens}{Personal access token of a gitlab.com account} with access to the \href{https://gitlab.com/c2d-zda/private/fokus_private/}{private FOKUS repository}.}

\item{quiet}{Whether or not to suppress printing status output from internal processing.}

\item{verbose}{Whether or not to print detailed status output from \link[=upload_to_g_drive]{Google Drive file upload}.}
}
\value{
A \link[tibble:tbl_df-class]{tibble} of the exported data, invisibly.
}
\description{
Exports a CSV dataset containing the columns \code{municipality}, \code{municipality_id}, \code{min_age} and \code{max_age} to the \link[=print_private_repo_structure]{private FOKUS repository}.
}
\details{
The meaning of the individual columns is as follows:\tabular{ll}{
   \strong{column name} \tab \strong{description} \cr
   \code{municipality} \tab official name of the municipality \cr
   \code{municipality_id} \tab \href{https://en.wikipedia.org/wiki/Community_Identification_Number#Switzerland}{official Swiss community identification number} (also called "GEOSTAT"/"BFS" number, see the \href{https://de.wikipedia.org/wiki/Gemeindenummer}{corresponding German Wikipedia article}) \cr
   \code{min_age} \tab lower age limit of the municipal subscription of the "easyvote" booklet \cr
   \code{max_age} \tab upper age limit of the municipal subscription of the "easyvote" booklet \cr
}
}
\seealso{
Other data export functions:
\code{\link{export_print_recipients}()},
\code{\link{export_qr_codes}()},
\code{\link{export_qstnr}()},
\code{\link{write_private_file}()}
}
\concept{data_export}
