# TODOs

## Questionnaire 2021-11-28

Beurteilung Krisenmanagement national / kantonal

----------------------------------------------------------------------------------------------------------------------------------------------------------------

Vertrauen in - wissenschaftliche Fachleute (Epidemologen, Virologen, wissenschaftliche Taskforce) - nationale Institutionen (Bundesrat, BAG) - kantonale
Institutionen (Gesundsdepartement Gallati)

----------------------------------------------------------------------------------------------------------------------------------------------------------------

Zufriedenheit mit den Massnahmen der Regierung: - 4er-Skala

----------------------------------------------------------------------------------------------------------------------------------------------------------------

Sind Sie gegen Covid-19 geimpft? / Haben Sie sich gegen Covid-19 impfen lassen? - Ja - Ich überlege noch - Nein - Niemals!

alternativ: Vertrauen in die bislang zugelassenen Impfstoffe

----------------------------------------------------------------------------------------------------------------------------------------------------------------

Wünschen Sie sich, dass möglichst alle Ihre Mitmenschen geimpft sind?

Informationsquelle Covid-19 (sep. Item für 'Chat-Apps wie Telegram')

----------------------------------------------------------------------------------------------------------------------------------------------------------------

Argumente:

-   Nötigung
-   ...

## Other

-   Outstanding adaptions in the old codebase to questionnaire changes in this pkg:

    -   variable renamings:

        -   `sighting_political_ads` -> `sighting_political_ads_cantonal_proposals`
        -   `intensity_political_discussions` -> `intensity_political_discussions_cantonal_proposals`

-   supplemental date-specific TOML questionnaire files:

    -   figure out why there's `mode = "majority"` defined under table `cantonal.aargau.election.majoritarian.1` (seems bollocks)

-   [ ] Consider relying on external package for frequency tables and other summary statistics. A good (but a bit aged) overview of available packages is found
    [here](https://dabblingwithdata.wordpress.com/2017/12/20/my-favourite-r-package-for-frequency-tables/)

-   [ ] Create an R package to facilitate creating [Table-Schema](https://specs.frictionlessdata.io/table-schema/)-compatible questionnaires in TOML format.
    Note there's an R package [tableschema.r](https://libraries.frictionlessdata.io/docs/table-schema/rlang) to work with the Table Schema format (validate
    etc.)

    Then, adapt the FOKUS questionnaire generation to rely on this package as far as possible.
