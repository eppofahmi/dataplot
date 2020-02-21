#' Correlation plot in kedata style
#'
#' @description Membuat plot korelasi antar variabel
#'
#' @param data data frame conatin of all numerci varibale
#' @param title character for plot title
#' @param subtitle character for plot subtitle
#' @param data_source character for footer text
#'
#' @return ggplot and ggarrange object
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(ggplot2)
#'
#' plot_cor(data = mtcars,
#'          title = "Lorem Ipsum is simply dummy text",
#'          subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'          data_source = "Sumber Data")
#' }
#' @export
plot_cor <- function(data, title, subtitle, data_source) {
  corr <- round(cor(data), 1)

  p1 <- ggcorrplot::ggcorrplot(
    corr,
    hc.order = TRUE,
    type = "lower",
    sig.level = TRUE,
    lab = TRUE,
    method = "square",
    colors = c("#E1D555", "#30516E", "#5ED6FF"),
    ggtheme = dataplot::kedata_theme()
  )

  kedata_final2(
    plotname = p1,
    title = paste0(title),
    subtitle = paste0(subtitle),
    data_source = paste0(data_source)
  )
}
