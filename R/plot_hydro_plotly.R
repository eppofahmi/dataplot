#' Create hydroplot using plotly
#'
#' @param df data frame/flat data
#' @param dates date time format
#' @param flow flow data (numeric)
#' @param rain rain data (numeric)
#' @param right_label text for right label
#' @param left_label text for left label
#'
#' @importFrom tidyr %>%
#'
#' @return plotly object
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(plotly)
#'
#' rainfall <- dataplot::dataset
#'
#' plotly_hydro(
#'   df = rainfall, dates = rainfall$`Date Time`,
#'   flow = rainfall$Discharge,
#'   rain = rainfall$`Rainfall depth (mm)`,
#'   right_label = "rainfall",
#'   left_label = "discharge"
#' )
#' }
#' @export
plotly_hydro <- function(df, dates, flow, rain, right_label, left_label) {

  # 1st Y lable
  y <- list(title = paste0(left_label))
  # 2n Y lable
  rainAx <- list(
    overlaying = "y",
    side = "right",
    title = paste0(right_label),
    range = c(max(rain) * 1.5, 0),
    showgrid = FALSE
  )

  plotly::plot_ly() %>%
    # line chart
    plotly::add_trace(
      x = ~dates, y = ~flow, name = paste0(colnames(df)[2]),
      type = "scatter", mode = "lines", yaxis = "y1"
    ) %>%
    # bar chart
    plotly::add_trace(
      x = ~dates, y = ~rain, name = paste0(colnames(df)[3]),
      type = "bar", yaxis = "y2"
    ) %>%
    plotly::layout(yaxis2 = rainAx, yaxis = y)
}
