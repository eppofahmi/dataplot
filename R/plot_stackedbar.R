#' Created stackedbar in kedata style
#'
#' @param data data frame
#' @param x colname for x variable
#' @param y colname for y variable
#' @param fill colname for fill
#' @param title character
#' @param subtitle character
#' @param data_source character
#' @param x_title character
#' @param y_title character
#'
#' @return ggplot object
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(dataplot)
#' library(tidyr)
#' library(dplyr)
#'
#' df1 <- mpg %>%
#'   count(manufacturer, class)
#'
#' plot_stackedbar(data = df1,
#'                 x = "manufacturer",
#'                 y = "n",
#'                 fill = "class",
#'                 x_title = "col_x",
#'                 y_title = "col_y",
#'                 title = "Lorem Ipsum is simply dummy text",
#'                 subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'                 data_source = "www.kedata.online")
#' }
#' @export
plot_stackedbar <- function(data, x, y, fill, title, subtitle, data_source, x_title, y_title) {
  options(warn=-1)
  df <- data[, c(x, y, fill)]
  colnames(df) <- c("col1", "col2", "col3")

  p1 <- ggplot2::ggplot(data = df, ggplot2::aes(x = col1, y = col2, fill = col3)) +
    ggplot2::geom_col() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle=65, vjust=0.6)) +
    ggplot2::scale_fill_brewer(palette = "Set3") +
    ggplot2::labs(x = paste0(x_title), y = paste0(y_title)) +
    kedata_theme()

  kedata_final2(plotname = p1,
                title = paste0(title),
                subtitle = paste0(subtitle),
                data_source = data_source)
  }
