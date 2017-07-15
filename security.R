# Download latests data sets
utils::download.file(url = "https://github.com/r-net-tools/security.datasets/raw/master/net.security/sysdata.rda",
                     destfile = paste(tempdir(),"sysdata.rda",sep = "\\"))
load(file = paste(tempdir(), "sysdata.rda", sep = "\\"))

dds <- netsec.data$datasets
rm(netsec.data)

#' @get /cveinfo
cveinfo <- function(cve = "CVE-2010-2010") {
  dds$cves[cve == dds$cves$cve,]
}

#' @get /cweinfo
cweinfo <- function(cwe = "CwE-20") {
  dds$cwes[cwe == dds$cwes$code_standard,]
}

#' @get /cpeinfo
cpeinfo <- function(cpe = "winamp") {
  cpe <- tolower(cpe)
  dds$cpes[agrep(pattern = cpe, x = dds$cpes$title), c("cpe.23")]
}

#' @get /capecinfo
cpeinfo <- function(capec = "CAPEC-300") {
  capec <- substring(capec,7,nchar(capec))
  dds$capec[capec == dds$capec$id,]
}
