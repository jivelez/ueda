#' Automatic detection and removal of outliers using Ueda's method.
#'
#' A function to calculate all components of Ueda's method.
#'
#' @param x A numeric vector
#' @param smax The maximum number of outliers to be detected. By default, smax = 3.
#'
#'
#' @return A list of 4 components:
#'
#' 1.  The Ut matrix.
#'
#' 2. The label matrix.
#'
#' 3. The input numeric vector.
#'
#' 4.  The input vector with no outliers.

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
#' find_ueda_outliers(x, smax = 5)
find_ueda_outliers <- function(x, smax = 3){

	# Ut function
	# x = data; s = number of outliers
	ut <- function(x, s, na.rm = TRUE){
		n <- length(x)
		sigma <- sqrt(sum((x-mean(x))^2)/n) ###### see footnote 4

		# The Stirling Formula is used to compute log n!
		stirling <- function(x) 1/2*log(2*pi)+(1/2+x)*log(x)-x

		ut <- n*log(sigma)+(sqrt(2)*stirling(n))/n*s
		ut
	}

	# here begins the main function
	sx <- scale(sort(x))
	nmin <- 1
	nmax <- length(sx)

	# find smax based on the number of observations
	if(is.null(smax)) smax <- ifelse(nmax %% 2 == 0, nmax/2 - 1, (nmax - 1)/2)
	else smax <- smax

	# search
	s <- smax
	r <- matrix(NA, ncol = s, nrow = s)
	for(i in 0:(s-1)){
		for(j in 0:(s-1)){
			sini <- seq(nmin, nmin + i)
			sfin <- seq(nmax, nmax - j)
			r[i+1, j+1] <- ut(sx[-c(sini, sfin)], length(sini) + length(sfin))
			}}
	none <- ut(sx, 0)
	toprow <- sapply(0:(s-1), function(s) ut(sx[-seq(nmin, nmin + s)], s + 1))
	leftcol <- sapply(0:(s-1), function(s) ut(sx[-seq(nmax, nmax - s)], s + 1))
	r <- cbind(c(none, toprow), rbind(leftcol, r))
	r2 <- round(r, 3)
	r <- ifelse(r2 == min(r2), paste0(r2, "*"), r2)
	colnames(r) <- c('none', paste0('X', nmax:(nmax - s + 1)))
	rownames(r) <- c('none', paste0('X', 1:(nmin + s - 1)))
	r <- data.frame(r)
	rownames(r2) <- rownames(r)
	colnames(r2) <- colnames(r)

	## get positions
	pos <- as.numeric(which(r2 == min(r2) , arr.ind = TRUE))
	srtx <- sort(x)
	rr2 <- NULL
	if(pos[1] == 1 & pos[2] != 1) rr2 <- srtx[-seq(nmax, nmax - pos[2] + 2)]
	if(pos[1] != 1 & pos[2] == 1) rr2 <- srtx[-seq(1, pos[1])]
	if(pos[1] != 1 & pos[2] != 1){
		left <- srtx[-seq(1, pos[1])]
		right <- srtx[-seq(nmax, nmax - pos[2] + 2)]
		if(length(left) == 0 | length(right) == 0) rr2 <- rr2
		else rr2 <- c(left, right)
		}

	# report
	list(Ut = r2, label = r, x = srtx, x_new = rr2)
}
