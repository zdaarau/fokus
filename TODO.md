# TODOs

-   supplemental date-specific TOML questionnaire files:

    -   figure out why there's `mode = "majority"` defined under table `cantonal.aargau.election.majoritarian.1` (seems bollocks)

-   [ ] Replace the `is_initiative` key in the `proposal` sub-table of the supplementary date-specific TOML questionnaire files with a more informative `type`
    key (need to define its possible English values first).

-   [ ] Consider relying on external package for frequency tables and other summary statistics. A good (but a bit aged) overview of available packages is found
    [here](https://dabblingwithdata.wordpress.com/2017/12/20/my-favourite-r-package-for-frequency-tables/)

-   [ ] Create an R package to facilitate creating [Table-Schema](https://specs.frictionlessdata.io/table-schema/)-compatible questionnaires in TOML format.
    Note there's an R package [tableschema.r](https://libraries.frictionlessdata.io/docs/table-schema/rlang) to work with the Table Schema format (validate
    etc.)

    Then, adapt the FOKUS questionnaire generation to rely on this package as far as possible.
