% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ueda_remove.R
\name{ueda_remove}
\alias{ueda_remove}
\title{Remove outliers}
\usage{
ueda_remove(x, smax = 3)
}
\arguments{
\item{x}{A numeric vector}

\item{smax}{The maximum number of outliers to be detected. By default, smax = 3.}
}
\value{
The numeric vector `x` with no outliers. When no outliers are detected, the function returns the input numeric vector `x`.
}
\description{
A generic function to remove outliers in a numeric vector using Ueda's method.
}
\examples{
# random seed for reproducibility
set.seed(13)
# introduce 5 outliers
x <- c(rnorm(25, 300, 10), rnorm(5, 400, 5))
# shuffle the data
x <- sample(x)
# removes up to 5 outliers
ueda_remove(x, smax = 5)
}
\references{
Marmolejo-Ramos, F., Vélez, J.I. & Romão, X. Automatic detection of discordant outliers via the Ueda’s method. J Stat Distrib App 2, 8 (2015). \url{https://doi.org/10.1186/s40488-015-0031-y}
}
