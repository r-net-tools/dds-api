library("plumber")

utils::download.file(url = "https://github.com/r-net-tools/security.datasets/raw/master/net.security/sysdata.rda",
                     destfile = paste(tempdir(),"sysdata.rda",sep = "\\"))
load(file = paste(tempdir(), "sysdata.rda", sep = "\\"))
dds <- netsec.data$datasets
rm(netsec.data)

utils::download.file(url = "https://github.com/r-net-tools/security.datasets/raw/master/explpoitdb/exploitdb.rda",
                     destfile = paste(tempdir(),"exploitdb.rda",sep = "\\"))
load(file = paste(tempdir(), "exploitdb.rda", sep = "\\"))

r <- plumb("security.R")
r$run(port=7374)
