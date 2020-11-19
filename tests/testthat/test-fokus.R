# VARIABLE-RELATED ----
## shortening_rules ----
test_that("`shortening_rules()` are non-overlapping", {

  # non-overlapping strings
  expect_true(
    shortening_rules() %>%
      tibble::rowid_to_column() %>%
      purrr::pmap_lgl(~ shortening_rules() %>%
                        dplyr::filter(dplyr::row_number() > ..1
                                      & stringr::str_detect(string = string,
                                                            pattern = glue::glue("(^|_)\\Q{..2}\\E(_|$)"))
                                      & stringr::str_detect(string = allowed,
                                                            pattern = ..4)) %>%
                        nrow() %>%
                        magrittr::equals(0L)) %>%
      all()
  )

  # non-overlapping replacements
  expect_true(
    shortening_rules() %>%
      tibble::rowid_to_column() %>%
      purrr::pmap_lgl(~ shortening_rules() %>%
                        dplyr::filter(dplyr::row_number() > ..1
                                      & stringr::str_detect(string = replacement,
                                                            pattern = glue::glue("(^|_)\\Q{..3}\\E(_|$)"))
                                      & stringr::str_detect(string = allowed,
                                                            pattern = ..4)) %>%
                        nrow() %>%
                        magrittr::equals(0L)) %>%
      all()
  )
})
