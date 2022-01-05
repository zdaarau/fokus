# DEFAULT VALUES ----
## proper implicit args / fall-backs ----
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
  expect_snapshot(proposal_argument())
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

## irrelevant `canton` if `lvl = "federal"` ----
test_that("`canton` is really irrelevant if `lvl = \"federal\"` for certain fns", {

  invalid_canton <- "kantonien"

  expect_snapshot(proposal_type(lvl = "federal",
                                canton = invalid_canton))
  expect_snapshot(proposal_name(lvl = "federal",
                                canton = invalid_canton))
  expect_snapshot(proposal_name_gender(lvl = "federal",
                                       canton = invalid_canton))
  expect_snapshot(proposal_arguments(ballot_date = "2021-11-28",
                                     lvl = "federal",
                                     canton = invalid_canton,
                                     proposal_nr = 2L))
  expect_snapshot(proposal_argument(ballot_date = "2021-11-28",
                                    lvl = "federal",
                                    canton = invalid_canton,
                                    proposal_nr = 2L,
                                    argument_nr = 1L,
                                    side = "pro"))
  expect_snapshot(n_proposal_arguments(lvl = "federal",
                                       canton = invalid_canton))
  expect_snapshot(proposal_main_motives(ballot_date = "2021-11-28",
                                        lvl = "federal",
                                        canton = invalid_canton,
                                        proposal_nr = 2L))
  expect_snapshot(n_proposal_main_motives(lvl = "federal",
                                          canton = invalid_canton))
  expect_snapshot(election_name(ballot_date = "2019-10-20",
                                lvl = "federal",
                                canton = invalid_canton,
                                prcd = "proportional"))
  expect_snapshot(n_skill_questions(lvl = "federal",
                                    canton = invalid_canton))
  expect_snapshot(skill_question(ballot_date = "2021-11-28",
                                 lvl = "federal",
                                 canton = invalid_canton,
                                 proposal_nr = 2L,
                                 skill_question_nr = 1L))
  expect_snapshot(skill_question_response_options(ballot_date = "2021-11-28",
                                                  lvl = "federal",
                                                  canton = invalid_canton,
                                                  proposal_nr = 2L,
                                                  skill_question_nr = 1L))
  expect_snapshot(skill_question_answer_nr(ballot_date = "2021-11-28",
                                           lvl = "federal",
                                           canton = invalid_canton,
                                           proposal_nr = 2L,
                                           skill_question_nr = 1L))
})

# FAILSAFE FUNCTIONS ----
## not FOKUS-covered ----
test_that("relevant fns don't fail when non-FOKUS-covered", {

  expect_identical(n_proposals(ballot_date = "2021-11-28",
                               lvls = "cantonal"),
                   0L)
  expect_identical(n_elections(ballot_date = "2018-09-23"),
                   0L)
  expect_identical(n_elections(ballot_date = "2020-10-18",
                               lvls = "federal"),
                   0L)
  expect_identical(has_ballot_types(ballot_date = "2019-10-20",
                                    lvls = "federal",
                                    ballot_types = "referendum"),
                   FALSE)
  expect_identical(has_referendum(ballot_date = "2019-10-20",
                                  lvls = "federal"),
                   FALSE)
  expect_identical(has_election(ballot_date = "2018-09-23"),
                   FALSE)
  expect_identical(has_election(ballot_date = "2020-10-18",
                                lvls = "federal"),
                   FALSE)
  expect_identical(has_lvl(ballot_date = "2021-11-28",
                           lvl = "cantonal"),
                   FALSE)
  expect_identical(has_proposal_nrs(ballot_date = "2019-10-20"),
                   FALSE)
  expect_identical(has_proposal_nrs(ballot_date = "2021-11-28",
                                    lvls = "cantonal"),
                   FALSE)
  expect_identical(has_proposal_nrs(ballot_date = "2021-11-28",
                                    lvls = "federal",
                                    proposal_nrs = 4L),
                   c(federal.4 = FALSE))
  expect_identical(has_election_nrs(ballot_date = "2018-09-23"),
                   FALSE)
  expect_identical(has_election_nrs(ballot_date = "2020-10-18",
                                    lvls = "federal"),
                   FALSE)
  expect_identical(has_election_nrs(ballot_date = "2019-10-20",
                                    lvls = "cantonal",
                                    prcds = "proportional"),
                   FALSE)
  expect_identical(has_election_nrs(ballot_date = "2019-10-20",
                                    lvls = "federal",
                                    prcds = "proportional",
                                    election_nrs = 2L),
                   c(federal.proportional.2 = FALSE))
  expect_identical(lvls(ballot_date = "2019-10-20",
                        ballot_types = "referendum"),
                   character())
  expect_identical(prcds(ballot_date = "2018-09-23"),
                   character())
  expect_identical(prcds(ballot_date = "2020-10-18",
                         lvls = "federal"),
                   character())
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
