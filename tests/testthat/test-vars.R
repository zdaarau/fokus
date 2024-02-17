# shortening_rules ----
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

# shorten_var_names ----
test_that("`shorten_var_names` is reversible for all qstnr variable names", {

  comparison <- tibble::tibble(name = unique(qstnrs$variable_name),
                               shortened = shorten_var_names(var_names = name,
                                                             max_n_char = Inf),
                               reversed = shorten_var_names(var_names = shortened,
                                                            reverse = TRUE,
                                                            max_n_char = Inf))
  expect_identical(object = comparison$reversed,
                   expected = comparison$name)
})

# add_vars_to_combos ----
test_that("`add_vars_to_combos` returns predictable results", {
  expect_snapshot_value(combos_proposals(ballot_date = "2023-06-18",
                                         canton = "aargau",
                                         incl_nr = FALSE) |>
                          add_vars_to_combos(var_names = c("age_group", "favored_party")),
                        style = "json2")
})
