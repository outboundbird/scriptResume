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
check()
load_all()
devtools::check_man()
# devtools::document()
devtools::test()
devtools::check_built('src_')
devtools::install()

codetools::checkUsagePackage("scriptResume")
