NumbersToLabels <- function(m, labels) {
  labelsVector = unlist(labels, use.names = FALSE)
  
  clamp = apply(m, 2, function(x) { (x %% length(labelsVector)) + 1L }) %>%
  apply(clamp, 2, function(y) { labelsVector[y] })
}

BindData <- function(data, labels, name) {
  NumbersToLabels(labels, name) %>%
    data.frame(labels = .) %>%
      cbind(., data)
}

hhead <- function(x) {
  x[1:6, 1:6]
}
