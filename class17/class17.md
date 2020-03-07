Class 17
================

## Coronavirus

Here we analyze infection data for the 2019 novel Coronavirus COVID-19
(2019-nCoV) epidemic. The raw data is pulled from the Johns Hopkins
University Center for Systems Science and Engineering (JHU CCSE)
Coronavirus repository.

A CSV file is available here
<https://github.com/RamiKrispin/coronavirus-csv>

``` r
url <- "https://tinyurl.com/COVID-2019"
virus <- read.csv(url)

tail(virus)
```

    ##          Province.State Country.Region     Lat     Long       date cases
    ## 3028           Shanghai Mainland China 31.2020 121.4491 2020-03-06     3
    ## 3029            Sichuan Mainland China 30.6171 102.7103 2020-03-06    17
    ## 3030 Suffolk County, MA             US 42.3601 -71.0589 2020-03-06     1
    ## 3031           Xinjiang Mainland China 41.1129  85.2401 2020-03-06     1
    ## 3032             Yunnan Mainland China 24.9740 101.4870 2020-03-06     1
    ## 3033           Zhejiang Mainland China 29.1832 120.0934 2020-03-06    23
    ##           type
    ## 3028 recovered
    ## 3029 recovered
    ## 3030 recovered
    ## 3031 recovered
    ## 3032 recovered
    ## 3033 recovered

> Q1. How many total infected cases are there around the world?

``` r
total_cases <- sum(virus$cases)
total_cases
```

    ## [1] 161126

> Q2. How many deaths linked to infected cases have there been?

Lets have a look at the “$type” column

``` r
table(virus$type)
```

    ## 
    ## confirmed     death recovered 
    ##      1695       222      1116

``` r
inds <- virus$type == "death"
death_cases <- sum(virus[inds,"cases"])
```

> Q3. What is the overall death rate?

Percent death

``` r
round(death_cases/total_cases * 100,2)
```

    ## [1] 2.15

> Q4. What is the death rate in Mainland China?

``` r
China_cases <- subset(virus, Country.Region == "Mainland China")

total_China_cases <- sum(China_cases$cases)

China_death <- sum(China_cases[China_cases$type == "death", "cases"])

round(China_death/total_China_cases * 100, 2)
```

    ## [1] 2.21

> Q5. What is the death rate in Italy, Iran and the US?

Italian Death rate

``` r
Italy_cases <- subset(virus, Country.Region == "Italy")

total_Italy_cases <- sum(Italy_cases$cases)

Italy_death <- sum(Italy_cases[Italy_cases$type == "death", 
                              "cases"])

round(Italy_death/total_Italy_cases * 100, 2)
```

    ## [1] 3.68

Iranian Death Rate

``` r
Iran_cases <- subset(virus, Country.Region == "Iran")

total_Iran_cases <- sum(Iran_cases$cases)

Iran_death <- sum(Iran_cases[Iran_cases$type == "death", "cases"])

round(Iran_death/total_Iran_cases * 100, 2)
```

    ## [1] 2.14

US Death Rate

``` r
usa_cases <- subset(virus, Country.Region == "US")

total_usa_cases <- sum(usa_cases$cases)

usa_death <- sum(usa_cases[usa_cases$type == "death", "cases"])

round(usa_death/total_usa_cases *100, 2)
```

    ## [1] 4.67
