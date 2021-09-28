[![Travis build status](https://travis-ci.org/jivelez/ueda.svg?branch=master)](https://travis-ci.org/jivelez/ueda)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version-ago/ueda)](https://cran.r-project.org/package=ueda)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/ueda)](https://cran.r-project.org/package=ueda) 

# ueda  <img src="man/figures/logo.png" align="right" alt="" width="120" />

An R package with useful functions to automatically detect and remove outliers via the Ueda's method.  For more information see

Marmolejo-Ramos, F., Vélez, J.I. & Romão, X. Automatic detection of discordant outliers via the Ueda's method. _J Stat Distrib App_ **2**, 8 (2015). https://doi.org/10.1186/s40488-015-0031-y

You can visit the [package website](https://jivelez.github.io/ueda/index.html) to explore the vignettes (articles) and function reference. 

### Installation

To install the latest development version of the package from GitHub use:

```r
if(!require('devtools')) install.packages('devtools')
if(!require('ueda')) devtools::install_github('jivelez/ueda', force = TRUE)
```


### Examples

#### Example 1

First we generate a numeric vector `x` as follows:

```r
# random seed for reproducibility
set.seed(13)

# generate data and introduce 5 outliers
x <- c(rnorm(25, 300, 10), rnorm(5, 400, 5))

# shuffle the data
x <- sample(x)
x
```

To get the full output after applying Ueda's method on this data, we use the `find_ueda_outliers()` function. In this particular case, we use `smax = 5` to detect up to 5 outliers in the numeric vector `x`:

```r
# run full Ueda's method and detect up to 5 outliers
out <- find_ueda_outliers(x, smax = 5)
out
```

Note that `out` is a `list` of four elements:  `Ut`, `label`, `x` and `x_new`. For more information type `?find_ueda_outliers` in the R console.


#### Example 2

In this example, we use the numeric vector `x`  as input and automatically detect up to `smax = 5` outliers and remove them with the `ueda_remove()` function:

```r
# remove up to 5 outliers from vector `x`
x_new <- ueda_remove(x, smax = 5)
x_new
```
Note that the `x_new` object is similar to `x` but has no outliers. For more information type `?ueda_remove` in the R console.


#### Example 3

Suppose we have the following `data.frame()`:

```r
## create some data
set.seed(721)
y <- sample(0:1, length(x), replace = TRUE)
d <- data.frame(x = x, y = y)
d
```
Sometimes we would like to get the indexes of the outliers in the vector `x`. These indexes can be further used in combination with the `subset()` function to reduce the number of registers in a `d`.  

One way of accomplishing this is using the `udea_index()` function as follows:

```r
# get indexes and positions of up to 5 outliers
result <- ueda_index(x, smax = 5)
result
```

The object `result` is a `list()` of two components: `indexes` and `positions`. For more information type `?ueda_index` in the R console. 

To get the `indexes` from the object `result` we proceed as follows:

```r
## indexes of outliers
idx <- result$indexes
idx
```

The object `idx` can be used to `subset()` the object `d`. To get the complete data set for the outlier observations, we do

```r
## data for outlier observations
subset(d, idx)
```

The data for those observations that are not considered outliers can be retrieved by doing

```r
## data for no outlier observations
subset(d, !idx)
```

