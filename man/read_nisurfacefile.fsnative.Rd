% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_nisurface.R
\name{read_nisurfacefile.fsnative}
\alias{read_nisurfacefile.fsnative}
\title{Read a FreeSurfer ASCII surface file.}
\usage{
\method{read_nisurfacefile}{fsnative}(filepath, ...)
}
\arguments{
\item{filepath}{character string, the full path to the input surface file.}

\item{...}{parameters passed to \code{\link[freesurferformats]{read.fs.surface}}.}
}
\value{
an instance of `fs.surface`, read from the file. See \code{\link[freesurferformats]{read.fs.surface}} for details. If none of the reader methods succeed, an error is raised.
}
\description{
Read a FreeSurfer ASCII surface file.
}
