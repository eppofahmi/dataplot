#' Saving wordcloud2 object as png
#'
#' @param graphfile wordcloud2 object
#' @param filename name for saved file
#'
#' @return png files
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(tidytext)
#' library(tidyr)
#' library(dplyr)
#'
#' teks <- dataplot::datatwit
#' teks <- teks %>%
#'   unnest_tokens(kata, full_text_norm, token = "ngrams", n = 1) %>%
#'   count(kata, sort = TRUE) %>%
#'   head(n = 150)
#'
#' my_graph <- wordcloud2(teks,
#'                        size = 2.3,
#'                        minRotation = -pi/0,
#'                        maxRotation = -pi/0,
#'                        rotateRatio = 1,
#'                        color = "grey",
#'                        fontFamily = "Roboto")
#'
#' save_wcloud2(graphfile = my_graph, filename = "coba.png")
#' }
#' @export
save_wcloud2 <- function(graphfile, filename) {
  set.seed(1234)

  htmlwidgets::saveWidget(graphfile, paste0(tempdir(), "tmp.html"),selfcontained = F)
  webshot::webshot(paste0(tempdir(), "tmp.html"), paste0(filename), delay =5, vwidth = 640, vheight=480)
}
