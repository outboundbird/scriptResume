# install project R packages

lib_repos <- .libPaths()
lib <- lib_repos[2]
curr_libpath <- lib
env_pkgs <- as.vector(installed.packages(lib.loc = curr_libpath)[, "Package"])
req_libs <- c(
  "dplyr","stringr", "BiocManager","devtools")
to_install <- req_libs[!req_libs %in% env_pkgs]


if (length(to_install)) {
  message(sprintf("packages to install: %s", to_install))
  message(sprintf("Execution starts %s", as.character(Sys.time())))

  lapply(to_install, function(pkg) {
    tryCatch(
      {
        message(sprintf("Installing %s", pkg))
        install.packages(to_install,
                         lib,
                         dependencies = TRUE,
                         INSTALL_opts = c("--no-lock")
        )
      },
      error = function(e) {
        warning(e)
      }
    )
  })
}
# Install from Bioconductor -----------------------------------------------


req_bio <- c()

to_install <- req_bio[!req_bio %in% env_pkgs]


if(length(to_install)){
  message(sprintf("Bioconductor packages to install: %s", to_install))
  message(sprintf("Execution starts %s", as.character(Sys.time())))
  lapply(to_install, function(pkg){
    tryCatch({
      BiocManager::install(pkg, update = T)
    }, error = function(e){
      warning(e)
    })
  })
}


# Github repo -------------------------------------------------------------

git_repos <- c()

if(!is.null(git_repos)) {
  git_libs <- stringr::str_extract(git_repos, "(?<=\/).+")
  to_install <- git_repos[!git_libs %in% env_pkgs]
  if(length(to_install)){
    lapply(to_install, function(link) {
      tryCatch({
        devtools::install_github(
          link,
          quiet = TRUE,
          dependencies = TRUE,
          upgrade = "never"
        )
      },
      error = function(e) {
        warning(e)
      })
    })
  }
}