#' Dumbbell plot in kedata style
#'
#' @param data data frame
#' @param cat character
#' @param x1 colname 1
#' @param x2 colname 2
#' @param size numerik
#' @param x_title character
#' @param y_title character
#' @param title character
#' @param subtitle character
#' @param data_source character
#'
#' @importFrom ggalt geom_dumbbell
#'
#' @return ggplot object
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#'
#' s <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv")
#' s$School <- factor(s$School, levels = s$School[order(s$Men)])
#'
#' plot_dumbbell(data = s,
#'               cat = "School",
#'               x1 = "Women",
#'               x2 = "Men",
#'               size = 3,
#'               x_title = "Salary",
#'               y_title = "School",
#'               title = "Gender earnings disparity",
#'               subtitle = "Gender earnings disparity from Women VS Men based on University",
#'               data_source = "www.kedata.online")
#' }
#' @export
plot_dumbbell <- function(data, cat, x1, x2, size, x_title, y_title, title, subtitle, data_source) {
  options(warn = 1)
  df <- data[, c(cat, x1, x2)]
  colnames(df) <- c("kolom1", "kolom2", "kolom3")

  p1 <- ggplot2::ggplot(df, ggplot2::aes(x = kolom2, xend = kolom3, y = kolom1, area = kolom1)) +
    ggalt::geom_dumbbell(size_xend = size, size_x = size, show.legend = TRUE,
                         colour_x = "#333F48",
                         colour_xend = "#E4E83B",
                         color = "#B2BBAD") +
    kedata_theme() +
    ggplot2::labs(x = paste0(x_title), y = paste0(y_title))

  kedata_final2(
    plotname = p1,
    title = paste0(title),
    subtitle = paste0(subtitle),
    data_source = paste0(data_source)
  )
}
