# proper implicit args / fall-backs ----
test_that("Predicate functions return correct default values", {

  expect_identical(ballot_types(),
                   "referendum")
  expect_identical(n_proposals(),
                   c(cantonal = 1L,
                     federal = 3L))
  expect_identical(n_elections(),
                   c(cantonal.proportional = 0L,
                     cantonal.majoritarian = 0L,
                     federal.proportional = 0L,
                     federal.majoritarian = 0L))
  expect_identical(has_ballot_type(),
                   c(cantonal.referendum = TRUE,
                     federal.referendum = TRUE))
  expect_identical(has_referendum(),
                   c(cantonal = TRUE,
                     federal = TRUE))
  expect_identical(has_election(),
                   c(cantonal.proportional = FALSE,
                     cantonal.majoritarian = FALSE,
                     federal.proportional = FALSE,
                     federal.majoritarian = FALSE))
  expect_identical(has_lvl(),
                   c(cantonal.referendum = TRUE,
                     cantonal.proportional.election = FALSE,
                     cantonal.majoritarian.election = FALSE))
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
  expect_identical(proposal_nrs(),
                   1L)
  expect_identical(election_nrs(),
                   integer())
  expect_identical(election_prcds(),
                   character())
  expect_identical(proposal_qstn_groups(),
                   c("argument", "main_motive", "skill_question"))
  expect_identical(qstn_groups_proposal_nrs(),
                   1L)
  expect_identical(proposal_type(),
                   "citizens' initiative")
  expect_identical(proposal_name(),
                   "Millionärssteuerinitiative")
  expect_identical(proposal_name_gender(),
                   "feminine")
  expect_identical(is_proposal_name_plural(),
                   FALSE)
  expect_true(has_proposal_arguments())
  expect_true(has_proposal_main_motives())
  expect_snapshot_value(proposal_arguments(),
                        style = "json2")
  expect_identical(proposal_argument(),
                   "Vermögenssteuer bringt Kantonshaushalt wieder ins Lot")
  expect_snapshot_value(proposal_main_motives(),
                        style = "json2")
  expect_identical(n_proposal_arguments(),
                   6L)
  expect_identical(n_proposal_main_motives(),
                   13L)
  expect_identical(combos_proposals(),
                   list(list(lvl = "cantonal",
                             proposal_nr = 1L),
                        list(lvl = "federal",
                             proposal_nr = 1L),
                        list(lvl = "federal",
                             proposal_nr = 2L),
                        list(lvl = "federal",
                             proposal_nr = 3L)))
  expect_snapshot_value(combos_proposal_arguments(),
                        style = "json2")
  expect_identical(combos_proposal_main_motives(),
                   list(list(lvl = "cantonal",
                             proposal_nr = 1L,
                             type = "yes"),
                        list(lvl = "cantonal",
                             proposal_nr = 1L,
                             type = "no")))
  expect_snapshot_error(election_name())
  expect_identical(election_names_combined(),
                   "")
  expect_snapshot_error(n_election_seats())
  expect_snapshot_error(election_candidates())
  expect_snapshot_error(n_election_candidates())
  expect_snapshot_error(election_parties())
  expect_snapshot_error(election_tickets())
  expect_snapshot_error(requires_candidate_registration())
  expect_identical(combos_elections(),
                   list())
  expect_identical(skill_question_nrs(),
                   integer())
  expect_identical(n_skill_questions(),
                   0L)
  expect_snapshot_error(skill_question())
  expect_snapshot_error(skill_question_response_options())
  expect_snapshot_error(skill_question_answer_nr())
  expect_identical(skill_question_proposal_nrs(),
                   1L)
  expect_identical(ballot_title(),
                   "Abstimmungstermin vom 23. September 2018")
  expect_snapshot_error(political_issues())
  expect_identical(postal_dispatch_way(),
                   "b")
  expect_snapshot_value(response_options(),
                        style = "json2")
})

test_that("Text phrasing functions return correct default values", {

  expect_snapshot_error(phrase_election_candidate())
})

# irrelevant `canton` if `lvl = "federal"` ----
test_that("for certain fns, `canton` is really ignored (i.e. not evaluated) if `lvl = \"federal\"`", {

  invalid_canton <- "kantonien"

  expect_identical(has_referendum(lvls = "federal",
                                  canton = invalid_canton),
                   c(federal = TRUE))
  expect_identical(has_proposal_nrs(lvls = "federal",
                                    canton = invalid_canton),
                   c(federal.1 = TRUE,
                     federal.2 = TRUE,
                     federal.3 = TRUE))
  expect_identical(proposal_nrs(lvl = "federal",
                                canton = invalid_canton),
                   1:3)
  expect_identical(proposal_type(lvl = "federal",
                                 canton = invalid_canton),
                   "citizens' initiative")
  expect_identical(proposal_name(lvl = "federal",
                                 canton = invalid_canton),
                   "Velo-Initiative")
  expect_identical(proposal_name_gender(lvl = "federal",
                                        canton = invalid_canton),
                   "feminine")
  expect_identical(is_proposal_name_plural(lvl = "federal",
                                           canton = invalid_canton),
                   FALSE)
  expect_false(has_proposal_arguments(lvl = "federal",
                                      canton = invalid_canton))
  expect_false(has_proposal_main_motives(lvl = "federal",
                                         canton = invalid_canton))
  expect_snapshot_value(proposal_arguments(ballot_date = "2021-11-28",
                                           lvl = "federal",
                                           canton = invalid_canton,
                                           proposal_nr = 2L),
                        style = "json2")
  expect_identical(proposal_argument(ballot_date = "2021-11-28",
                                     lvl = "federal",
                                     canton = invalid_canton,
                                     proposal_nr = 2L,
                                     argument_nr = 1L,
                                     side = "pro"),
                   "Verletzung Gewaltenteilung")
  expect_identical(n_proposal_arguments(lvl = "federal",
                                        canton = invalid_canton),
                   0L)
  expect_snapshot_value(proposal_main_motives(ballot_date = "2021-11-28",
                                              lvl = "federal",
                                              canton = invalid_canton,
                                              proposal_nr = 2L),
                        style = "json2")
  expect_identical(n_proposal_main_motives(lvl = "federal",
                                           canton = invalid_canton),
                   0L)
  expect_identical(n_skill_questions(lvl = "federal",
                                     canton = invalid_canton),
                   0L)
  expect_identical(skill_question(ballot_date = "2021-11-28",
                                  lvl = "federal",
                                  canton = invalid_canton,
                                  proposal_nr = 2L,
                                  skill_question_nr = 1L),
                   "Wer hat bisher die Mitglieder des Bundesgerichts gewählt?")
  expect_snapshot_value(skill_question_response_options(ballot_date = "2021-11-28",
                                                        lvl = "federal",
                                                        canton = invalid_canton,
                                                        proposal_nr = 2L,
                                                        skill_question_nr = 1L),
                        style = "json2")
  expect_identical(skill_question_answer_nr(ballot_date = "2021-11-28",
                                            lvl = "federal",
                                            canton = invalid_canton,
                                            proposal_nr = 2L,
                                            skill_question_nr = 1L),
                   2L)
  expect_identical(skill_question_proposal_nrs(ballot_date = "2021-11-28",
                                               lvl = "federal",
                                               canton = invalid_canton),
                   2:3)
})
