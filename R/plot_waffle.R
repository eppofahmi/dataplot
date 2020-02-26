#' Waffle chart in kedata style
#'
#' @param data data frame
#' @param x character of column name for x axis
#' @param y character of column name for y axis
#' @param ndeep number of waffle
#' @param title character for plot title
#' @param subtitle character for plot subtitle
#' @param data_source character for footer text
#'
#' @return ggplot object
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(dataplot)
#'
#' df <- structure(list(
#'   region = c(
#'     "Africa", "Asia", "Latin America",
#'     "Other", "US-born"
#'   ),
#'   ncases = c(36L, 34L, 56L, 2L, 44L)
#' ),
#' .Names = c("region", "ncases"),
#' row.names = c(NA, -5L), class = "data.frame"
#' )
#'
#' plot_waffle(
#'   data = df, x = "region", y = "ncases", ndeep = 10,
#'   title = "Lorem Ipsum is simply dummy text",
#'   subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'   data_source = "www.kedata.online"
#' )
#' }
#' @export
plot_waffle <-
  function(data,
           x,
           y,
           ndeep,
           title,
           subtitle,
           data_source) {
    data <- data[, c(x, y)]
    colnames(data) <- c("col1", "col2")

    # Data
    ndeep <- ndeep

    tb4waffles <-
      expand.grid(y = 1:ndeep, x = seq_len(ceiling(sum(data$col2) / ndeep)))

    # Expand the counts into a full vector of region labels - i.e., de-aggregate
    regionvec <- rep(data$col1, data$col2)

    # than there are cases - so fill those with NA
    tb4waffles$region <-
      c(regionvec, rep(NA, nrow(tb4waffles) - length(regionvec)))

    # tb4waffles <- tb4waffles %>%
    #   filter(!is.na(region))

    tb4waffles <- na.omit(tb4waffles)

    # Plot it
    wp <- ggplot2::ggplot(tb4waffles, ggplot2::aes(x = x, y = y, fill = region)) +
      ggplot2::geom_tile(color = "white") + # The color of the lines between tiles
      ggplot2::scale_x_continuous(expand = c(0, 0)) +
      ggplot2::scale_y_continuous(expand = c(0, 0), trans = "reverse") +
      ggplot2::scale_fill_brewer(palette = "Set3") +
      kedata_theme()

    # Finishing
    kedata_final2(
      plotname = wp,
      title = paste0(title),
      subtitle = paste0(subtitle),
      data_source = paste0(data_source)
    )
  }
