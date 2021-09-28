[![Travis build status](https://travis-ci.org/jivelez/ueda.svg?branch=master)](https://travis-ci.org/jivelez/ueda)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version-ago/ueda)](https://cran.r-project.org/package=ueda)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/ueda)](https://cran.r-project.org/package=ueda) 

# ueda  <img src="man/figures/logo.png" align="right" alt="" width="120" />
<hr>

An R package with useful functions to automatically detect and remove outliers via the Ueda's method.  For more information see

Marmolejo-Ramos, F., Vélez, J.I. & Romão, X. Automatic detection of discordant outliers via the Ueda's method. J Stat Distrib App **2**, 8 (2015). https://doi.org/10.1186/s40488-015-0031-y

You can visit the [package website](https://fhernanb.github.io/stests/index.html) to explore the vignettes (articles) and function reference. 

### Installation

To install the latest development version of the package from GitHub use:


```r
if(!require('devtools')) install.packages('devtools')
if(!require('ueda')) devtools::install_github('jivelez/ueda', force = TRUE)
```



