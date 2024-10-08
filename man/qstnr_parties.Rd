% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{qstnr_parties}
\alias{qstnr_parties}
\title{Get political parties}
\usage{
qstnr_parties(ballot_date = pal::pkg_config_val("ballot_date"))
}
\value{
A \link[tibble:tbl_df-class]{tibble}.
}
\description{
Returns a tibble of ballot-date-specific political party metadata defined in the \link[=raw_qstnr]{raw FOKUS questionnaire data}.
}
\seealso{
Other questionnaire-internal functions:
\code{\link{qstnr_item_val}()},
\code{\link{qstnr_response_option_codes}()}
}
\concept{qstnr_internal}
\keyword{internal}
