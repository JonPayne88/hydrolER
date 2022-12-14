#' @title L components
#'
#' @description Calculates the components of the L moment calculations from AMAX data. Can also convert time
#' series data imported via HydroEnR into LKur moments.
#'
#' @param x AMAX or flow time series
#' @param ... Additional parameters as required
#'
#' @return
#' @export
#'
#' @examples
#' data <- getAMAX(rnrfa::get_ts(id = 2001, type = 'amax-flow'))
#' LComponents(data)
LComponents <- function(x, ...) {
  UseMethod('LComponents', x)
}

#' @rdname LComponents
#' @export
LComponents.numeric <- function(x, ...) {
  camp <- sort(x)
  n <- length(camp)
  nn <- rep(n-1,n)
  pp <- seq(0,n-1)
  p1 <- pp/nn
  p2 <- p1 * (pp-1)/(nn-1)
  p3 <- p2 * (pp-2)/(nn-2)
  b0 <- sum(camp)/n
  b1 <- sum(p1*camp)/n
  b2 <- sum(p2*camp)/n
  b3 <- sum(p3*camp)/n
  cs <- rbind(n, b0, b1, b2, b3)
  colnames(cs) <- 'Components'
  class(cs) <- append(class(cs), 'LCs')
  return(cs)
}

#' @rdname LComponents
#' @export
LComponents.HydroAggsmax <- function(x, ...){
  x <- x$Hydro_year$Hydro_year_Max
  camp <- sort(x)
  n <- length(camp)
  nn <- rep(n-1,n)
  pp <- seq(0,n-1)
  p1 <- pp/nn
  p2 <- p1 * (pp-1)/(nn-1)
  p3 <- p2 * (pp-2)/(nn-2)
  b0 <- sum(camp)/n
  b1 <- sum(p1*camp)/n
  b2 <- sum(p2*camp)/n
  b3 <- sum(p3*camp)/n
  cs <- rbind(n, b0, b1, b2, b3)
  colnames(cs) <- 'Components'
  class(cs) <- append(class(cs), 'LCs')
  return(cs)
}

#' @rdname LComponents
#' @export
LComponents.HydroAMAX <- function(x, ...){
  x <- mean(x$AMAX, na.rm = TRUE)
  camp <- sort(x$AMAX)
  n <- length(camp)
  nn <- rep(n-1,n)
  pp <- seq(0,n-1)
  p1 <- pp/nn
  p2 <- p1 * (pp-1)/(nn-1)
  p3 <- p2 * (pp-2)/(nn-2)
  b0 <- sum(camp)/n
  b1 <- sum(p1*camp)/n
  b2 <- sum(p2*camp)/n
  b3 <- sum(p3*camp)/n
  cs <- rbind(n, b0, b1, b2, b3)
  colnames(cs) <- 'Components'
  class(cs) <- append(class(cs), 'LCs')
  return(cs)
}

#' @rdname LComponents
#' @export
LComponents.HydroVAMAX <- function(x, ...){
  x <- x[,-1,]
  cs <- data.table(Component = c('n', 'b0', 'b1', 'b2', 'b3'),
                   x[, lapply(.SD, LComponents, na.rm = TRUE), ])
  class(cs) <- append(class(cs), 'LCs')
  return(cs)
}

#' @rdname LComponents
#' @export
LComponents.flowLoad <- function(x, ...){
  x <- getAMAX(x)
  ccamp <- sort(x$AMAX)
  n <- length(camp)
  nn <- rep(n-1,n)
  pp <- seq(0,n-1)
  p1 <- pp/nn
  p2 <- p1 * (pp-1)/(nn-1)
  p3 <- p2 * (pp-2)/(nn-2)
  b0 <- sum(camp)/n
  b1 <- sum(p1*camp)/n
  b2 <- sum(p2*camp)/n
  b3 <- sum(p3*camp)/n
  cs <- rbind(n, b0, b1, b2, b3)
  colnames(cs) <- 'Components'
  class(cs) <- append(class(cs), 'LCs')
  return(cs)
}

#' @rdname LComponents
#' @export
LComponents.zoo <- function(x, ...){
  x <- getAMAX(x)
  ccamp <- sort(x$AMAX)
  n <- length(camp)
  nn <- rep(n-1,n)
  pp <- seq(0,n-1)
  p1 <- pp/nn
  p2 <- p1 * (pp-1)/(nn-1)
  p3 <- p2 * (pp-2)/(nn-2)
  b0 <- sum(camp)/n
  b1 <- sum(p1*camp)/n
  b2 <- sum(p2*camp)/n
  b3 <- sum(p3*camp)/n
  cs <- rbind(n, b0, b1, b2, b3)
  colnames(cs) <- 'Components'
  class(cs) <- append(class(cs), 'LCs')
  return(cs)
}

