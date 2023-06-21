# Instalar los paquetes necesarios
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")


BiocManager::install(c("DESeq2", "edgeR", "limma",
                       "clusterProfiler", "org.Hs.eg.db", 
                       "pheatmap", "biomaRt", "mixOmics",
                       "apeglm", "Gviz", "ReportingTools",
                       "sva", "RUVSeq"))
