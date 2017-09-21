# r configs
# mostly done to prompt the user less/etc.

# do not prompt for R install mirror
local({
  r <- getOption("repos")
  r["CRAN"] <- "http://cran.stat.sfu.ca/"
  options(repos = r)
})

# do not use menu graphics when prompting for stuff
options(menu.graphics=FALSE)
options(max.print=100)

# do not prompt to save workspace
q <- function (save="no", ...) {
  quit(save=save, ...)
}

