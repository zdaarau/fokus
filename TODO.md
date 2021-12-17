# TODOs

-   q clean-ups:

    -   Rename all occurences of `publitest` to `polling_agency`
    -   Rename `id_statistik_aargau` to `id_statistical_office`
    -   Use EN instead of DE values in `who` key
    -   Replace all hardcoded occurences of "Aargau"/"aargau" with `canton`-based R code

-   Remove `github::jeroen/rsvg` remote from DESCRIPTION as soon as rsvg v2.1.3+ is released (containing [PR #27](https://github.com/jeroen/rsvg/pull/27)).

-   Remove `github::r-lib/asciicast` remote from DESCRIPTION as soon as asciicast v1.0.1+ is released (containing [PR
    #28](https://github.com/r-lib/asciicast/pull/28))

-   q: Consider introducing a mechanism to define truly hierarchical first-item question intros on table lvl above `item` lvl. But maybe not worth the effort?
    Wait until we conduct an online survey by ourselves to get better understanding of actual requirements!

-   Somehow, including multiple asciicasts in the same Rmd fails (both via asciicast's knitr engine as well as embedding the generated asciicast htmlwidget via
    `asciicast::asciinema_player()`), thus the second asciicast containing an intentionally triggered error in the raw q had to be removed.

    -> Investigate the actual reason of the inclusion failure (and report/fix upstream)!

    The removed part is:

        If some mistake that breaks questionnaire generation is present in the raw questionnaire, like a syntax error in embedded R code for example, an error
        is thrown and the progress output stops, allowing to easily locate the source position of the mistake:

        ```{r, echo = FALSE}
        fs::path_package("asciicasts/gen_q_tibble-failed.json",
                         package = "fokus") %>%
          asciicast::read_cast() %>%
          # playback speed is not stored in the asciicast itself, so has to be set here
          asciicast::asciinema_player(speed = 0.75)
        ```

        As one can see from the output above, the error occurred when processing key `variable_label`, and from further above we can see that the key belongs to
        the item `first_name` which in turn is defined under branch path `00_statistik_aargau.002_to_publitest`.

## Other

-   Outstanding adaptions in the old codebase to questionnaire changes in this pkg:

    -   variable renamings:

        -   Information source items:

            -   `information_source_official_easyvote_booklet` -> `information_source_easyvote_booklet`
            -   `information_source_cantonal_election_booklet` -> `cantonal_information_source_election_booklet`
            -   `information_source_official_federal_booklet` -> `federal_information_source_official_booklet`
            -   `information_source_cantonal_online_tutorial` -> `cantonal_information_source_online_tutorial`
            -   `information_source_official_cantonal_booklet` -> `cantonal_proposals_information_source_official_booklet`
            -   `information_source_cantonal_webpage` -> `cantonal_proposals_information_source_official_webpage`
            -   `information_source_*` -> `cantonal_proposals_information_source_*` (all items for cantonal proposals)

-   supplemental date-specific TOML questionnaire files:

    -   figure out why there's `mode = "majority"` defined under table `cantonal.aargau.election.majoritarian.1` (seems bollocks)

-   [ ] Consider relying on external package for frequency tables and other summary statistics. A good (but a bit aged) overview of available packages is found
    [here](https://dabblingwithdata.wordpress.com/2017/12/20/my-favourite-r-package-for-frequency-tables/)

-   [ ] Create an R package to facilitate creating [Table-Schema](https://specs.frictionlessdata.io/table-schema/)-compatible questionnaires in TOML format.
    Note there's an R package [tableschema.r](https://libraries.frictionlessdata.io/docs/table-schema/rlang) to work with the Table Schema format (validate
    etc.)

    Then, adapt the FOKUS questionnaire generation to rely on this package as far as possible.
