#' Marginal plot on scatter plot
#'
#' @description Membuat marginal plot untuk menunjukkan distribusi variabel
#'              dalam scatter plot
#'
#' @param data data frame
#' @param x character of column name for x axis
#' @param y character of column name for y axis
#' @param title character for plot title
#' @param subtitle character for plot subtitle
#' @param data_source character for footer text
#' @param mg_type type of marginal plot
#'
#' @return ggplot ggarrange object
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(ggplot2)
#'
#' p1 <- plot_mrg(data = economics, x = "psavert", y = "uempmed",
#'               title = "Lorem Ipsum is simply dummy text",
#'               subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'               data_source = "www.kedata.online",
#'               mg_type = "histogram")
#'
#' p1
#' }
#' @export
plot_mrg <-
  function(data,
           x,
           y,
           title,
           subtitle,
           data_source,
           mg_type = c("histogram", "boxplot", "density")) {
    data <- data[, c(x, y)]

    colnames(data) <- c("col1", "col2")

    p1 <-
      ggplot2::ggplot(data = data, ggplot2::aes(x = col1, y = col2)) +
      ggplot2::geom_point(color = "#274374") +
      ggplot2::labs(x = paste0(x), y = paste0(y)) +
      dataplot::kedata_theme()

    p1 <-
      ggExtra::ggMarginal(p1,
                 type = paste0(mg_type),
                 fill = "transparent",
                 col = "#274374")

    kedata_final2(
      plotname = p1,
      title = paste0(title),
      subtitle = paste0(subtitle),
      data_source = paste0(data_source)
    )
  }
