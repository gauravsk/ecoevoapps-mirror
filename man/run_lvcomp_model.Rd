% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lotka_volterra_competition.R
\name{run_lvcomp_model}
\alias{run_lvcomp_model}
\title{Run the Lotka-Volterra competition model (with carrying capacity and relative effects)}
\usage{
run_lvcomp_model(time, init, params)
}
\arguments{
\item{time}{vector of time units over which to run model, starting from 0.
`time` can also be supplied as just the total length of the simulation (i.e. tmax)}

\item{init}{vector of initial population sizes for both species, with names N1 and N2}

\item{params}{vector of model parameters
Note that carrying capacity for both species can be defined in `params`
either as `K1` and `K2`, or in the inverse, as `a11` and `a22`.
If carrying capacities are defined as `K1` and `K2`, interspecific competition
should be defined as `a` and `b`; otherwise, `a12` and `a21`.}
}
\description{
Run the Lotka-Volterra competition model (with carrying capacity and relative effects)
}
\examples{
# Define full time series, and run model in terms of carrying capacities
# and relative competitive effects
run_lvcomp_model(time = 0:5, init = c(N1 = 1, N2 = 5),
params = c(r1 = .15, r2 = .2, K1 = 1000, K2 = 800, a = 0.9, b = 1.05))

# Run model in terms of absolute competition coefficients
# (i.e. a11, a12, a21, a22)
run_lvcomp_model(time = 0:5, init = c(N1 = 1, N2 = 5),
params = c(r1 = .15, r2 = .2, a11 = .001, a22 = 0.00125, a12 = .0005, a21 = .0007))

# Give only the final time step rather than full time series
run_lvcomp_model(time = 0:5, init = c(N1 = 1, N2 = 5),
params = c(r1 = .15, r2 = .2, K1 = 1000, K2 = 800, a = 0.9, b = 1.05))
run_lvcomp_model(time = 0:5, init = c(N1 = 1, N2 = 5),
params = c(r1 = .15, r2 = .2, a11 = .001, a22 = 0.00125, a12 = .0005, a21 = .0007))
}
