# TODOs

-   Update `export_print_recipients` to respect q key `mode.{canton}.constraints`

-   Finish to implement `question_intro_lvl`, `question_intro_i` and `question_intro_j`

-   Rename all occurences of `publitest` to `polling_agency`

-   Rename `id_statistik_aargau` to `id_statistical_office`

-   Remove `github::jeroen/rsvg` remote from DESCRIPTION as soon as rsvg v2.1.3+ is released.

## Other

-   Outstanding adaptions in the old codebase to questionnaire changes in this pkg:

    -   variable renamings:

        -   reading in publitest data: `info_src_reader_letters_comments` -> `info_src_letters_comments`

        -   `political_interest` -> rename to `political_interest_cantonal` \@ \[ 2018-09-23, 2018-11-25, 2020-09-27 \]

        -   `sighting_political_ads` -> `sighting_political_ads_cantonal_proposals`

        -   `intensity_political_discussions` -> `intensity_political_discussions_cantonal_proposals`

        -   Information source items:

            -   `information_source_discussions` -> `cantonal_information_source_discussions`
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
