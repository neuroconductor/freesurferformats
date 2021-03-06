% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_nifti1.R
\name{nifti.file.uses.fshack}
\alias{nifti.file.uses.fshack}
\title{Determine whether a NIFTI file uses the FreeSurfer hack.}
\usage{
nifti.file.uses.fshack(filepath)
}
\arguments{
\item{filepath}{path to a NIFTI v1 file (single file version), which can contain the FreeSurfer hack.}
}
\value{
logical, whether the file header contains the FreeSurfer format hack. See \code{\link{read.nifti1.header}} for details. This function detects NIFTI v2 files, but as they cannot contain the hack, it will always return `FALSE` for them.
}
\description{
Determine whether a NIFTI file uses the FreeSurfer hack.
}
\note{
Applying this function to files which are not in NIFTI format will result in an error. See \code{\link{nifti.file.version}} to determine whether a file is a NIFTI file.
}
