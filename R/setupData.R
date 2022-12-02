
library(here)

CifarTrain <- function(filepath = "data/cifar-10-binary/cifar-10-batches-bin/", pattern = "data_batch.*") {
  list.files(here::here(filepath), pattern, full.names = TRUE)
}

CifarTest <- function(filepath = "data/cifar-10-binary/cifar-10-batches-bin/", pattern = "test_batch.*") {
  list.files(here::here(filepath), pattern, full.names = TRUE)
}

CifarLabelnames <- function(filepath = "data/cifar-10-binary/cifar-10-batches-bin/", file = "batches.meta.txt") {
  read.table(here::here(paste0(filepath, "/", file)))
}

ReadCifarData <- function(filepath = CifarTrain(), simplify = TRUE) {
  cifar = sapply(
    filepath, ScanBinary, Image, imagePixels = 1024L, imageChannels = 3L, 
    imageCount = 10000L, imageLabels = 1L
  )
  
  if (simplify) {
    invisible(ThreeToTwoDims(UnlistDims(cifar)))
  } else {
    invisible(UnlistDims(cifar))
  }
}

ReadCifarLabels <- function(path = CifarTrain()) {
  invisible(sapply(path, ScanBinary, Label))
}
