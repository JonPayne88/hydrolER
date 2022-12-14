% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotExtVal.R
\name{plotExtVal}
\alias{plotExtVal}
\title{Extreme Value Plots}
\usage{
plotExtVal(
  x,
  scaling = TRUE,
  filter = NULL,
  secX = TRUE,
  ppy = 1,
  URBEXT2000 = NULL,
  DeUrb = FALSE
)
}
\arguments{
\item{x}{Dataset}

\item{scaling}{Scale to QMED, set as TRUE}

\item{filter}{Set to null, which selects all. Use vector of distributions to select models; 'GEV', 'Gumbel', 'GenLog', and 'GenPareto'}

\item{secX}{Secondary X axis to highlight return periods}

\item{ppy}{Peaks per year used in the growth function equations}

\item{URBEXT2000}{Used in the growth function equations}

\item{DeUrb}{Used in the growth function equations}

\item{...}{Additional parameters as required}
}
\value{

}
\description{
Extreme Value Plots
}
\examples{
amax <- getAMAX(rnrfa::get_ts(id = 2001, type = 'amax-flow'))
plotExtVal(amax)
plotExtVal(amax, scaling = FALSE, filter = c('GEV', 'GenLog'), URBEXT2000 = 0.4)
}
