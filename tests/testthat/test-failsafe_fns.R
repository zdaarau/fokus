# not FOKUS-covered ----
test_that("relevant fns don't fail when non-FOKUS-covered", {

  expect_identical(proposal_nrs(ballot_date = "2019-10-20"),
                   integer())
  expect_identical(election_nrs(ballot_date = "2018-09-23"),
                   integer())
  expect_identical(election_prcds(ballot_date = "2018-09-23"),
                   character())
  expect_identical(proposal_qstn_groups(ballot_date = "2019-10-20"),
                   character())
  expect_identical(proposal_qstn_groups(ballot_date = "2021-11-28",
                                        lvl = "cantonal"),
                   character())
  expect_identical(qstn_groups_proposal_nrs(ballot_date = "2019-10-20"),
                   integer())
  expect_identical(qstn_groups_proposal_nrs(ballot_date = "2021-11-28",
                                            lvl = "cantonal"),
                   integer())
  expect_identical(n_proposals(ballot_date = "2019-10-20"),
                   c(cantonal = 0L,
                     federal = 0L))
  expect_identical(n_proposals(ballot_date = "2021-11-28",
                               lvls = "cantonal"),
                   c(cantonal = 0L))
  expect_identical(n_elections(ballot_date = "2018-09-23"),
                   c(cantonal.proportional = 0L,
                     cantonal.majoritarian = 0L,
                     federal.proportional = 0L,
                     federal.majoritarian = 0L))
  expect_identical(n_elections(ballot_date = "2020-10-18",
                               lvls = "federal"),
                   c(federal.proportional = 0L,
                     federal.majoritarian = 0L))
  expect_identical(has_ballot_type(ballot_date = "2019-10-20",
                                   lvls = "federal",
                                   ballot_type = "referendum"),
                   c(federal.referendum = FALSE))
  expect_identical(has_referendum(ballot_date = "2019-10-20",
                                  lvls = "federal"),
                   c(federal = FALSE))
  expect_identical(has_election(ballot_date = "2018-09-23"),
                   c(cantonal.proportional = FALSE,
                     cantonal.majoritarian = FALSE,
                     federal.proportional = FALSE,
                     federal.majoritarian = FALSE))
  expect_identical(has_election(ballot_date = "2020-10-18",
                                lvls = "federal"),
                   c(federal.proportional = FALSE,
                     federal.majoritarian = FALSE))
  expect_identical(has_lvl(ballot_date = "2021-11-28",
                           lvl = "cantonal"),
                   c(cantonal.referendum = FALSE,
                     cantonal.proportional.election = FALSE,
                     cantonal.majoritarian.election = FALSE))
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
                        ballot_type = "referendum"),
                   character())
  expect_identical(prcds(ballot_date = "2018-09-23"),
                   character())
  expect_identical(prcds(ballot_date = "2020-10-18",
                         lvl = "federal"),
                   character())
  expect_identical(skill_question_nrs(ballot_date = "2018-09-23",
                                      lvl = "cantonal",
                                      proposal_nr = NULL),
                   integer())
  expect_identical(skill_question_nrs(ballot_date = "2021-11-28",
                                      lvl = "cantonal",
                                      proposal_nr = 1L),
                   integer())
  expect_identical(skill_question_nrs(ballot_date = "2019-10-20",
                                      proposal_nr = 1L),
                   integer())
  expect_identical(n_skill_questions(ballot_date = "2018-09-23",
                                     lvl = "cantonal",
                                     proposal_nr = NULL),
                   0L)
  expect_identical(n_skill_questions(ballot_date = "2021-11-28",
                                     lvl = "cantonal",
                                     proposal_nr = 1L),
                   0L)
  expect_identical(n_skill_questions(ballot_date = "2019-10-20",
                                     proposal_nr = 1L),
                   0L)
})
