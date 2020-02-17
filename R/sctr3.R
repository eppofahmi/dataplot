#' Scatter plot 3 variables in kedata style
#'
#' @param data Data frame
#' @param x character of column name for x axis
#' @param y character of column name for y axis
#' @param color column name to ploted as point colors
#' @param title character for plot title
#' @param subtitle character for plot subtitle
#' @param data_source character for footer text
#'
#' @return ggdraw object
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(ggplot2)
#' sctr3(data = midwest, x = "area", y = "poptotal", color = "state",
#'       title = "Lorem Ipsum is simply dummy text",
#'       subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'       data_source = "www.kedata.online")
#' }
#'
#' @export
sctr3 <- function(data, x, y, color, title, subtitle, data_source) {
  data <- data[, c(x, y, color)]
  colnames(data) <- c("col1", "col2", "col3")

  p1 <- ggplot2::ggplot(data = data, ggplot2::aes(x = col1, y = col2, color = col3)) +
    ggplot2::geom_point() +
    ggplot2::labs(x = paste0(x), y = paste0(y)) +
    dataplot::kedata_theme()

  kedata_final2(plotname = p1,
                title = paste0(title),
                subtitle = paste0(subtitle),
                data_source = paste0(data_source))
  }
