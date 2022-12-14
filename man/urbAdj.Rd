% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/urbAdj.R
\name{urbAdj}
\alias{urbAdj}
\alias{urbAdj.Lcv}
\alias{urbAdj.LSkew}
\title{urbAdj}
\usage{
urbAdj(x, URBEXT2000, DeUrb = FALSE, ...)

\method{urbAdj}{Lcv}(x, URBEXT2000, DeUrb = FALSE)

\method{urbAdj}{LSkew}(x, URBEXT2000, DeUrb = FALSE)
}
\arguments{
\item{x}{Data of class Lcv or LSkew}

\item{URBEXT2000}{Value taken from the catchment descriptors}

\item{DeUrb}{Set to false. If true, the data are de-urbanised}

\item{...}{Additional parameters that can be added}
}
\value{

}
\description{
Provides an urban adjustment to the LCV and LSKEW moments.
}
\examples{
flow \%>\%
 getAMAX() \%>\%
 Lcv() \%>\%
 urbAdj(URBEXT2000 = 0.3, DeUrb = FALSE)
}
