#---------------------------------------------------------
# Install some basic packages during the container build
#---------------------------------------------------------

options(repos=c(CRAN="https://cloud.r-project.org"))

install.packages("pak")

pkgs <- c("renv", "RhpcBLASctl", "rmdformats", "bookdown", "markdown", "rmarkdown", "remotes", "devtools")
pak::pkg_install(pkgs)
pak::cache_clean()