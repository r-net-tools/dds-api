#' @get /getinfo
getinfo <- function(txt = ""){
  if (grepl(pattern = "^CVE-\\d+-\\d+$", x = txt)) {
    # CVE
    cves <- dds$cves[txt == dds$cves$cve,]
    xplt <- exploitdb[grep(pattern = txt, x = exploitdb$cves, ignore.case = T),]
    xplt <- xplt[order(as.Date.POSIXct(xplt$date), decreasing = T),]
    info <- list(cves, xplt)
  } else if (grepl(pattern = "^CWE-\\d+$", x = txt)) {
    # CWE
    info <- dds$cwes[txt == dds$cwes$code_standard,]
  } else if (grepl(pattern = "^CAPEC-\\d+$", x = txt)) {
    # CAPEC
    info <- dds$capec[substring(txt,7,nchar(txt)) == dds$capec$id,]
  } else {
    # CPE or Exploit
    cpes <- dds$cpes[agrep(pattern = tolower(txt), x = dds$cpes$title), c("cpe.23")]
    print(cpes)
    xplt <- exploitdb[agrep(pattern = txt, x = exploitdb$software, ignore.case = T),]
    xplt <- xplt[order(as.Date.POSIXct(xplt$date), decreasing = T),]
    info <- list(xplt, cpes)
  }
  return(info)
}

