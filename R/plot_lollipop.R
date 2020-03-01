#' Lollipop chart in kedata style
#'
#' @param data data frame
#' @param x column name
#' @param y column name
#' @param title character
#' @param subtitle character
#' @param data_source character
#'
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_segment
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 ggplot
#' @importFrom stats reorder
#'
#' @return ggplot objek
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(ggplot2)
#'
#' df <- data.frame(
#'   "brand" = c("Samsung", "Huawei", "Apple", "Xiaomi", "OPPO"),
#'   "share" = c(10, 30, 20, 35, 5)
#' )
#'
#' plot_lollipop(data = df, x = "brand", y = "share",
#'               title = "Lorem Ipsum is simply dummy text",
#'               subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'               data_source = "www.kedata.online"
#'               )
#' }
#' @export
plot_lollipop <- function(data, x, y, title, subtitle, data_source) {
  options(warn=-1)
  df <- data[, c(x, y)]
  colnames(df) <- c("col1", "col2")

  p1 <- ggplot(df, aes(x=reorder(col1, col2), y=col2)) +
    geom_point(size=5, show.legend = FALSE, colour = "#274374") +
    geom_segment(aes(x=col1, xend=col1, y=0, yend=col2), colour = "#274374", show.legend = FALSE) +
    theme(axis.text.x = element_text(angle=90, vjust=0.6, family = "Roboto")) +
    labs(x = paste0(x), y = paste0(y))
    kedata_theme()

  # Finishing
  kedata_final2(
    plotname = p1,
    title = paste0(title),
    subtitle = paste0(subtitle),
    data_source = paste0(data_source)
  )
}

