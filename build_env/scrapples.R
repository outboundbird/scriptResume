library(rstudioapi)
library(stringr)
documentPath()
getActiveDocumentContext()
path <- getActiveDocumentContext()$path

path <- "~/wise/DEVOPS/SAR447537/INBRX101/BMK/EXPLO/PGM/datacheck_BMK.R"

triplet <- str_split(path, "/") %>%
unlist() %>%
.[1:6] %>%
paste(., collapse = "/")

source_loc <- "METADATA/WISE/alloc_ana.R"

triplet_source_path <- file.path(triplet, source_loc)


source_cmd <- paste0("source(",triplet_source_path,")")
rstudioapi::callFun(source_cmd)

rstudioapi::callFun("versionInfo")


source_triplet_env()
text <- "'A', \"B, C'"

stringr::str_replace_all(text, "\"|'", "")
# check development problems -----------------------------------------
library(devtools)
devtools::check(manual = F)
devtools::load_all()
devtools::check_man()
# generate Rd files
devtools::document()
# build vignette, if update vg, need to manually move html file into the docs dir to publish in traditional way
# devtools::build_vignettes()
# use package down to build vignette
# pkgdown::build_site()
pkgdown::build_site_github_pages()
pkgdown::build_articles_index()
pkgdown::build_reference()

# build package
devtools::build()
devtools::test()
devtools::check_built("build_env")
devtools::install()

codetools::checkUsagePackage("scriptResume")

