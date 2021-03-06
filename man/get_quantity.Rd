% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_quantity.R
\name{get_quantity}
\alias{get_quantity}
\alias{get_quantity.vp}
\alias{get_quantity.list}
\alias{get_quantity.vpts}
\title{Get a quantity from a vertical profile (\code{vp}) or time series of vertical
profiles (\code{vpts})}
\usage{
get_quantity(x, quantity)

\method{get_quantity}{vp}(x, quantity = "dens")

\method{get_quantity}{list}(x, quantity = "dens")

\method{get_quantity}{vpts}(x, quantity = "dens")
}
\arguments{
\item{x}{A \code{vp}, list of \code{vp} or \code{vpts} object.}

\item{quantity}{Character. A (case sensitive) profile quantity, one of:
\itemize{
\item \code{height}: Height bin (lower bound) in m above sea level.
\item \code{u}: Speed component west to east in m/s.
\item \code{v}: Speed component north to south in m/s.
\item \code{w}: Vertical speed (unreliable!) in m/s.
\item \code{ff}: Horizontal speed in m/s.
\item \code{dd}: Direction in degrees clockwise from north.
\item \code{sd_vvp}: VVP radial velocity standard deviation in m/s.
\item \code{gap}: Angular data gap detected in T/F.
\item \code{dbz}: Animal reflectivity factor in dBZ.
\item \code{eta}: Animal reflectivity in cm^2/km^3.
\item \code{dens}: Animal density in animals/km^3.
\item \code{DBZH}: Total reflectivity factor (bio + meteo scattering) in dBZ.
\item \code{n}: Number of data points used for the ground speed estimates
(quantities \code{u}, \code{v}, \code{w}, \code{ff}, \code{dd}).
\item \code{n_all}: Number of data points used for the radial velocity standard
deviation estimate (quantity \code{sd_vvp}).
\item \code{n_dbz}: Number of data points used for reflectivity-based estimates
(quantities \code{dbz}, \code{eta}, \code{dens}).
\item \code{n_dbz_all}: Number of data points used for the total reflectivity
estimate (quantity \code{DBZH}).
\item \code{attributes}: List of the vertical profile's \code{what}, \code{where} and \code{how}
attributes.
}}
}
\value{
For a \code{vp} object: a named (height bin) vector with values for the
selected quantity.

For a \code{list} object: a list of named (height bin) vectors with values
for the selected quantity.

For a \code{vpts} object: a (height bin * datetime) matrix with values for
the selected quantity.
}
\description{
Returns values for the selected quantity from a vertical profile (\code{vp}),
list, or time series of vertical profiles (\code{vpts}). Values are organized per
height bin. Values for \code{eta} are set to \code{0}, \code{dbz} to \code{-Inf} and \code{ff}, \code{u},
\code{v}, \code{w}, \code{dd} to \code{NaN} when the \code{sd_vvp} for that height bin is below the
\code{\link[=sd_vvp_threshold]{sd_vvp_threshold()}}.
}
\examples{
# Load the example vertical profile
vp <- example_vp

# Extract the quantity animal density (dens)
get_quantity(vp, "dens")

# Load the example time series of vertical profiles
vpts <- example_vpts

# Extract the quantity horizontal speed (ff) and show the first two datetimes
get_quantity(vpts, "ff")[,1:2]
}
\seealso{
\itemize{
\item \code{\link[=summary.vp]{summary.vp()}}
\item \code{\link[=sd_vvp_threshold<-]{sd_vvp_threshold()<-}} for setting the \code{sd_vvp}
threshold of an object.
}
}
