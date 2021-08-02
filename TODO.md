# TODOs

-   [ ] Consider incorporating the questionnaire source TOML files directly into this pkg.

    Pro: Less error-prone; truth anchor generation would work without fokus_private repo and at build time!

    Contra: Our questionnaire sources would become AGPL-3-licensed and publicly accessible. Any real threats?

-   [ ] Consider relying on external package for frequency tables and other summary statistics. A good (but a bit aged) overview of available packages is found
    [here](https://dabblingwithdata.wordpress.com/2017/12/20/my-favourite-r-package-for-frequency-tables/)

-   [ ] Create an R package to facilitate creating [Table-Schema](https://specs.frictionlessdata.io/table-schema/)-compatible questionnaires in TOML format.
    Note there's an R package [tableschema.r](https://libraries.frictionlessdata.io/docs/table-schema/rlang) to work with the Table Schema format (validate
    etc.)
