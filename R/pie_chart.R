#' Pie chart in kedata style
#'
#' @description create pie chart form 2 variabel in kedata style. Percentage computed from
#'       each y varaibel value / total of y value * 100
#'
#' @param data data frame with 2 variabel representing categorical and numeric data
#' @param x categorical variabel
#' @param y numeric variabel
#' @param color character of color hexagon for coloring x variabel
#' @param title character
#' @param subtitle character
#' @param data_source character
#'
#' @return ggplot ggarrange object
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(ggplot2)
#'
#' df = data.frame("brand" = c("Samsung","Huawei","Apple","Xiaomi","OPPO"),
#'                 "share" = c(10,30,20,35,5))
#'
#' mycolor <- c("#55DDE0", "#33658A", "#2F4858", "#F6AE2D", "#F26419")
#'
#' pie_plot(data = df, x = "brand", y = "share", color = mycolor,
#'          title = "Lorem Ipsum is simply dummy text",
#'          subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'          data_source = "Sumber: www.kedata.online")
#' }
#' @export
pie_plot <- function(data, x, y, color, title, subtitle, data_source) {
  # Data
  data <- data[, c(x, y)]
  colnames(data) <- c("col1", "col2")
  # Pie
  pie = ggplot(data, aes(x = "", y = col2, fill = col1)) +
    geom_bar(stat = "identity", width = 1)

  # Convert to pie (polar coordinates) and add labels
  pie = pie + coord_polar("y", start = 0) +
    geom_text(aes(label = paste0(round((col2/sum(data$col2)) * 100, 2), "%")),
              position = position_stack(vjust = 0.5),
              color = "white")
  # Add color scale (hex colors)
  pie = pie + scale_fill_manual(values = color)

  # Remove labels and add title
  pie = pie + labs(x = NULL, y = NULL, fill = NULL)
  # Tidy up the theme
  # ggplot2::theme_set(cowplot::theme_minimal_grid())  # pre-set the bw theme.
  pie = pie + theme(
    axis.line = element_blank(),
    text = ggplot2::element_text(size = 10,  family = "Roboto"),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_text(hjust = 0.5, color = "#666666")
  ) +
    theme_void()
  # Finishing
  kedata_final2(
    plotname = pie,
    title = paste0(title),
    subtitle = paste0(subtitle),
    data_source = paste0(data_source)
  )
}

