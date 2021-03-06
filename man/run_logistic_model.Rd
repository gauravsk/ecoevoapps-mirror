% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/single_population_continuous.R
\name{run_logistic_model}
\alias{run_logistic_model}
\title{Run logistic growth model}
\usage{
run_logistic_model(time, init, params)
}
\arguments{
\item{time}{vector of time units over which to run model, starting from 0.
`time` can also be supplied as just the total length of the simulation (i.e. tmax)}

\item{init}{initial population size of population, in a vector with name `N1`}

\item{params}{vector of intrinsic growth rate,  carrying capacity and,
if simulating a lagged-logistic model, `tau`
in a vector with names `r`,`K`, and `tau` (if applicable)}
}
\description{
Run logistic growth model
}
\examples{
run_logistic_model(time = 0:100, init = c(N1 = 1), params = c(r = .15, K = 1000))
run_logistic_model(time = 100, init = c(N1 = 1), params = c(r = .15, K = 1000))
run_logistic_model(time = 0:100, init = c(N1 = 1), params = c(r = .15, K = 1000, tau = 2.1))
}
