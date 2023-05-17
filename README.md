
# scriptResume

I wrote this package to make peace with my own laziness. My routine
scripting work requires frequent documentation process. This R addin
package was born to facilitate coding experience. And of course, all the
default parameters are set to fit my own need. :zany_face: To achieve
the best user experience, I use these addin functions with keyboard
binding short cuts in VScode or other IDEs that allow user defined
keyboard shortcuts.

*I'm not sure how relevant this package can be outside of my current
workplace setting.* As I get lazier, I will add more addin functions and
of course, the existing functions will be tailed to my future needs.
:hear_no_evil:

# Installation

`scriptResume` summarized input/output lib usage from a R script. It can
be installed at command line: `R CMD INSTALL scriptResume_0.1.4.tgz` or
in R:

    install.packages(
        "scriptResume_0.1.4.tgz",
        repos = NULL, type = .Platform$pkgType
    )

or

    devtools::install_github("outboundbird/scriptResume")

# Features

<img src="vignettes/misc/rstudio_shot.PNG" alt="Screenshot in R studio" width="264"/>

<img src="vignettes/misc/vscode_shot.png" alt="Screenshot in VScode" width="411"/>
