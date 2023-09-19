# fokus

<a href="https://cran.r-project.org/package=fokus" class="pkgdown-release"><img src="https://r-pkg.org/badges/version/fokus" alt="CRAN Status" /></a>

fokus allows to (pre-)process and clean the raw data, analyze and visualize the cleaned data, create the questionnaires and provides other utility functions around the FOKUS post-voting surveys by the Centre for Democracy Studies Aarau (ZDA) at the University of Zurich, Switzerland.

## Installation

To install the latest development version of fokus, run the following in R:

``` r
if (!("remotes" %in% rownames(installed.packages()))) {
  install.packages(pkgs = "remotes",
                   repos = "https://cloud.r-project.org/")
}

remotes::install_gitlab(repo = "zdaarau/rpkgs/fokus")
```

## Package configuration

Some of fokus’s functionality is controlled via package-specific global configuration which can either be set via [R options](https://rdrr.io/r/base/options.html) or [environment variables](https://en.wikipedia.org/wiki/Environment_variable) (the former take precedence). This configuration includes:

::: {.table-wide}

| **Description**                                                                                                                                                                      | **R option**                    | **Environment variable**        | **Default value** |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------|:--------------------------------|:------------------|
| Maximal timespan to preserve the package’s [pkgpins](https://pkgpins.rpkg.dev/) cache. Cache entries older than this will be deleted upon package loading.                           | `fokus.global_max_cache_age`    | `FOKUS_GLOBAL_MAX_CACHE_AGE`    | `"1 day"`         |
| Path to the working directory (the local instance of the [`fokus_private` repository](https://gitlab.com/zdaarau/private/fokus_private)). Defaults to the current working directory. | `fokus.path_repo_private`       | `FOKUS_PATH_REPO_PRIVATE`       |                   |
| Local filesystem path to copy the built fokus qstnr to (e.g. a Git repository that in turn deploys to a static website).                                                             | `fokus.qstnr.local_deploy_path` | `FOKUS_QSTNR_LOCAL_DEPLOY_PATH` |                   |

:::

## Private FOKUS directory structure

For part of this package’s functionality, a separate private directory (defined by the [package configuration option](https://fokus.rpkg.dev/reference/pkg_config.html) `path_private`) is required which is expected to be organized according to a very specific structure. This private directory i.a. must contain additional sensitive, non-public (survey) data under the `input/` subdirectory and certain files are written to its `output/` subdirectory.

<details>
<summary>
<strong>Directory structure schema</strong>
</summary>

``` default
fokus_private
├── bibliography
│   ├── zotero_c2d.bib
│   └── zotero_c2d.json
├── bin
│   └── pandoc
│       ├── linux
│       ├── macos
│       └── windows
├── config
│   ├── csl
│   ├── css
│   ├── shared_pandoc_variables
│   │   ├── online_de.yaml
│   │   ├── online_en.yaml
│   │   ├── print_de.yaml
│   │   └── print_en.yaml
│   ├── config.toml
│   ├── output.yaml
│   ├── pandoc_template.tex
│   ├── shared_header-includes.tex
│   └── ...
├── input
│   └── data
│       └── {canton}
│           ├── easyvote_municipalities_{ballot_date}.csv
│           ├── online_participation_codes_{ballot_date}.txt
│           ├── survey_data_{ballot_date}.xlsx
│           ├── survey_data_{ballot_date}_*.xlsx
│           ├── survey_data_preliminary_{ballot_date}.xlsx
│           ├── voting_register_data_extra_{date_delivery_statistical_office}.xlsx
│           ├── voting_register_ids_{ballot_date}.csv
│           └── ...
├── fonts
│   └── ...
├── images
│   ├── {canton}
│   │   └── {ballot_date}
│   └── ...
├── output
│   ├── data
│   │   ├── internal
│   │   │   ├── r
│   │   │   ├── spss
│   │   │   └── stata
│   │   ├── public
│   │   └── polling_agency
│   │       └── {canton}
│   │           └── {ballot_date}_print_recipients.csv
│   ├── images
│   │   ├── {ballot_date}
│   │   │   └── {canton}
│   │   │       └── ...
│   │   └── qr_codes
│   │       └── {ballot_date}_{canton}.zip
│   ├── questionnaires
│   │   ├── questionnaire_{ballot_date}_{canton}.csv
│   │   ├── questionnaire_{ballot_date}_{canton}.html
│   │   ├── questionnaire_{ballot_date}_{canton}.md
│   │   └── questionnaire_{ballot_date}_{canton}.xlsx
│   ├── publications
│   │   ├── libs
│   │   └── ...
│   └── rmd
│       └── {ballot_date}
│           └── {canton}
│               └── plots
├── print_docs
│   └── {canton}
│       ├── invitation_{ballot_date}.pdf
│       ├── questionnaire_print_{ballot_date}.pdf
│       └── reminder_{ballot_date}.pdf
├── rmd
│   ├── snippets
│   │   ├── {canton}
│   │   │   ├── {ballot_date}_cantonal_proposal_#.Rmd
│   │   │   ├── {ballot_date}_opinion_formation_and_participation.Rmd
│   │   │   ├── {ballot_date}_special_*.Rmd
│   │   │   ├── {ballot_date}_special_*_summary.Rmd
│   │   │   └── {ballot_date}_summary.Rmd
│   │   ├── imprint_de.Rmd
│   │   ├── imprint_en.Rmd
│   │   └── methodological_description.Rmd
│   ├── data_overview.Rmd
│   ├── questionnaire.Rmd
│   ├── paper_{ballot_date}_{canton}.Rmd
│   ├── report_{ballot_date}_{canton}.Rmd
│   ├── report_cantonal_majoritarian_{ballot_date}_{canton}.Rmd
│   ├── report_cantonal_proportional_{ballot_date}_{canton}.Rmd
│   ├── report_federal_majoritarian_{ballot_date}_{canton}.Rmd
│   ├── report_federal_proportional_{ballot_date}_{canton}.Rmd
│   └── special_*_{ballot_date}_{canton}.Rmd
├── README.Rmd
└── ...
```

The following placeholders are used in the schema above:

-   `...` for further files and/or folders
-   `*` for a variable character sequence
-   `#` for a count starting with `1`
-   `{canton}` for the name of the FOKUS-covered canton (in lower case), e.g. `aargau`
-   `{ballot_date}` for the FOKUS-covered ballot date (in the format `YYYY-MM-DD`), e.g. `2018-09-23`
-   `{date_delivery_statistical_office}` for the delivery date of the voting register data provided by the cantonal statistical office (in the format `YYYY-MM-DD`), e.g. `2019-09-11`

</details>

## Documentation

[![Netlify Status](https://api.netlify.com/api/v1/badges/0cc31095-153a-4d21-bec7-be8dd936ddf1/deploy-status)](https://app.netlify.com/sites/fokus-rpkg-dev/deploys)

The documentation of this package is found [here](https://fokus.rpkg.dev).

## Abbreviations

The abbreviations used to name things (function and parameter names etc.) in this package.

<details>
<summary>
<strong>Table of abbreviations</strong>
</summary>

| **Full expression(s)**                  | **Abbreviation** |
|:----------------------------------------|:-----------------|
| abbreviate, abbreviation                | abbr             |
| abbreviations                           | abbrs            |
| absolute                                | abs              |
| argument                                | arg              |
| arguments                               | args             |
| attribute                               | attr             |
| attributes                              | attrs            |
| authenticate, authentication            | auth             |
| authentications                         | auths            |
| background                              | bg               |
| bibliographies                          | bibs             |
| bibliography                            | bib              |
| chapter                                 | chpt             |
| chapters                                | chpts            |
| character                               | chr              |
| characters                              | chrs             |
| column                                  | col              |
| columns                                 | cols             |
| combination                             | combo            |
| combinations                            | combos           |
| command                                 | cmd              |
| commands                                | cmds             |
| condition                               | cnd              |
| conditions                              | cnds             |
| configurations                          | configs          |
| configure, configuration                | config           |
| current                                 | cur              |
| database                                | db               |
| dataframe                               | df               |
| dataframe column                        | dfc              |
| dataframe row                           | dfr              |
| dataframes                              | dfs              |
| define, definition                      | def              |
| definitions                             | defs             |
| depend, dependency                      | dep              |
| dependencies                            | deps             |
| develop, development, developer         | dev              |
| developments, developers                | devs             |
| dictionaries                            | dicts            |
| dictionary                              | dict             |
| differences                             | diffs            |
| differentiate, difference               | diff             |
| directories                             | dirs             |
| directory                               | dir              |
| distribution                            | distro           |
| distributions                           | distros          |
| document                                | doc              |
| documents                               | docs             |
| double                                  | dbl              |
| doubles                                 | dbls             |
| element                                 | el               |
| elements                                | els              |
| environment                             | env              |
| environments                            | envs             |
| evaluate, evaluation                    | eval             |
| evaluations                             | evals            |
| exclude, exclusion                      | excl             |
| expression                              | expr             |
| expressions                             | exprs            |
| factor                                  | fct              |
| factors                                 | fcts             |
| figure                                  | fig              |
| figures                                 | figs             |
| filesystem                              | fs               |
| formula                                 | fm               |
| formulas, formulae                      | fms              |
| frequencies                             | freqs            |
| frequent, frequency                     | freq             |
| function                                | fn               |
| functions                               | fns              |
| generate, generation                    | gen              |
| generations                             | gens             |
| google                                  | g                |
| identifiers                             | ids              |
| identify, identifier                    | id               |
| image                                   | img              |
| images                                  | imgs             |
| include, inclusion                      | incl             |
| index                                   | i                |
| indexes, indices                        | ix               |
| information                             | info             |
| initialize, initialization              | init             |
| integer                                 | int              |
| integers                                | ints             |
| label                                   | lbl              |
| labels                                  | lbls             |
| language                                | lang             |
| languages                               | langs            |
| left-hand side                          | lhs              |
| level                                   | lvl              |
| levels                                  | lvls             |
| limit                                   | lim              |
| limits                                  | lims             |
| list                                    | ls               |
| logical                                 | lgl              |
| logicals                                | lgls             |
| management                              | mgmt             |
| Markdown                                | md               |
| message                                 | msg              |
| messages                                | msgs             |
| modifications                           | mods             |
| modify, modification                    | mod              |
| number                                  | nr               |
| number of                               | n                |
| numbers                                 | nrs              |
| numeric                                 | num              |
| numerics                                | nums             |
| object                                  | obj              |
| objects                                 | objs             |
| option                                  | opt              |
| options                                 | opts             |
| package                                 | pkg              |
| packages                                | pkgs             |
| parameterize, parameter                 | param            |
| parameters                              | params           |
| position                                | pos              |
| predicate                               | pred             |
| predicates                              | preds            |
| preparation                             | prep             |
| preparations                            | preps            |
| procedures                              | prcds            |
| proceed, procedure                      | prcd             |
| properties                              | props            |
| property                                | prop             |
| prototype                               | ptype            |
| prototypes                              | ptypes           |
| Quarto Markdown                         | qmd              |
| questionnaire                           | qstnr            |
| questionnaires                          | qstnrs           |
| R Markdown                              | rmd              |
| refer, reference                        | ref              |
| references                              | refs             |
| referendum                              | rfrnd            |
| referendums, referenda                  | rfrnds           |
| regular expression, regular expressions | regex            |
| relative                                | rel              |
| remove, removal                         | rm               |
| repositories                            | repos            |
| repository                              | repo             |
| request                                 | req              |
| requests                                | reqs             |
| respond, response                       | resp             |
| responses                               | resps            |
| right-hand side                         | rhs              |
| roxygen2                                | roxy             |
| separate, separator                     | sep              |
| separators                              | seps             |
| sequence                                | seq              |
| sequences                               | seqs             |
| snippet                                 | snip             |
| snippets                                | snips            |
| source                                  | src              |
| sources                                 | srcs             |
| specifications                          | specs            |
| specify, specification                  | spec             |
| string                                  | str              |
| strings                                 | strs             |
| structure                               | struct           |
| structures                              | structs          |
| supplemental, supplementary             | suppl            |
| symbolize, symbol                       | sym              |
| symbols                                 | syms             |
| tables                                  | tbls             |
| tabulate, table                         | tbl              |
| template                                | tpl              |
| templates                               | tpls             |
| temporary                               | tmp              |
| value                                   | val              |
| values                                  | vals             |
| variable                                | var              |
| variables                               | vars             |
| vectorize, vector                       | vctr             |
| vectors                                 | vctrs            |
| verbatim                                | verb             |
| version                                 | vrsn             |
| versions                                | vrsns            |
| working directory                       | wd               |

</details>

## Development

### R Markdown format

This package’s source code is written in the [R Markdown](https://rmarkdown.rstudio.com/) file format to facilitate practices commonly referred to as [*literate programming*](https://en.wikipedia.org/wiki/Literate_programming). It allows the actual code to be freely mixed with explanatory and supplementary information in expressive Markdown format instead of having to rely on [`#` comments](https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Comments) only.

All the `.gen.R` suffixed R source code found under [`R/`](https://gitlab.com/zdaarau/rpkgs/fokus/-/tree/master/R/) is generated from the respective R Markdown counterparts under [`Rmd/`](https://gitlab.com/zdaarau/rpkgs/fokus/-/tree/master/Rmd/) using [`pkgpurl::purl_rmd()`](https://pkgpurl.rpkg.dev/dev/reference/purl_rmd.html)[^1]. Always make changes only to the `.Rmd` files – never the `.R` files – and then run `pkgpurl::purl_rmd()` to regenerate the R source files.

### Coding style

This package borrows a lot of the [Tidyverse](https://www.tidyverse.org/) design philosophies. The R code adheres to the principles specified in the [Tidyverse Design Guide](https://principles.tidyverse.org/) wherever possible and is formatted according to the [Tidyverse Style Guide](https://style.tidyverse.org/) (TSG) with the following exceptions:

-   Line width is limited to **160 characters**, double the [limit proposed by the TSG](https://style.tidyverse.org/syntax.html#long-lines) (80 characters is ridiculously little given today’s high-resolution wide screen monitors).

    Furthermore, the preferred style for breaking long lines differs. Instead of wrapping directly after an expression’s opening bracket as [suggested by the TSG](https://style.tidyverse.org/syntax.html#long-lines), we prefer two fewer line breaks and indent subsequent lines within the expression by its opening bracket:

    ``` r
    # TSG proposes this
    do_something_very_complicated(
      something = "that",
      requires = many,
      arguments = "some of which may be long"
    )

    # we prefer this
    do_something_very_complicated(something = "that",
                                  requires = many,
                                  arguments = "some of which may be long")
    ```

    This results in less vertical and more horizontal spread of the code and better readability in pipes.

-   Usage of [magrittr’s compound assignment pipe-operator `%<>%`](https://magrittr.tidyverse.org/reference/compound.html) is desirable[^2].

-   Usage of [R’s right-hand assignment operator `->`](https://rdrr.io/r/base/assignOps.html) is not allowed[^3].

-   R source code is *not* split over several files as [suggested by the TSG](https://style.tidyverse.org/package-files.html) but instead is (as far as possible) kept in the single file [`Rmd/fokus.Rmd`](https://gitlab.com/zdaarau/rpkgs/fokus/-/tree/master/Rmd/fokus.Rmd) which is well-structured thanks to its [Markdown support](#r-markdown-format).

As far as possible, these deviations from the TSG plus some additional restrictions are formally specified in the [lintr configuration file](https://github.com/jimhester/lintr#project-configuration) [`.lintr`](.lintr), so lintr can be used right away to check for formatting issues:

``` r
pkgpurl::lint_rmd()
```

---

[^1]: This naming convention as well as the very idea to leverage the R Markdown format to author R packages was originally proposed by Yihui Xie. See his excellent [blog post](https://yihui.name/rlp/) for more detailed information about the benefits of literate programming techniques and some practical examples. Note that using `pkgpurl::purl_rmd()` is a less cumbersome alternative to the Makefile approach outlined by him.

[^2]: The TSG [explicitly instructs to avoid this operator](https://style.tidyverse.org/pipes.html#assignment-2) – presumably because it’s relatively unknown and therefore might be confused with the forward pipe operator `%>%` when skimming code only briefly. I don’t consider this to be an actual issue since there aren’t many sensible usage patterns of `%>%` at the beginning of a pipe sequence inside a function – I can only think of creating side effects and relying on [R’s implicit return of the last evaluated expression](https://rdrr.io/r/base/function.html). Therefore – and because I really like the `%<>%` operator – it’s usage is welcome.

[^3]: The TSG [explicitly accepts `->` for assignments at the end of a pipe sequence](https://style.tidyverse.org/pipes.html#assignment-2) while Google’s R Style Guide [considers this bad practice](https://google.github.io/styleguide/Rguide.html#right-hand-assignment) because it “makes it harder to see in code where an object is defined”. I second the latter.
