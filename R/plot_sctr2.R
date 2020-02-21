#' Scatter plot 2 variables in kedata style
#'
#' @description Membuat scater dengan dua variabel dalam gaya kedata
#'
#' @param data data frame
#' @param x character of column name for x axis
#' @param y character of column name for y axis
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
#'
#' plot_sctr2(data = economics, x = "psavert", y = "uempmed",
#'       title = "Lorem Ipsum is simply dummy text",
#'       subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'       data_source = "www.kedata.online")
#'
#' ggsave(filename = "tes.png", dpi = 300, height = 6, width = 9)
#' }
#'
#' @export
plot_sctr2 <- function(data, x, y, title, subtitle, data_source) {

  data <- data[, c(x, y)]

  colnames(data) <- c("col1", "col2")

  p1 <- ggplot2::ggplot(data = data, ggplot2::aes(x = col1, y= col2)) +
    ggplot2::geom_point(color = "#274374") +
    ggplot2::labs(x = paste0(x), y = paste0(y)) +
    dataplot::kedata_theme()

  kedata_final2(plotname = p1,
                title = paste0(title),
                subtitle = paste0(subtitle),
                data_source = paste0(data_source))
  }
