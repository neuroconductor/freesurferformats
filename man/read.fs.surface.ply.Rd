% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_fs_surface.R
\name{read.fs.surface.ply}
\alias{read.fs.surface.ply}
\title{Read Stanford PLY format mesh as surface.}
\usage{
read.fs.surface.ply(filepath)
}
\arguments{
\item{filepath}{string. Full path to the input surface file in Stanford Triangle (PLY) format.}
}
\value{
named list. The list has the following named entries: "vertices": nx3 double matrix, where n is the number of vertices. Each row contains the x,y,z coordinates of a single vertex. "faces": nx3 integer matrix. Each row contains the vertex indices of the 3 vertices defining the face. WARNING: The indices are returned starting with index 1 (as used in GNU R). Keep in mind that you need to adjust the index (by substracting 1) to compare with data from other software.
}
\description{
This reads meshes from text files in PLY format. Note that this does not read arbitrary data from PLY files, i.e., PLY files can store data that is not supported by this function.
}
\note{
This is by far not a complete PLY format reader. It can read PLY mesh files which were written by \code{\link[freesurferformats]{write.fs.surface.ply}} and Blender. Vertex colors and Blender vertex normals are currently ignored (but files with them are supported in the sense that the mesh data will be read correctly).
}
\seealso{
Other mesh functions: 
\code{\link{faces.quad.to.tris}()},
\code{\link{read.fs.surface.asc}()},
\code{\link{read.fs.surface.bvsrf}()},
\code{\link{read.fs.surface.geo}()},
\code{\link{read.fs.surface.gii}()},
\code{\link{read.fs.surface.ico}()},
\code{\link{read.fs.surface.obj}()},
\code{\link{read.fs.surface.off}()},
\code{\link{read.fs.surface.vtk}()},
\code{\link{read.fs.surface}()},
\code{\link{read.mesh.brainvoyager}()},
\code{\link{read_nisurfacefile}()},
\code{\link{read_nisurface}()},
\code{\link{write.fs.surface.asc}()},
\code{\link{write.fs.surface.byu}()},
\code{\link{write.fs.surface.gii}()},
\code{\link{write.fs.surface.mz3}()},
\code{\link{write.fs.surface.vtk}()},
\code{\link{write.fs.surface}()}
}
\concept{mesh functions}
