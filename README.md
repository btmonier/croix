
# croix <img src="man/figures/croix_logo.svg" align="right" height="120"/>

[![Build
Status](https://travis-ci.org/btmonier/croix.svg?branch=master)](https://travis-ci.org/btmonier/croix)
[![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

## Overview

This R package serves as a color palette generator for color schemes to
be used in plotting data. The original set of colors schemes for this
package was based on the colors found on LaCroix cans. Later, color
schemes from other popular media were also used (e.g. other beverages,
movies, etc. ). I hope you find the colors pleasing to the eye. Thanks\!

## Installation

The current way to install this package is only through GitHub:

``` r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("btmonier/croix")
```

## Usage

To get a list of palettes available through this package, use the
following parameter:

``` r
names(croix::croix_palettes)
#>  [1] "croix_apricot"                     
#>  [2] "croix_berry"                       
#>  [3] "croix_coconut"                     
#>  [4] "croix_cran_raspberry"              
#>  [5] "croix_pure"                        
#>  [6] "croix_key_lime"                    
#>  [7] "croix_lemon"                       
#>  [8] "croix_lime"                        
#>  [9] "croix_mango"                       
#> [10] "croix_orange"                      
#> [11] "croix_pamplemousse"                
#> [12] "croix_passionfruit"                
#> [13] "croix_peach_pear"                  
#> [14] "croix_tangerine"                   
#> [15] "mov_a_clockwork_orange"            
#> [16] "mov_akira"                         
#> [17] "mov_aladdin"                       
#> [18] "mov_alien"                         
#> [19] "mov_american_beauty"               
#> [20] "mov_alice"                         
#> [21] "mov_american_psycho"               
#> [22] "mov_annie_hall"                    
#> [23] "mov_arrow_video"                   
#> [24] "mov_birdman"                       
#> [25] "mov_blade_runner"                  
#> [26] "mov_blue_velvet"                   
#> [27] "mov_corpsebride"                   
#> [28] "mov_deadpool"                      
#> [29] "mov_django_unchained"              
#> [30] "mov_edward_scissorhands"           
#> [31] "mov_fargo"                         
#> [32] "mov_fear_and_loathing_in_las_vegas"
#> [33] "mov_ferris_buellers_day_off"       
#> [34] "mov_fight_club"                    
#> [35] "mov_forrest_gump"                  
#> [36] "mov_frozen"                        
#> [37] "mov_mad_max_fury_road"             
#> [38] "mov_napoleon_dynamite"             
#> [39] "mov_pulp_fiction"                  
#> [40] "mov_resevoir_dogs"                 
#> [41] "mov_silence_of_the_lambs"          
#> [42] "mov_the_matrix"                    
#> [43] "mov_star_wars_ep_v"                
#> [44] "mov_taxi_driver"                   
#> [45] "mov_the_big_lebowski"              
#> [46] "mov_the_godfather"                 
#> [47] "mov_the_professional"              
#> [48] "mov_the_revenant"                  
#> [49] "mov_the_shining"                   
#> [50] "mov_the_truman_show"               
#> [51] "mov_thelma_and_louise"
```

You can get a vector of hex color codes, simply use the following:

``` r
crPal <- croix::croix_palette(name = "mov_mad_max_fury_road")
crPal
#>  [1] "#0D646B" "#16383A" "#414640" "#B88F73" "#FFD2B5" "#ED8F49" "#E27812"
#>  [8] "#5C2A09" "#2E1612" "#0F1217"
```

To visualize the color scheme, use:

``` r
crPal <- croix::croix_palette(name = "mov_mad_max_fury_road")
plot(crPal)
```

![](man/figures/README-croix_plot_01-1.png)<!-- -->

To get a continuous gradient of a scheme, use:

``` r
    crPal <- croix::croix_palette(
        name = "croix_pamplemousse", 
        n = 50, 
        type = "continuous"
    )
    plot(crPal)
```

![](man/figures/README-croix_plot_02-1.png)<!-- -->

To see all of the schemes at once, use:

``` r
croix::croix_all()
```

![](man/figures/README-croix_plot_03-1.png)<!-- -->

-----

*Last updated:* 2019-02-08
