# DEFAULT VALUES ----
test_that("Exported functions return correct default values", {

  expect_identical(ballot_types(),
                   "referendum")
  expect_identical(n_proposals(),
                   4L)
  expect_identical(n_elections(),
                   0L)
  expect_identical(has_ballot_types(),
                   c(TRUE, FALSE))
  expect_true(has_referendum())
  expect_false(has_election())
  expect_true(has_lvl())
  expect_identical(has_proposal_nrs(),
                   c(cantonal.1 = TRUE,
                     federal.1 = TRUE,
                     federal.2 = TRUE,
                     federal.3 = TRUE))
  expect_false(has_election_nrs())
  expect_identical(lvls(),
                   c("cantonal", "federal"))
  expect_identical(prcds(),
                   character())
  expect_identical(proposal_type(),
                   "citizens' initiative")
  expect_identical(proposal_name(),
                   "Millionärssteuerinitiative")
  expect_identical(proposal_name_gender(),
                   "feminine")
  expect_snapshot(proposal_arguments())
  expect_identical(n_proposal_arguments(),
                   6L)
  expect_snapshot(proposal_main_motives())
  expect_identical(n_proposal_main_motives(),
                   6L)
  expect_snapshot_error(election_name())
  expect_identical(election_names_combined(),
                   character())
  expect_snapshot_error(n_election_seats())
  expect_snapshot_error(election_candidates())
  expect_snapshot_error(n_election_candidates())
  expect_snapshot_error(election_candidate_string())
  expect_snapshot_error(election_parties())
  expect_snapshot_error(election_tickets())
  expect_snapshot_error(requires_candidate_registration())
  expect_identical(n_skill_questions(),
                   0L)
  expect_identical(ballot_title(),
                   "Abstimmungstermin vom 23. September 2018")
  expect_snapshot_error(political_issues())
  expect_snapshot(response_options())
})

# VARIABLE-RELATED ----
## shortening_rules ----
test_that("`shortening_rules` are non-overlapping", {

  # non-overlapping strings
  expect_true(
    shortening_rules %>%
      tibble::rowid_to_column() %>%
      purrr::pmap_lgl(~ shortening_rules %>%
                        dplyr::filter(dplyr::row_number() > ..1
                                      & stringr::str_detect(string = string,
                                                            pattern = glue::glue("(^|_)\\Q{..2}\\E(_|$)"))
                                      & stringr::str_detect(string = allowed_at,
                                                            pattern = ..4)) %>%
                        nrow() %>%
                        magrittr::equals(0L)) %>%
      all()
  )

  # non-overlapping replacements
  expect_true(
    shortening_rules %>%
      tibble::rowid_to_column() %>%
      purrr::pmap_lgl(~ shortening_rules %>%
                        dplyr::filter(dplyr::row_number() > ..1
                                      & stringr::str_detect(string = replacement,
                                                            pattern = glue::glue("(^|_)\\Q{..3}\\E(_|$)"))
                                      & stringr::str_detect(string = allowed_at,
                                                            pattern = ..4)) %>%
                        nrow() %>%
                        magrittr::equals(0L)) %>%
      all()
  )
})

## shorten_v_names ----
test_that("`shorten_v_names` is reversible for all q variable names", {

  comparison <- tibble::tibble(name = unique(qx$variable_name),
                               shortened = shorten_v_names(v_names = name,
                                                           max_n_char = NULL),
                               reversed = shorten_v_names(v_names = shortened,
                                                          reverse = TRUE,
                                                          max_n_char = NULL))
  expect_identical(object = comparison$reversed,
                   expected = comparison$name)
})
