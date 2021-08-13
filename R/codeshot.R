codeshot <- function(png = tempfile(fileext = ".png"), width = 400, height = 600, comment = "#>", ...) {
  html <- reprex::reprex(venue = "html", comment = comment, advertise = FALSE)
  temp_html <- tempfile(fileext = ".htm")
  readr::write_lines(html, temp_html)
  webshot::webshot(temp_html, png, vwidth = width, vheight = height, ...)
  rstudioapi::viewer(png)
  png
}
