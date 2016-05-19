#!/usr/bin/Rscript
rsname <- read.table("/home/ll272/Network_autism/rsname", header = F)
library(biomaRt)

mart.snp <- useMart("ENSEMBL_MART_SNP", "hsapiens_snp")
#mart_attributes <- listAttributes(mart.snp)


rsname_ENSG <- getBM(attributes = c("refsnp_id", "ensembl_gene_stable_id"),
                   filters    = "snp_filter", values = rsname, mart = mart.snp)

write.table(rsname_ENSG,file="/home/ll272/Network_autism/rsname_ENSG",row.names=FALSE)



