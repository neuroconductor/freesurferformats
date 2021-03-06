% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_fs_curv.R
\name{write.fs.morph.smp}
\alias{write.fs.morph.smp}
\title{Write morphometry data in Brainvoyager SMP format.}
\usage{
write.fs.morph.smp(filepath, data, ...)
}
\arguments{
\item{filepath}{string, the full path of the output SMP file.}

\item{data}{numerical vector, the data to write. Will be coerced to double.}

\item{...}{extra arguments passed to \code{\link{write.smp.brainvoyager}}. Allows yout to save in specific format versions.}
}
\value{
format, string. The format that was used to write the data.
}
\description{
Write morphometry data in Brainvoyager SMP format.
}
\seealso{
Other morphometry functions: 
\code{\link{fs.get.morph.file.ext.for.format}()},
\code{\link{fs.get.morph.file.format.from.filename}()},
\code{\link{read.fs.curv}()},
\code{\link{read.fs.mgh}()},
\code{\link{read.fs.morph.gii}()},
\code{\link{read.fs.morph}()},
\code{\link{read.fs.volume}()},
\code{\link{read.fs.weight}()},
\code{\link{write.fs.curv}()},
\code{\link{write.fs.label.gii}()},
\code{\link{write.fs.mgh}()},
\code{\link{write.fs.morph.asc}()},
\code{\link{write.fs.morph.gii}()},
\code{\link{write.fs.morph.ni1}()},
\code{\link{write.fs.morph.ni2}()},
\code{\link{write.fs.morph.txt}()},
\code{\link{write.fs.morph}()},
\code{\link{write.fs.weight.asc}()},
\code{\link{write.fs.weight}()}
}
\concept{morphometry functions}
