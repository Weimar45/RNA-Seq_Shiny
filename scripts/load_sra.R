# Prueba de carga de datos de un experimento

# Cargar el paquete SRAdb
library(SRAdb)

# El nombre del archivo .gz que descargaste
gzfile <- "database/SRAmetadb.sqlite.gz"

# El nombre del archivo SQLite descomprimido
sqlfile <- "database/SRAmetadb.sqlite"

# Descargar la base de datos SQLite de SRA 
file.remove(gzfile)
sqlfile <- getSRAdbFile()

# Si da error la función, descargar manualmente de una de estas funciones 
url_sra <- "https://s3.amazonaws.com/starbuck1/sradb/SRAmetadb.sqlite.gz"
url_sra <- "https://gbnci-abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz"


# Descomprimir el archivo
R.utils::gunzip(
  gzfile,
  destname = sqlfile, 
  overwrite = TRUE
)

# Conectarse a la base de datos SQLite de SRA
sra_con <- dbConnect(SQLite(), 'database/SRAmetadb.sqlite')

# Busca los experimentos de RNA-seq para un organismo específico
experiments <- getSRA(
  search_terms = "Homo sapiens[Organism] AND rna seq",
  out_types = "run", 
  sra_con = sra_con)

# Descarga los datos de los experimentos
for (run in experiments$run) {
  download.file(paste0("ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/", substr(run, 1, 6), "/", run, "/", run, ".sra"), destfile = paste0(run, ".sra"))
}