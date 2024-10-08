% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{raw_pick_right}
\alias{raw_pick_right}
\title{Pick right raw questionnaire value}
\usage{
raw_pick_right(x, key = NULL, ballot_date, canton)
}
\arguments{
\item{x}{Questionnaire key. A list object.}

\item{key}{Questionnaire key name, used to determine the correct default value fallback. A character scalar or \code{NULL}. If \code{NULL}, no fallback is used (and an
error is thrown in case none of the subkeys matches).}

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
}
\value{
Value of \code{x} that corresponds to \code{canton} and \code{ballot_date}.
}
\description{
Picks the right value of a certain raw questionnaire key based on ballot date and canton (recursively).
}
\seealso{
Other raw questionnaire data functions:
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
\code{\link{raw_qstnr_suppl_proposal_safe}()},
\code{\link{raw_qstnr_suppl_skill_question}()},
\code{\link{raw_qstnr_suppl_skill_questions}()},
\code{\link{raw_qstnrs_suppl}}
}
\concept{qstnr_raw}
\keyword{internal}
