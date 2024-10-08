% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{election_nrs}
\alias{election_nrs}
\title{Get ballot's election numbers}
\usage{
election_nrs(
  ballot_date = pal::pkg_config_val("ballot_date"),
  lvl = lvls(ballot_date, canton, ballot_type = "election"),
  canton = cantons(ballot_date),
  prcd = prcds(ballot_date = ballot_date, lvl = lvl, canton = canton)
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

\item{prcd}{Election procedure. One of \code{"proportional"} or \code{"majoritarian"}.}
}
\value{
An integer vector.
}
\description{
Determines the election numbers covered by the FOKUS survey for the specified canton at the specified ballot date on the specified political level and of the
specified election procedure(s).
}
\examples{
fokus::election_nrs(ballot_date = "2019-10-20",
                    lvl = "federal",
                    canton = "aargau",
                    prcd = "majoritarian")

# in case of no (matching) elections, an empty integer vector is returned
fokus::election_nrs(ballot_date = "2019-10-20",
                    lvl = "cantonal",
                    canton = "aargau",
                    prcd = "proportional")
}
\seealso{
Other fundamental predicate functions:
\code{\link{ballot_types}()},
\code{\link{cantons}()},
\code{\link{combos_ballot_types}()},
\code{\link{election_prcds}()},
\code{\link{has_ballot_type}()},
\code{\link{has_election}()},
\code{\link{has_election_nrs}()},
\code{\link{has_lvl}()},
\code{\link{has_proposal_nrs}()},
\code{\link{has_referendum}()},
\code{\link{lvls}()},
\code{\link{n_elections}()},
\code{\link{n_proposals}()},
\code{\link{prcds}()},
\code{\link{proposal_nrs}()},
\code{\link{proposal_qstn_groups}()},
\code{\link{qstn_groups_proposal_nrs}()},
\code{\link{survey_channels}()}
}
\concept{predicate_fundamental}
