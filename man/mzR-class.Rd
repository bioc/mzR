\name{mzR-class}
\Rdversion{1.1}
\docType{class}
\alias{mzR-class}
\alias{mzRnetCDF-class}
\alias{mzRpwiz-class}
\alias{mzRident-class}
\alias{class:mzR}
\alias{class:mzRnetCDF}
\alias{class:mzRpwiz}
\alias{class:mzRident}
\alias{close,mzRpwiz-method}
\alias{close,mzRnetCDF-method}
\alias{close}
\alias{analyzer,mzRpwiz-method}
\alias{analyzer,mzRnetCDF-method}
\alias{detector,mzRpwiz-method}
\alias{detector,mzRnetCDF-method}
\alias{fileName,mzR-method}
\alias{instrumentInfo,mzRpwiz-method}
\alias{instrumentInfo,mzRnetCDF-method}
\alias{ionisation,mzRpwiz-method}
\alias{ionisation,mzRnetCDF-method}
\alias{isInitialized,mzRnetCDF-method}
\alias{length,mzRident-method}
\alias{length,mzRpwiz-method}
\alias{length,mzRnetCDF-method}
\alias{length}
\alias{manufacturer,mzRpwiz-method}
\alias{manufacturer,mzRnetCDF-method}
\alias{model,mzRpwiz-method}
\alias{model,mzRnetCDF-method}

\alias{runInfo,mzRpwiz-method}
\alias{runInfo,mzRnetCDF-method}
\alias{chromatogramsInfo,mzRpwiz-method}
\alias{softwareInfo,mzRpwiz-method}
\alias{softwareInfo,mzRident-method}
\alias{sampleInfo,mzRpwiz-method}
\alias{sourceInfo,mzRpwiz-method}
\alias{mzidInfo,mzRident-method}
\alias{psms,mzRident-method}
\alias{modifications,mzRident-method}
\alias{substitutions,mzRident-method}
\alias{database,mzRident-method}
\alias{enzymes,mzRident-method}
\alias{sourceInfo,mzRident-method}
\alias{tolerance,mzRident-method}
\alias{score,mzRident-method}
\alias{para,mzRident-method}
\alias{specParams,mzRident-method}


\title{Class \code{mzR} and sub-classes}
\description{
  The class \code{mzR} is the main class for the common mass spectrometry
  formats. It is a virtual class and thus not supposed to be instanciated
  directly.

  The sub-classes implement specific APIs to access the underlying data
  and metadata in the files. Currently \code{mzRpwiz} is available.
  \code{mzRpwiz} uses Proteowizard to access the relevant information in
  \code{mzXML} and \code{mzML} files. \code{mzRident} is used as an
  interface to \code{mzIdentML} files.

  IMPORTANT: New developers that need to access and manipulate raw mass
  spectrometry data are advised against using this infrastucture
  directly. They are invited to use the corresponding \code{MSnExp}
  (with \emph{on disk} mode) from the MSnbase package instead. The
  latter supports reading multiple files at once and offers access to
  the spectra data (m/z and intensity) as well as all the spectra
  metadata using a coherent interface. The MSnbase infrastructure itself
  used the low level classes in mzR, thus offering fast and efficient
  access.

}

\section{Objects from the Class}{
  \code{mzR} is a virtual class, so instances cannot be created.

  Objects can be created by calls of the form \code{new("mzRpwiz",
    ...)}, but more often they will be created with
  \code{\link{openMSfile}}.

  After creating an \code{mzR} object, one can write it into a new file.
  mzXML, mzML, mgf formats are supported.

}

\section{Slots}{
  \describe{
    \item{\code{fileName}:}{Object of class \code{character} storing the
      original filename used when the instance was created. }
    \item{\code{backend}:}{ One of the implemented backens or
      \code{NULL}. }
    \item{\code{.__classVersion__}:}{Object of class \code{"Versioned"},
      from Biobase.}
  }
}

\section{Extends}{
  Class \code{"\linkS4class{Versioned}"}, directly.
}

\section{Methods}{

  For methods to access raw data (spectra and chromatograms), see
  \code{\link{peaks}}.


  Methods currently implemented for \code{mzR}

  \describe{ \item{fileName}{\code{signature(object = "mzR")}: ... } }

  Methods currently implemented for \code{mzRpwiz}
  \describe{
    \item{analyzer}{\code{signature(object = "mzRpwiz")}: ... }
    \item{detector}{\code{signature(object = "mzRpwiz")}: ... }
    \item{instrumentInfo}{\code{signature(object = "mzRpwiz")}: ... }
    \item{ionisation}{\code{signature(object = "mzRpwiz")}: ... }
    \item{length}{\code{signature(x = "mzRpwiz")}: ... }
    \item{manufacturer}{\code{signature(object = "mzRpwiz")}: ... }
    \item{model}{\code{signature(object = "mzRpwiz")}: ... }
    \item{runInfo}{\code{signature(object = "mzRpwiz")}: ... }
    \item{chromatogramsInfo}{\code{signature(object = "mzRpwiz")}: ... }
  }

  Methods currently implemented for \code{mzRident}
  \describe{
    \item{mzidInfo}{\code{signature(object = "mzRident")}: ... }
    \item{psms}{\code{signature(object = "mzRident")}: ... }
    \item{modifications}{\code{signature(object = "mzRident")}: ... }
    \item{substitutions}{\code{signature(object = "mzRident")}: ... }
    \item{database}{\code{signature(x = "mzRident")}: ... }
    \item{enzymes}{\code{signature(object = "mzRident")}: ... }
    \item{sourceInfo}{\code{signature(object = "mzRident")}: ... }
    \item{tolerance}{\code{signature(object = "mzRident")}: ... }
    \item{score}{\code{signature(object = "mzRident")}: ... }
    \item{para}{\code{signature(object = "mzRident")}: ... }
    \item{specParams}{\code{signature(object = "mzRident")}: ... }
  }
}

\references{
  Proteowizard: http://proteowizard.sourceforge.net/
}

\author{
  Steffen Neumann, Laurent Gatto, Qiang Kou
}

\examples{
 library(msdata)
 filepath <- system.file("microtofq", package = "msdata")
 file <- list.files(filepath, pattern="MM14.mzML",
                     full.names=TRUE, recursive = TRUE)
 mzml <- openMSfile(file)
 close(mzml)

 ## using the pwiz backend
 mzml <- openMSfile(file, backend = "pwiz")

}

\keyword{classes}
