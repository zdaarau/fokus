% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{raw_qstnr_suppl_proposal_safe}
\alias{raw_qstnr_suppl_proposal_safe}
\title{Safely get raw proposal supplemental questionnaire data}
\usage{
raw_qstnr_suppl_proposal_safe(
  ballot_date = pal::pkg_config_val("ballot_date"),
  lvl = all_lvls,
  canton = pal::pkg_config_val("canton"),
  proposal_nr = NULL
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

\item{lvl}{Political level. One of \code{"cantonal"} or \code{"federal"}.}

\item{canton}{FOKUS-covered canton name. One of
\itemize{
\item \code{"aargau"}
}}

\item{proposal_nr}{Proposal number. Either a positive integerish scalar or \code{NULL} to return the data for all proposals.}
}
\value{
A \link[xfun:strict_list]{strict list}, or \code{NULL} if no referendums proposals were covered.
}
\description{
Returns a structured list of a proposal's data from the \link[=raw_qstnr_suppl]{supplemental date-specific FOKUS questionnaire data}, or \code{NULL} if no referendums
proposals were covered.
}
\examples{
fokus:::raw_qstnr_suppl_proposal_safe(ballot_date = "2019-10-20",
                                      lvl = "cantonal",
                                      canton = "aargau")
}
\seealso{
Other raw questionnaire data functions:
\code{\link{raw_pick_right}()},
\code{\link{raw_qstnr}},
\code{\link{raw_qstnr_suppl}()},
\code{\link{raw_qstnr_suppl_argument}()},
\code{\link{raw_qstnr_suppl_arguments}()},
\code{\link{raw_qstnr_suppl_election}()},
\code{\link{raw_qstnr_suppl_election_name}()},
\code{\link{raw_qstnr_suppl_elections}()},
\code{\link{raw_qstnr_suppl_lvl}()},
\code{\link{raw_qstnr_suppl_lvl_canton}()},
\code{\link{raw_qstnr_suppl_main_motives}()},
\code{\link{raw_qstnr_suppl_mode}()},
\code{\link{raw_qstnr_suppl_proposal}()},
\code{\link{raw_qstnr_suppl_proposal_name}()},
\code{\link{raw_qstnr_suppl_skill_question}()},
\code{\link{raw_qstnr_suppl_skill_questions}()},
\code{\link{raw_qstnrs_suppl}}
}
\concept{qstnr_raw}
\keyword{internal}
