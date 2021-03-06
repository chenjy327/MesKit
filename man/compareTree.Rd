% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compareTree.R
\name{compareTree}
\alias{compareTree}
\title{compareTree}
\usage{
compareTree(
  phyloTree1,
  phyloTree2,
  plot = FALSE,
  min.ratio = 1/20,
  show.bootstrap = FALSE,
  use.tumorSampleLabel = FALSE
)
}
\arguments{
\item{phyloTree1}{A phyloTree object generated by \code{\link{getPhyloTree}} function.}

\item{phyloTree2}{A phyloTree object generated by \code{\link{getPhyloTree}} function.}

\item{plot}{Logical (Default: FALSE). If TRUE, two trees will be plotted on the same device and their similarities will be shown.}

\item{min.ratio}{Double, Default 1/20. If min.ratio is not NULL,
all edge length which are smaller than min.ratio*the longest edge length will be reset as min.ratio*longest edge length.}

\item{show.bootstrap}{Logical (Default: FALSE). Whether to add bootstrap value on internal nodes.}

\item{use.tumorSampleLabel}{Logical (Default: FALSE). Rename the 'Tumor_Sample_Barcode' by 'Tumor_Sample_Label'.}
}
\value{
A vector containing the following tree distance methods by R package phangorn
Symmetric.difference  Robinson-Foulds distance
KF-branch distance  the branch score distance (Kuhner & Felsenstein 1994)
Path.difference  difference in the path length, counted as the number of branches 
Weighted.path.difference	 difference in the path length, counted using branches lengths
}
\description{
Compares two phylogenetic trees and returns a detailed report of several distance methods
}
\examples{
maf.File <- system.file("extdata/", "CRC_HZ.maf", package = "MesKit")
clin.File <- system.file("extdata/", "CRC_HZ.clin.txt", package = "MesKit")
ccf.File <- system.file("extdata/", "CRC_HZ.ccf.tsv", package = "MesKit")
maf <- readMaf(mafFile=maf.File, clinicalFile = clin.File, ccfFile=ccf.File, refBuild="hg19")


phyloTree1 <- getPhyloTree(maf$V402, method = "NJ")
phyloTree2 <- getPhyloTree(maf$V402, method = "MP")
compareTree(phyloTree1, phyloTree2)
compareTree(phyloTree1, phyloTree2, plot = TRUE)
}
