
croix <img src="man/figures/croix_logo.svg" align="right" height="120"/>
========================================================================

Overview
--------

This R package serves as a color palette generator for color schemes to be used in plotting data. The original set of colors schemes for this package was based on the colors found on LaCroix cans. Later, color schemes from other popular media were also used (e.g. other beverages, movies, etc. ). I hope you find the colors pleasing to the eye. Thanks!

Installation
------------

The current way to install this package is only through GitHub:

``` r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("btmonier/croix")
```

Usage
-----

To get a list of palettes available through this package, use the following parameter:

``` r
names(croix::croix_palettes)
#>  [1] "pure"                           "berry"                         
#>  [3] "cran_raspberry"                 "lemon"                         
#>  [5] "lime"                           "orange"                        
#>  [7] "pamplemousse"                   "peach_pear"                    
#>  [9] "coconut"                        "apricot"                       
#> [11] "passionfruit"                   "key_lime"                      
#> [13] "mango"                          "tangerine"                     
#> [15] "the_shining"                    "the_big_lebowski"              
#> [17] "star_wars_ep_v"                 "the_godfather"                 
#> [19] "the_revenant"                   "fargo"                         
#> [21] "the_professional"               "akira"                         
#> [23] "pulp_fiction"                   "taxi_driver"                   
#> [25] "a_clockwork_orange"             "ferris_buellers_day_off"       
#> [27] "fear_and_loathing_in_las_vegas" "american_beauty"               
#> [29] "blade_runner"                   "alien"                         
#> [31] "napoleon_dynamite"              "edward_scissorhands"           
#> [33] "thelma_and_louise"              "fight_club"                    
#> [35] "the_truman_show"                "mad_max_fury_road"             
#> [37] "resevoir_dogs"                  "blue_velvet"                   
#> [39] "silence_of_the_lambs"           "the_matrix"                    
#> [41] "arrow_video"
```

You can get a vector of hex color codes, simply use the following:

``` r
crPal <- croix::croix_palette(name = "mad_max_fury_road")
crPal
#>  [1] "#0D646B" "#16383A" "#414640" "#B88F73" "#FFD2B5" "#ED8F49" "#E27812"
#>  [8] "#5C2A09" "#2E1612" "#0F1217"
```

To visualize the color scheme, use:

``` r
crPal <- croix::croix_palette(name = "mad_max_fury_road")
plot(crPal)
```

![](man/figures/README-croix_plot_01-1.png)

To get a continuous gradient of a scheme, use:

``` r
    crPal <- croix::croix_palette(
        name = "pamplemousse", 
        n = 50, 
        type = "continuous"
    )
    plot(crPal)
```

![](man/figures/README-croix_plot_02-1.png)

To see all of the schemes at once, use:

``` r
croix::croix_all()
```

![](man/figures/README-croix_plot_03-1.png)

------------------------------------------------------------------------

*Last updated:* 2019-01-26
