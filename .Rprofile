# r configs
# mostly done to prompt the user less/etc.

# do not prompt for R install mirror
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cran.rstudio.com/"
  options(repos = r)
})

# do not prompt to save workspace
q <- function (save="no", ...) {
  quit(save=save, ...)
}

options(
  menu.graphics=FALSE,
  max.print=100,
  rice.prompt="\033[01;033mr>\033[0m ",
  rice.editing_mode='vi'
)

