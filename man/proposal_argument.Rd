% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{proposal_argument}
\alias{proposal_argument}
\title{Get referendum proposal argument}
\usage{
proposal_argument(
  ballot_date = pal::pkg_config_val("ballot_date"),
  lvl = lvls(ballot_date, canton, ballot_type = "referendum"),
  canton = cantons(ballot_date),
  proposal_nr = 1L,
  side = all_argument_sides,
  argument_nr = 1L,
  lang = pal::pkg_config_val("lang"),
  type = all_name_types
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
}

Only relevant if \code{lvl = "cantonal"}.}

\item{proposal_nr}{Proposal number. A positive integerish scalar.}

\item{side}{Proposal argument side. One of \code{"pro"} or \code{"contra"}.}

\item{argument_nr}{Proposal argument number. A positive integerish scalar.}

\item{lang}{Language. One of \code{"de"}.}

\item{type}{Name type. One of \code{"short"} or \code{"long"}.}
}
\value{
A character scalar.
}
\description{
Returns the specified referendum proposal argument's text of the specified type in the specified language.
}
\examples{
fokus::proposal_argument(ballot_date = "2018-09-23",
                         lvl = "cantonal",
                         canton = "aargau",
                         proposal_nr = 1,
                         side = "contra",
                         argument_nr = 3,
                         type = "long")
}
\seealso{
Other proposal predicate functions:
\code{\link{argument_proposal_nrs}()},
\code{\link{combos_proposal_arguments}()},
\code{\link{combos_proposal_main_motives}()},
\code{\link{combos_proposals}()},
\code{\link{has_proposal_arguments}()},
\code{\link{has_proposal_main_motives}()},
\code{\link{is_proposal_name_plural}()},
\code{\link{main_motive_proposal_nrs}()},
\code{\link{n_proposal_arguments}()},
\code{\link{n_proposal_main_motives}()},
\code{\link{proposal_arguments}()},
\code{\link{proposal_main_motives}()},
\code{\link{proposal_name}()},
\code{\link{proposal_name_gender}()},
\code{\link{proposal_type}()}
}
\concept{predicate_proposal}
