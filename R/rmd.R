#' Print hook for rgl use in Rmarkdown
#'
#' @export
rmd_hook_rgl <- function() {
  cat("Now you can just use:

```{r, setup}
library(rgl)
setupKnitr(autoprint = TRUE)
```

old version:
```{r, setup}
library(rgl)
knitr::knit_hooks$set(webgl = hook_webgl)
```

Then use webgl = TRUE in chunk")
}
