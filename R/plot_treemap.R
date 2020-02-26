#' Create treemap plot
#'
#' @param data data frame
#' @param area numeric data to be plotting
#' @param fill categorical data
#' @param subgroup categorical data (optional)
#' @param title character title
#' @param subtitle character subtitle
#' @param data_source character data source
#'
#' @return ggplot objek
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(dataplot)
#'
#' df <- G20
#' plot_treemap(data = df,
#'              area = "gdp_mil_usd",
#'              fill = "region",
#'              subgroup = "country",
#'              title = "Lorem Ipsum is simply dummy text",
#'              subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'              data_source = "www.kedata.online"
#'              )
#'
#' plot_treemap(data = df,
#'              area = "gdp_mil_usd",
#'              fill = "region",
#'              subgroup = "country",
#'              title = "Lorem Ipsum is simply dummy text",
#'              subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'              data_source = "www.kedata.online"
#'              )
#' }
#' @export
plot_treemap <- function(data, area, fill, subgroup, title, subtitle, data_source) {
  options(warn=-1)
  if (missing(subgroup)) {

    areanya <- paste0(area)
    regionnya <- paste0(fill)

    p1 <- ggplot2::ggplot(data, ggplot2::aes(area = data[, areanya],
                                       fill = data[, regionnya])) +
      treemapify::geom_treemap() +
      treemapify::geom_treemap_text(ggplot2::aes(label=data[, regionnya]), color="#F26419")+
      ggplot2::scale_x_continuous(expand = c(0, 0)) +
      ggplot2::scale_y_continuous(expand = c(0, 0)) +
      ggplot2::scale_fill_brewer(palette = "Set3") +
      kedata_theme()

    p1 <- kedata_final2(plotname = p1,
                        title = paste0(title),
                        subtitle = paste0(subtitle),
                        data_source = paste0(data_source))
    p1

  } else {
    areanya <- paste0(area)
    regionnya <- paste0(fill)
    subs <- paste0(subgroup)

    p1 <- ggplot2::ggplot(data, ggplot2::aes(area = data[, areanya],
                                       fill = data[, regionnya],
                                       subgroup = data[, subs])) +
      treemapify::geom_treemap() +
      treemapify::geom_treemap_subgroup_text(color="#274374", size = 18)+
      treemapify::geom_treemap_text(ggplot2::aes(label=data[, regionnya]), color="#F26419")+
      ggplot2::scale_x_continuous(expand = c(0, 0)) +
      ggplot2::scale_y_continuous(expand = c(0, 0)) +
      ggplot2::scale_fill_brewer(palette = "Set3") +
      kedata_theme()

    p1 <- kedata_final2(plotname = p1,
                        title = paste0(title),
                        subtitle = paste0(subtitle),
                        data_source = paste0(data_source))

    p1
  }
}
