% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hydro_update_hourly.R
\name{hydro_update_hourly}
\alias{hydro_update_hourly}
\title{Hourly update of real-time data}
\usage{
hydro_update_hourly(
  path,
  aquarius = TRUE,
  stage = "Stage.Corrected",
  discharge = "Discharge.Master",
  SWE = "SWE.Corrected",
  depth = "Snow Depth.TempCompensated.Corrected",
  distance = "Distance.Corrected",
  server = "https://yukon.aquaticinformatics.net/AQUARIUS"
)
}
\arguments{
\item{path}{The path to the local hydro SQLite database, with extension.}

\item{aquarius}{TRUE if you are fetching data from Aquarius, in which case you should also check the next five parameters. FALSE will only populate with WSC data.}

\item{stage}{The name of the stage (level) timeseries as it appears in Aquarius, if it exists, in the form Parameter.Label. All stations must have the same parameter and label. !This DOES NOT apply to WSC stations mirrored in Aquarius.}

\item{discharge}{The name of the discharge (flow) timeseries as it appears in Aquarius, if it exists, in the form Parameter.Label. All stations must have the same parameter and label. !This DOES NOT apply to WSC stations mirrored in Aquarius.}

\item{SWE}{The name of the snow water equivalent timeseries as it appears in Aquarius, if it exists, in the form Parameter.Label. All stations must have the same parameter and label.}

\item{depth}{The name of the snow depth timeseries as it appears in Aquarius, if it exists, in the form Parameter.Label. All stations must have the same parameter and label.}

\item{distance}{The name of the distance timeseries as it appears in Aquarius if it exists, in the form Parameter.Label. All stations must have the same parameter and label. Usually used for distance from bridge girders to water surface.}

\item{server}{The URL to your Aquarius server, if needed. Note that your credentials must be in your .Renviron profile: see ?WRBtools::aq_download.}
}
\value{
The database is updated in-place.
}
\description{
Retrieves new real-time data from WSC and Aquarius, starting from the last data point in the local database. Also updates the location_data_range table. Only works on stations that are ALREADY in the realtime tables; refer to function hydro_update_daily for how to add new stations.
}
\details{
Timeseries that have an identical location name in WSC real-time data and Aquarius will only pull from WSC information.
}
