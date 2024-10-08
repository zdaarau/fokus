% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus-package.R
\docType{package}
\name{fokus-package}
\alias{fokus}
\alias{fokus-package}
\title{fokus: Provides an API around the FOKUS Post-voting Surveys}
\description{
fokus allows to (pre-)process and clean the raw data, analyze and visualize the cleaned data, create the questionnaires and provides other utility functions around the FOKUS post-voting surveys by the Centre for Democracy Studies Aarau (ZDA) at the University of Zurich, Switzerland.
}
\section{Package configuration}{


Some of fokus's functionality is controlled via package-specific global configuration which can either be set via \href{https://rdrr.io/r/base/options.html}{R options} or \href{https://en.wikipedia.org/wiki/Environment_variable}{environment variables} (the former take precedence). This configuration includes:\tabular{llll}{
   \strong{Description} \tab \strong{R option} \tab \strong{Environment variable} \tab \strong{Default value} \cr
   FOKUS-covered ballot date to fall back to in various functions of this package when it isn't explicitly specified. Basically a means to globally define the ballot date to be processed. One of \code{"2018-09-23"}, \code{"2018-11-25"}, \code{"2019-10-20"}, \code{"2020-09-27"}, \code{"2020-10-18"}, \code{"2021-11-28"}, \code{"2023-06-18"} or \code{"2024-10-20"}. \tab \code{fokus.ballot_date} \tab \code{R_FOKUS_BALLOT_DATE} \tab \code{as.Date("2018-09-23")} \cr
   FOKUS-covered canton name to fall back to in various functions of this package when it isn't explicitly specified. Basically a means to globally define the canton to be processed. One of \code{"aargau"}. \tab \code{fokus.canton} \tab \code{R_FOKUS_CANTON} \tab \code{"aargau"} \cr
   Language to fall back to in various functions of this package when it isn't explicitly specified. Basically a means to globally define the language to process. One of \code{"de"} and \code{"en"}. \tab \code{fokus.lang} \tab \code{R_FOKUS_LANG} \tab \code{"de"} \cr
   Maximal timespan to preserve the package's \href{https://pkgpins.rpkg.dev/}{pkgpins} cache. Cache entries older than this will be deleted upon package loading. \tab \code{fokus.global_max_cache_age} \tab \code{R_FOKUS_GLOBAL_MAX_CACHE_AGE} \tab \code{"1 day"} \cr
   \href{https://gitlab.com/-/user_settings/personal_access_tokens}{Personal access token of a gitlab.com account} with access to the \href{https://gitlab.com/c2d-zda/private/fokus_private/}{private FOKUS repository}. \tab \code{fokus.token_repo_private} \tab \code{R_FOKUS_TOKEN_REPO_PRIVATE} \tab \code{Sys.getenv("GITLAB_COM_TOKEN")} \cr
}
}

\seealso{
Useful links:
\itemize{
  \item \url{https://fokus.rpkg.dev}
  \item \url{https://gitlab.com/zdaarau/rpkgs/fokus}
  \item Report bugs at \url{https://gitlab.com/zdaarau/rpkgs/fokus/issues}
}

}
\author{
\strong{Maintainer}: Salim Brüggemann \email{salim-b@pm.me} (\href{https://orcid.org/0000-0002-5329-5987}{ORCID})

Other contributors:
\itemize{
  \item  Centre for Democracy Studies Aarau (ZDA) \email{info@zdaarau.ch} [copyright holder]
}

}
\keyword{internal}
