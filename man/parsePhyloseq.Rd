% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parser.R
\name{parsePhyloseq}
\alias{parsePhyloseq}
\title{parsePhyloseq}
\usage{
parsePhyloseq(physeq, use_abundance = TRUE, node.size.scale = 1,
  node.size.offset = 1)
}
\arguments{
\item{physeq}{a phyloseq object}

\item{node.size.scale}{the parameter 'a' controlling node size: nodeSize=a*log(relative_abundance)+b}

\item{node.size.offset}{the parameter 'b' controlling node size: nodeSize=a*log(relative_abundance)+b}
}
\value{
a treeio::treedata object
}
\description{
parse a phyloseq object to a tree object
}
\examples{
data("GlobalPatterns")
GP = GlobalPatterns
otu_table = otu_table(GP)
tax_table = tax_table(GP)

# Use the OTUs that make up 99\% of the total
lib_size = colSums(otu_table)
mat = sapply(1:ncol(otu_table), function(i)
    otu_table[,i]/lib_size[i] >= 0.01)
ind = rowSums(mat)>=1

otu_table = otu_table[ind,]
tax_table = tax_table[ind,]

physeq = phyloseq(otu_table, tax_table) \%>\%
    fix_duplicate_tax()

tr = parsePhyloseq(physeq, use_abundance = F)
p = tree.backbone(tr, size=1)
}
\author{
Chenghao Zhu, Chenhao Li, Guangchuang Yu
}
