# fokus: Provides API-like functions around the FOKUS Research Project of the Centre for Democracy Studies Aarau (ZDA)

fokus provides functions to (pre-)process and clean the raw data, analyze and visualize the cleaned data and create the questionnaires of the FOKUS post-voting surveys as well as other utility functions around the whole research project.

## Details

### R Options

The following package-specific R options are used to control the package’s functionality:

| **name**                      | **description**                                                                                                                | **set automatically by `init()`** |
|:------------------------------|:-------------------------------------------------------------------------------------------------------------------------------|:----------------------------------|
| `fokus.path_wd`               | the path to the working directory (the local instance of the `fokus_aargau` repository); only set automatically for user=salim | ✅                                 |
| `fokus.global_cache_lifespan` | the default cache lifespan for all functions taking a `cache_lifespan` argument; defaults to 30 days                           | ✅                                 |
| `fokus.canton`                | the name of the canton to which canton-specific actions are to be adjusted in lower case; defaults to `"aargau"`               | ✅                                 |
| `fokus.date_ballot`           | the date of the ballot to which ballot-specific actions are to be adjusted                                                     | ❌                                 |

### Working directory structure

For part of this package’s functionality, the following structure of the working directory (defined by the R option `fokus.path_wd`) is expected (input) or enforced (output):

``` fs
fokus_private/
├──bibliography/
|  ├──zotero_c2d.bib
|  └──zotero_c2d.json
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
├──questionnaires/
|  ├──print/
|  |  └──questionnaire_print_[BALLOT_DATE]_[CANTON].pdf
|  ├──[BALLOT_DATE].toml
|  └──questionnaire.toml
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
|  |  └──publitest/
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
├──tools/
|  └──pandoc/
|     ├──linux/
|     ├──macos/
|     └──windows/
├──README.Rmd
└──...
```

The following placeholders are used in the schema above:

-   `...` for further files and/or folders
-   `*` for a variable character sequence
-   `#` for a count starting with `1`
-   `[CANTON]` for the name of the current canton ~~given by the R option `fokus.canton`~~ (in lower case)
-   `[BALLOT_DATE]` for the current ballot date ~~given by the R option `fokus.date_ballot`~~ (in the format `YYYY-MM-DD`)
-   `[STATOFF_DELIVERY_DATE]` for the delivery date of the voting register data provided by the cantonal statistical office

## Installation

To install the latest development version of fokus, run the following in R:

``` r
if (!("remotes" %in% rownames(installed.packages()))) {
  install.packages(pkgs = "remotes",
                   repos = "https://cloud.r-project.org/")
}

remotes::install_gitlab(repo = "zdaarau/fokus")
```

## Development

### R Markdown format

This package’s source code is written in the [R Markdown](https://rmarkdown.rstudio.com/) file format to facilitate practices commonly referred to as [*literate programming*](https://en.wikipedia.org/wiki/Literate_programming). It allows the actual code to be freely mixed with explanatory and supplementary information in expressive Markdown format instead of having to rely on [`#` comments](https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Comments) only.

All the `-GEN.R` suffixed R source code found under [`R/`](R/) is generated from the respective R Markdown counterparts under [`Rmd/`](Rmd/) using [`pkgpurl::purl_rmd()`](https://gitlab.com/salim_b/r/pkgs/pkgpurl/)[^1]. Always make changes only to the `.Rmd` files – never the `.R` files – and then run `pkgpurl::purl_rmd()` to regenerate the R source files.

### Coding style

This package borrows a lot of the [Tidyverse](https://www.tidyverse.org/) design philosophies. The R code adheres to the principles specified in the [Tidyverse Design Guide](https://principles.tidyverse.org/) wherever possible and is formatted according to the [Tidyverse Style Guide](https://style.tidyverse.org/) (TSG) with the following exceptions:

-   Line width is limited to **160 characters**, double the [limit proposed by the TSG](https://style.tidyverse.org/syntax.html#long-lines) (80 characters is ridiculously little given today’s high-resolution wide screen monitors).

-   Usage of [magrittr’s compound assignment pipe-operator `%<>%`](https://magrittr.tidyverse.org/reference/compound.html) is desirable[^2].

-   Usage of [R’s right-hand assignment operator `->`](https://rdrr.io/r/base/assignOps.html) is not allowed[^3].

-   R source code is *not* split over several files as [suggested by the TSG](https://style.tidyverse.org/package-files.html) but instead is (as far as possible) kept in the single file [`Rmd/fokus.Rmd`](Rmd/fokus.Rmd) which is well-structured thanks to its [Markdown support](#r-markdown-format).

As far as possible, these deviations from the TSG plus some additional restrictions are formally specified in the [lintr configuration file](https://github.com/jimhester/lintr#project-configuration) [`.lintr`](.lintr), so lintr can be used right away to check for formatting issues:

``` r
pkgpurl::lint_rmd()
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[^1]: This naming convention as well as the very idea to leverage the R Markdown format to author R packages was originally proposed by Yihui Xie. See his excellent [blog post](https://yihui.name/rlp/) for more detailed information about the benefits of literate programming techniques and some practical examples. Note that using `pkgpurl::purl_rmd()` is a less cumbersome alternative to the Makefile approach outlined by him.

[^2]: The TSG [explicitly instructs to avoid this operator](https://style.tidyverse.org/pipes.html#assignment-1) – presumably because it’s relatively unknown and therefore might be confused with the forward pipe operator `%>%` when skimming code only briefly. I don’t consider this to be an actual issue since there aren’t many sensible usage patterns of `%>%` at the beginning of a pipe sequence inside a function – I can only think of creating side effects and relying on [R’s implicit return of the last evaluated expression](https://rdrr.io/r/base/function.html). Therefore – and because I really like the `%<>%` operator – it’s usage is welcome.

[^3]: The TSG [explicitly accepts `->` for assignments at the end of a pipe sequence](https://style.tidyverse.org/pipes.html#assignment-1) while Google’s R Style Guide [considers this bad practice](https://google.github.io/styleguide/Rguide.html#right-hand-assignment) because it “makes it harder to see in code where an object is defined”. I second the latter.
