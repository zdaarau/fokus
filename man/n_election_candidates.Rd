% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{n_election_candidates}
\alias{n_election_candidates}
\title{Get number of (officially registered) majoritarian election candidates}
\usage{
n_election_candidates(
  ballot_date = pal::pkg_config_val("ballot_date"),
  lvl = lvls(ballot_date, canton, ballot_type = "election"),
  canton = cantons(ballot_date),
  election_nr = 1L
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

\item{election_nr}{Election number. A positive integerish scalar.}
}
\value{
An integer scalar.
}
\description{
Determines the number of (officially registered) candidates of a majority election at the specified ballot date on the specified political level.
}
\examples{
fokus::n_election_candidates(ballot_date = "2019-10-20",
                             lvl = "cantonal",
                             canton = "aargau")
}
\seealso{
Other election predicate functions:
\code{\link{combos_elections}()},
\code{\link{election_candidates}()},
\code{\link{election_name}()},
\code{\link{election_names_combined}()},
\code{\link{election_parties}()},
\code{\link{election_tickets}()},
\code{\link{n_election_seats}()},
\code{\link{past_election_date}()},
\code{\link{requires_candidate_registration}()}
}
\concept{predicate_election}
