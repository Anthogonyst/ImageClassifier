

Image <- function(pos, conn, bytes, repeats, preReadOffset, ...) {
  seek(conn, pos, origin = "start")
  seek(conn, preReadOffset, origin = "current")
  
  array(sapply(seq_len(repeats), function(x) {
    as.integer(readBin(conn, raw(), size = 1L, n = bytes, endian = "big"))
  }), dim = c(imagePixels = bytes, imageChannels = repeats))
}

Label <- function(pos, conn, ...) {
  seek(conn, pos, origin = "start")
  # readBin(Label) + 1 to conform starting value on 1 instead of 0; optional
  readBin(conn, integer(), size = 1L, n = 1L, endian = "big") + 1L
}

MultiLabel <- function(pos, conn, bytes, repeats, preReadOffset, ...) {
  seek(conn, pos, origin = "start")
  
  array(sapply(seq_len(preReadOffset), function(x) {
    as.integer(readBin(conn, raw(), size = 1L, n = 1L, endian = "big"))
  }), dim = c(index = 1, label = preReadOffset))
}

FindPos <- function(len, size = 1024L*3L + 1L) {
  seq.int(0L, size*len - 1L, size)
}

ScanBinary <- function(imgPath, FUN = Image, imagePixels = 1024L, imageChannels = 3L, imageCount = 10000L, imageLabels = 1L) {
  conn <- file(imgPath, "rb")
  bytePos = FindPos(imageCount, imagePixels*imageChannels + imageLabels)
  images = lapply(bytePos, FUN, conn, bytes = imagePixels, repeats = imageChannels, preReadOffset = imageLabels)
  close(conn)
  
  return(images)
}

CountImages <- function(imgPath, rawSize = 3073L) {
  file.size(imgPath) / rawSize
}

CountImagesByPixel <- function(imgPath, imagePixels = 1024L, imageChannels = 3L, imageLabels = 1L) {
  file.size(imgPath) / (imagePixels*imageChannels + imageLabels)
}

ConformDims <- function(x, useNames = TRUE) {
  val = c(imagePixels = dim(x[[1]])[1], imageChannels = dim(x[[1]])[2], imageCount = length(x))
  
  if (useNames) {
    names(val) = c("imagePixels", "imageChannels", "imageCount")
  }
  
  return(val)
}

UnlistDims <- function(binaryLists) {
  array(unlist(binaryLists, TRUE), ConformDims(binaryLists))
}

ThreeToTwoDims <- function(binMatrix) {
  array(binMatrix, dim = c(image = prod(rev(dim(binMatrix))[-1]), imageCount = rev(dim(binMatrix))[1]))
}

