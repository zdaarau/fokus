``` fs
fokus_private/
├──bibliography/
|  ├──zotero_c2d.bib
|  └──zotero_c2d.json
├──bin/
|  └──pandoc/
|     ├──linux/
|     ├──macos/
|     └──windows/
├──config/
|  ├──csl/
|  ├──css/
|  ├──shared_pandoc_variables/
|  |  ├──online_de.yaml
|  |  ├──online_en.yaml
|  |  ├──print_de.yaml
|  |  └──print_en.yaml
|  ├──config.toml
|  ├──output.yaml
|  ├──pandoc_template.tex
|  ├──shared_header-includes.tex
|  └──...
├──data/
|  └──[CANTON]/
|     ├──easyvote_municipalities_[BALLOT_DATE].csv
|     ├──online_participation_codes_[BALLOT_DATE].txt
|     ├──survey_data_[BALLOT_DATE].xlsx
|     ├──survey_data_[BALLOT_DATE]_*.xlsx
|     ├──survey_data_preliminary_[BALLOT_DATE].xlsx
|     ├──voting_register_data_extra_[STATOFF_DELIVERY_DATE].xlsx
|     ├──voting_register_ids_[BALLOT_DATE].csv
|     └──...
├──fonts/
|  └──...
├──images/
|  ├──[CANTON]/
|  |  └──[BALLOT_DATE]
|  └──...
├──print_docs/
|  └──[CANTON]/
|     ├──invitation_[BALLOT_DATE].pdf
|     ├──questionnaire_print_[BALLOT_DATE].pdf
|     └──reminder_[BALLOT_DATE].pdf
├──rmd/
|  ├──snippets/
|  |  ├──[CANTON]/
|  |  |  ├──[BALLOT_DATE]_cantonal_proposal_#.Rmd
|  |  |  ├──[BALLOT_DATE]_opinion_formation_and_participation.Rmd
|  |  |  ├──[BALLOT_DATE]_special_*.Rmd
|  |  |  ├──[BALLOT_DATE]_special_*_summary.Rmd
|  |  |  └──[BALLOT_DATE]_summary.Rmd
|  |  ├──imprint_de.Rmd
|  |  ├──imprint_en.Rmd
|  |  └──methodological_description.Rmd
|  ├──data_overview.Rmd
|  ├──questionnaire.Rmd
|  ├──paper_[BALLOT_DATE]_[CANTON].Rmd
|  ├──report_[BALLOT_DATE]_[CANTON].Rmd
|  ├──report_cantonal_majoritarian_[BALLOT_DATE]_[CANTON].Rmd
|  ├──report_cantonal_proportional_[BALLOT_DATE]_[CANTON].Rmd
|  ├──report_federal_majoritarian_[BALLOT_DATE]_[CANTON].Rmd
|  ├──report_federal_proportional_[BALLOT_DATE]_[CANTON].Rmd
|  └──special_*_[BALLOT_DATE]_[CANTON].Rmd
├──output/
|  ├──data/
|  |  ├──internal/
|  |  |  ├──r/
|  |  |  ├──spss/
|  |  |  └──stata/
|  |  ├──public/
|  |  └──polling_agency/
|  |     └──[CANTON]/
|  |        └──[BALLOT_DATE]_print_recipients.csv
|  ├──images/
|  |  ├──[BALLOT_DATE]/
|  |  |  └──[CANTON]/
|  |  |     └──...
|  |  └──qr_codes/
|  |     └──[BALLOT_DATE]_[CANTON].zip
|  ├──questionnaires/
|  |  ├──questionnaire_[BALLOT_DATE]_[CANTON].csv
|  |  ├──questionnaire_[BALLOT_DATE]_[CANTON].html
|  |  ├──questionnaire_[BALLOT_DATE]_[CANTON].md
|  |  └──questionnaire_[BALLOT_DATE]_[CANTON].xlsx
|  ├──publications/
|  |  ├──libs/
|  |  └──...
|  └──rmd/
|     └──[BALLOT_DATE]/
|        └──[CANTON]/
|           └──plots/
├──README.Rmd
└──...
```

The following placeholders are used in the schema above:

-   `...` for further files and/or folders
-   `*` for a variable character sequence
-   `#` for a count starting with `1`
-   `[CANTON]` for the name of the FOKUS canton (in lower case), e.g. `aargau`
-   `[BALLOT_DATE]` for the FOKUS-covered ballot date (in the format `YYYY-MM-DD`), e.g. `2018-09-23`
-   `[STATOFF_DELIVERY_DATE]` for the delivery date of the voting register data provided by the cantonal statistical office (in the format `YYYY-MM-DD`), e.g.
    `2019-09-11`
