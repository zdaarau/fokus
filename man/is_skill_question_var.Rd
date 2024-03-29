% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fokus.gen.R
\name{is_skill_question_var}
\alias{is_skill_question_var}
\title{Determine whether variable is skill question}
\usage{
is_skill_question_var(var_names)
}
\arguments{
\item{var_names}{A character vector of FOKUS variable names.}
}
\value{
A logical vector of the same length as \code{var_names}.
}
\description{
Determines for each variable whether or not it is a skill question.
}
\details{
Note that the determination is performed by simply parsing \code{var_names}.
}
\seealso{
Other variable-related functions:
\code{\link{add_vars_to_combos}()},
\code{\link{var_lbl}()},
\code{\link{var_lvls}()},
\code{\link{var_proposal_nr}()},
\code{\link{var_skill_question_nr}()},
\code{\link{var_title}()},
\code{\link{var_val_set}()}
}
\concept{vars}
