#' Remove outliers
#'
#' A generic function to remove outliers in a numeric vector using Ueda's method.
#' @param x A numeric vector
#' @param smax The maximum number of outliers to be detected. By default, smax = 3.
#'
#'
#' @return The numeric vector `x` with no outliers. When no outliers are detected, the function returns the input numeric vector `x`.
#' @export
#'
#' @references Marmolejo-Ramos, F., Vélez, J.I. & Romão, X. Automatic detection of discordant outliers via the Ueda’s method. J Stat Distrib App 2, 8 (2015). \url{https://doi.org/10.1186/s40488-015-0031-y}
#'
#' @examples
#' # random seed for reproducibility
#' set.seed(13)
#' # introduce 5 outliers
#' x <- c(rnorm(25, 300, 10), rnorm(5, 400, 5))
#' # shuffle the data
#' x <- sample(x)
#' # removes up to 5 outliers
#' ueda_remove(x, smax = 5)
ueda_remove <- function(x, smax = 3){

  # set up
  n <- length(x)
	if(is.null(smax)) smax <- ifelse(n %% 2 == 0, n/2 - 1, (n - 1)/2)
	if(smax > (n/2 - 1)) stop('smax can not be greater than ', n/2-1, '\n')

	# automatic search
	s <- 1:smax
	search <- sapply(s, function(s) min(find_ueda_outliers(x, smax = s)$Ut))
	where <- which(search == min(search))[[1]]

	# what to do is outliers are found
	if(where != 1) out <- find_ueda_outliers(x, smax = where)[[4]]

	# no outliers
	else{
		out <- x
	}
	out
}
