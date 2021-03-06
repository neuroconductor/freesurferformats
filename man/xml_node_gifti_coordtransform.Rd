% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gifti_xml_tools.R
\name{xml_node_gifti_coordtransform}
\alias{xml_node_gifti_coordtransform}
\title{Create XML GIFTI CoordinateSystemTransformMatrix node.}
\usage{
xml_node_gifti_coordtransform(
  transform_matrix,
  data_space = "NIFTI_XFORM_UNKNOWN",
  transformed_space = "NIFTI_XFORM_UNKNOWN",
  as_cdata = TRUE
)
}
\arguments{
\item{transform_matrix}{numerical 4x4 matrix, the transformation matrix from 'data_space' to 'transformed_space'.}

\item{data_space}{character string, the space used by the data before transformation.}

\item{transformed_space}{character string, the space reached after application of the transformation matrix.}

\item{as_cdata}{logical, whether to wrap text attributes ('data_space' and 'transformed_space') in cdata tags.}
}
\value{
XML node from xml2
}
\description{
Create XML GIFTI CoordinateSystemTransformMatrix node.
}
