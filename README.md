# scriptResume
R adding package to facilitate coding experience

# Installation
`scriptResume` summarized input/output lib usage from a R script.
It can be installed at command line:
`R CMD INSTALL scriptResume_0.1.0.tgz`
or in R:

```
install.packages(
    "scriptResume_0.1.0.tgz",
    repos = NULL, type = .Platform$pkgType
)
```
or

```
devtools::install_github("outboundbird/scriptResume")
```

# Features
## Addin features
- insert header
- insert unique libraries
- object to quoted text
- transform multiple text selection into Roxygen comments
- transform selected text to upper or lower cases

## Package features
