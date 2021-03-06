% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotPhyloTree.R
\name{plotPhyloTree}
\alias{plotPhyloTree}
\title{plotPhyloTree}
\usage{
plotPhyloTree(
  phyloTree,
  patient.id = NULL,
  branchCol = "mutType",
  show.bootstrap = TRUE,
  min.ratio = 1/20,
  signaturesRef = "cosmic_v2",
  min.mut.count = 15,
  use.tumorSampleLabel = FALSE,
  show.scale.bar = FALSE,
  scale.bar.x = NULL,
  scale.bar.y = NULL
)
}
\arguments{
\item{phyloTree}{phyloTree or phyloTreeList object generated by \code{\link{getPhyloTree}} function.}

\item{patient.id}{Select the specific patients. Default NULL, all patients are included.}

\item{branchCol}{Specify the colors of branches Default 'mutType'. Other options: "mutSig" for coloring branches by branch mutation signature;}

\item{show.bootstrap}{Logical (Default: TRUE). Whether to add bootstrap value on internal nodes.}

\item{min.ratio}{Double. Default 1/20. If min.ratio is not NULL,
all edge length of a phylogenetic tree should be greater than
min.ratio*the longest edge length.
If not, the edge length will be reset as min.ratio*longest edge length.}

\item{signaturesRef}{Signature reference,Users can upload their own reference. Default "cosmic_v2". Option:"exome_cosmic_v3","nature2013".}

\item{min.mut.count}{The threshold for the variants in a branch. Default 15.}

\item{use.tumorSampleLabel}{Logical (Default: FALSE). Rename the 'Tumor_Sample_Barcode' with 'Tumor_Sample_Label'.}

\item{show.scale.bar}{Logical (Default: FALSE). Whether to show scale bar.This function adds a horizontal bar giving the scale of the branch lengths to a plot on the current graphical device.}

\item{scale.bar.x}{The x location of scale bar.}

\item{scale.bar.y}{The y location of scale bar.}
}
\value{
return a list of phylotree graph .
}
\description{
plotPhyloTree
}
\examples{
maf.File <- system.file("extdata/", "CRC_HZ.maf", package = "MesKit")
clin.File <- system.file("extdata/", "CRC_HZ.clin.txt", package = "MesKit")
ccf.File <- system.file("extdata/", "CRC_HZ.ccf.tsv", package = "MesKit")
maf <- readMaf(mafFile=maf.File, clinicalFile = clin.File, ccfFile=ccf.File, refBuild="hg19")

phyloTree <- getPhyloTree(maf, patient.id = 'V402')
plotPhyloTree(phyloTree)
}
