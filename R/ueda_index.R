#' Find indexes and positions
#'
#' This function allows identifying the indexes and positions of outliers in a numeric vector.
#'
#' @param x A numeric vector
#' @param smax The maximum number of outliers to be detected. By default, smax = 3.
#'
#' @return A list with 2 components:
#'
#' @return index  Boolean (TRUE/FALSE) indicating whether each observation is an outlier.
#'
#' @return position The position of the outliers in the data.
#' @export
#'
#' @references Marmolejo-Ramos, F., Vélez, J.I. & Romão, X. Automatic detection of discordant outliers via the Ueda’s method. J Stat Distrib App 2, 8 (2015). \url{https://doi.org/10.1186/s40488-015-0031-y}
#'
#'
#' @examples
#' # random seed for reproducibility
#' set.seed(13)
#' # introduce 5 outliers
#' x <- c(rnorm(25, 300, 10), rnorm(5, 400, 5))
#' # shuffle the data
#' x <- sample(x)
#' # find indexes
#' ueda_index(x, smax = 5)
ueda_index <- function(x, smax = 3){
  res <- ueda_remove(x = x, smax = smax)
  index <- !x %in% res
  positions <- which(index)
  list(index = index, positions = positions)
}
