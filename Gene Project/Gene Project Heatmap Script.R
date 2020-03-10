library("bio3d")
library("viridis")

read.fasta("Gene Project Fasta")

data <- read.fasta("Gene Project Mega Fasta.fas")

# calculate sequence identity
seq.id <- seqidentity(data, normalize=TRUE, similarity=FALSE, ncore=1, nseg.scale=1)

# heatmap it
pdf("heatmap.pdf")
heatmap(seq.id,scale="none",col = viridis(256),margins=c(10,11))
dev.off()



# make consensus sequence
con <- consensus(data)
# count how many gaps
table(con[["seq"]]) # 206 gaps.... just use query sequence
# find best representative sequence
which.max(rowSums(seq.id))
# house mouse has the best sequence, so I saved it as a new fasta

mouse <- read.fasta("Mouse_PCD")
# now blast the pdb
blastresults <- blast.pdb(mouse)
# saved the blast results

blastresults

# now read in list of pdb files
l <- read.csv("list.csv",header=FALSE)
pdb.annotate("1DCH")





