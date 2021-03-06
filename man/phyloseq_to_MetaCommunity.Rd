% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/phyloseq_to_MetaCommunity.R
\name{phyloseq_to_MetaCommunity}
\alias{phyloseq_to_MetaCommunity}
\title{Convert phyloseq data to entropart MetaCommunity object.}
\usage{
phyloseq_to_MetaCommunity(physeq, wei = NULL)
}
\arguments{
\item{physeq}{A phyloseq-class object}

\item{wei}{A vector of positive numbers equal to community weights (could be NULL for equal weights)}
}
\value{
A \code{\link[entropart]{MetaCommunity}} class object
}
\description{
The phyloseq data is converted to the MetaCommunity object (entropart package),
which can then be used for measurement and partitioning of diversity, including
species-neutral, phylogenetic and functional diversity metrics.
}
\examples{
# Load data
data("esophagus")

library(entropart)

# Convert phyloseq to MetaCommunity class
eso <- phyloseq_to_MetaCommunity(esophagus)
summary(eso)

# Estimate diversity (Shannon diversity, q=1)
ad <- AlphaDiversity(eso, q = 1, Correction = "None")
summary(ad)
plot(ad)

# Diversity partitioning into alpha and beta components
dp <- DivPart(q = 1, eso, Correction = "None")
summary(dp)
plot(dp)

# Diversity profile
dpr <- DivProfile(q.seq = seq(0, 2, 0.1), eso, Correction = "None")
summary(dpr)
plot(dpr)

}
\seealso{
\code{\link[entropart]{MetaCommunity}}
}
