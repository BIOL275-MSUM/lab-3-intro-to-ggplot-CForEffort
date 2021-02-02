Lab 3 Report
================
Faith
2021-02-02

Instructions for this lab report can be found on [Your assignment
section of Lab Assignment 3 Introduction to
ggplot2](https://biol275-msum.github.io/introduction-to-ggplot2.html#your-assignment)
on the lab website.

## Fireflies

> A. Insert an R code chunk and create a graph depicting the frequency
> distribution of the 35 mass measurements. It should have legible text
> and appropriate axis labels.

First the packages from tidyverse were read in.

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.2     v purrr   0.3.4
    ## v tibble  3.0.4     v dplyr   1.0.2
    ## v tidyr   1.1.2     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.0

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Then, those packages were read in and assigned the value of
firefly\_mass.

``` r
firefly_mass <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")
```

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   spermatophoreMass = col_double()
    ## )

``` r
firefly_mass
```

    ## # A tibble: 35 x 1
    ##    spermatophoreMass
    ##                <dbl>
    ##  1             0.047
    ##  2             0.037
    ##  3             0.041
    ##  4             0.045
    ##  5             0.039
    ##  6             0.064
    ##  7             0.064
    ##  8             0.065
    ##  9             0.079
    ## 10             0.07 
    ## # ... with 25 more rows

The data and packages were then used to create a histogram to depict the
spermatophore masses of the fireflies.

``` r
ggplot(data = firefly_mass) +
  geom_histogram(mapping = aes(x = spermatophoreMass), bins = 10,
                 boundary = 0, closed = "left", 
                 fill = "#8250e5", color = "black") +
  labs(x = "Spermatophore Mass (g)", y = "Frequency (Number of Individuals") +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    )
```

![](lab-report_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

> B. What type of graph did you choose in part (A)? Why?

A histogram was selected for depicting the firefly mass data. It was
chosen because the data being depicted is a numerical type of data but
there is only one set of data being examined. Histograms allow for clear
depiction of numerical data, especially when the data is a range of
values.

> C. Describe the shape of the frequency distribution. What are its main
> features?

The distribution of masses among the firefly spermatophores was heavily
in favor of masses between 0 and 0.1. With a bell curve appearance in
these values. Most of the masses appeared to fall between .05 and .075.
No data points exist between points .1 and .17. Finally after .17 there
are a couple outliers who were recorded having larger masses.

> D. What term would be used to describe the largest measurement in the
> frequency distribution? You can refer to the lecture slides, your
> notes, or the textbook.

Mode would be the term to refer to the largest measurement. The mode is
defined as the most frequently occurring value in the data set. Due to
this being a histogram, one single value is not represented by each bar
rather a range of values is represented by each bar this makes the mode
a range of values. The bar with the largest height indicates the more
commonly seen range of masses in the spermataphores, thus making that
bar representative of the mode.

## Bird orders

I read the data using the code provided by the instructor. The dataset
is from the auk package and was originally named ebird\_taxonomy. I
converted it to a tibble, removed non-species taxa, and named the new
dataset birds. This was done after the fireflies data, and tidyverse was
already read into the R script.

``` r
library(auk)                          # load the auk package
```

    ## auk 0.4.2 is designed for EBD files downloaded after 2019-08-15. 
    ## No EBD data directory set, see ?auk_set_ebd_path to set EBD_PATH 
    ## eBird taxonomy version:  2019

``` r
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa
```

> E. How many bird species are in the new birds dataset? How did you
> find out?

There are 10,721 bird species in this data set. This value was found
utilizing the count function.

``` r
count(birds)
```

    ## # A tibble: 1 x 1
    ##       n
    ##   <int>
    ## 1 10721

> H. How many orders are there? You can get this right by counting on
> the graph, but you will only get full points if you use some code to
> figure it out.

There are 41 orders of bird species. This value was found utilizing the
count function.

``` r
count(birds,order)
```

    ## # A tibble: 41 x 2
    ##    order                n
    ##    <chr>            <int>
    ##  1 Accipitriformes    252
    ##  2 Anseriformes       178
    ##  3 Apterygiformes       5
    ##  4 Bucerotiformes      72
    ##  5 Caprimulgiformes   597
    ##  6 Cariamiformes        2
    ##  7 Casuariiformes       4
    ##  8 Cathartiformes       7
    ##  9 Charadriiformes    379
    ## 10 Ciconiiformes       19
    ## # ... with 31 more rows

> F. Insert an R code chunk and create a graph depicting the
> distribution of orders in the birds dataset. Sort the orders with the
> most frequent on the left. It should have legible text and appropriate
> axis labels.

``` r
ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#c5351B",
          width = .75) +
  labs(x = "Orders", y = "Number of Species") +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(.9)),
    axis.text.x = element_text(angle = 90, hjust = 1),
    axis.ticks.x = element_blank()
  )
```

![](lab-report_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

> G. What kind of graph did you create? Why?

A bar graph was utilized to depict this information. This was done
because the variable being depicted is a categorical variable. The
information desired is orders of birds, therefore the data is best
depicted using a bar graph which can assign a single bar to each order.

## Links to peer review

I reviewed Logan Hillers’ lab report at this URL:
<https://github.com/BIOL275-MSUM/lab-3-intro-to-ggplot-LoganHillers.git>

Logan Hillers’ reviewed my lab report at this URL:
<https://github.com/BIOL275-MSUM/lab-3-intro-to-ggplot-CForEffort.git>

## Session Info

Here is my session information:

``` r
sessioninfo::session_info()
```

    ## - Session info ---------------------------------------------------------------
    ##  setting  value                       
    ##  version  R version 4.0.3 (2020-10-10)
    ##  os       Windows 10 x64              
    ##  system   x86_64, mingw32             
    ##  ui       RTerm                       
    ##  language (EN)                        
    ##  collate  English_United States.1252  
    ##  ctype    English_United States.1252  
    ##  tz       America/Chicago             
    ##  date     2021-02-02                  
    ## 
    ## - Packages -------------------------------------------------------------------
    ##  package     * version date       lib source        
    ##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 4.0.3)
    ##  auk         * 0.4.3   2020-11-23 [1] CRAN (R 4.0.3)
    ##  backports     1.1.10  2020-09-15 [1] CRAN (R 4.0.3)
    ##  broom         0.7.2   2020-10-20 [1] CRAN (R 4.0.3)
    ##  cellranger    1.1.0   2016-07-27 [1] CRAN (R 4.0.3)
    ##  cli           2.1.0   2020-10-12 [1] CRAN (R 4.0.3)
    ##  colorspace    1.4-1   2019-03-18 [1] CRAN (R 4.0.3)
    ##  crayon        1.3.4   2017-09-16 [1] CRAN (R 4.0.3)
    ##  curl          4.3     2019-12-02 [1] CRAN (R 4.0.3)
    ##  DBI           1.1.0   2019-12-15 [1] CRAN (R 4.0.3)
    ##  dbplyr        2.0.0   2020-11-03 [1] CRAN (R 4.0.3)
    ##  digest        0.6.27  2020-10-24 [1] CRAN (R 4.0.3)
    ##  dplyr       * 1.0.2   2020-08-18 [1] CRAN (R 4.0.3)
    ##  ellipsis      0.3.1   2020-05-15 [1] CRAN (R 4.0.3)
    ##  evaluate      0.14    2019-05-28 [1] CRAN (R 4.0.3)
    ##  fansi         0.4.1   2020-01-08 [1] CRAN (R 4.0.3)
    ##  farver        2.0.3   2020-01-16 [1] CRAN (R 4.0.3)
    ##  forcats     * 0.5.0   2020-03-01 [1] CRAN (R 4.0.3)
    ##  fs            1.5.0   2020-07-31 [1] CRAN (R 4.0.3)
    ##  generics      0.1.0   2020-10-31 [1] CRAN (R 4.0.3)
    ##  ggplot2     * 3.3.2   2020-06-19 [1] CRAN (R 4.0.3)
    ##  glue          1.4.2   2020-08-27 [1] CRAN (R 4.0.3)
    ##  gtable        0.3.0   2019-03-25 [1] CRAN (R 4.0.3)
    ##  haven         2.3.1   2020-06-01 [1] CRAN (R 4.0.3)
    ##  hms           0.5.3   2020-01-08 [1] CRAN (R 4.0.3)
    ##  htmltools     0.5.0   2020-06-16 [1] CRAN (R 4.0.3)
    ##  httr          1.4.2   2020-07-20 [1] CRAN (R 4.0.3)
    ##  jsonlite      1.7.1   2020-09-07 [1] CRAN (R 4.0.3)
    ##  knitr         1.30    2020-09-22 [1] CRAN (R 4.0.3)
    ##  labeling      0.4.2   2020-10-20 [1] CRAN (R 4.0.3)
    ##  lifecycle     0.2.0   2020-03-06 [1] CRAN (R 4.0.3)
    ##  lubridate     1.7.9   2020-06-08 [1] CRAN (R 4.0.3)
    ##  magrittr      1.5     2014-11-22 [1] CRAN (R 4.0.3)
    ##  modelr        0.1.8   2020-05-19 [1] CRAN (R 4.0.3)
    ##  munsell       0.5.0   2018-06-12 [1] CRAN (R 4.0.3)
    ##  pillar        1.4.6   2020-07-10 [1] CRAN (R 4.0.3)
    ##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.0.3)
    ##  purrr       * 0.3.4   2020-04-17 [1] CRAN (R 4.0.3)
    ##  R6            2.5.0   2020-10-28 [1] CRAN (R 4.0.3)
    ##  Rcpp          1.0.5   2020-07-06 [1] CRAN (R 4.0.3)
    ##  readr       * 1.4.0   2020-10-05 [1] CRAN (R 4.0.3)
    ##  readxl        1.3.1   2019-03-13 [1] CRAN (R 4.0.3)
    ##  reprex        0.3.0   2019-05-16 [1] CRAN (R 4.0.3)
    ##  rlang         0.4.8   2020-10-08 [1] CRAN (R 4.0.3)
    ##  rmarkdown     2.5     2020-10-21 [1] CRAN (R 4.0.3)
    ##  rstudioapi    0.11    2020-02-07 [1] CRAN (R 4.0.3)
    ##  rvest         0.3.6   2020-07-25 [1] CRAN (R 4.0.3)
    ##  scales        1.1.1   2020-05-11 [1] CRAN (R 4.0.3)
    ##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 4.0.3)
    ##  stringi       1.5.3   2020-09-09 [1] CRAN (R 4.0.3)
    ##  stringr     * 1.4.0   2019-02-10 [1] CRAN (R 4.0.3)
    ##  tibble      * 3.0.4   2020-10-12 [1] CRAN (R 4.0.3)
    ##  tidyr       * 1.1.2   2020-08-27 [1] CRAN (R 4.0.3)
    ##  tidyselect    1.1.0   2020-05-11 [1] CRAN (R 4.0.3)
    ##  tidyverse   * 1.3.0   2019-11-21 [1] CRAN (R 4.0.3)
    ##  utf8          1.1.4   2018-05-24 [1] CRAN (R 4.0.3)
    ##  vctrs         0.3.4   2020-08-29 [1] CRAN (R 4.0.3)
    ##  withr         2.3.0   2020-09-22 [1] CRAN (R 4.0.3)
    ##  xfun          0.19    2020-10-30 [1] CRAN (R 4.0.3)
    ##  xml2          1.3.2   2020-04-23 [1] CRAN (R 4.0.3)
    ##  yaml          2.2.1   2020-02-01 [1] CRAN (R 4.0.3)
    ## 
    ## [1] C:/Users/markr/OneDrive/Documents/R/win-library/4.0
    ## [2] C:/Program Files/R/R-4.0.3/library
