create_footer <- function(source_name) {
  # Make the footer
  footer <-
    grid::grobTree(
      grid::rectGrob(gp = grid::gpar(fill = "#323441", lwd = 0)),
      grid::textGrob(
        source_name,
        x = 0.022,
        hjust = 0,
        gp = grid::gpar(
          fontsize = 10,
          family = "Roboto",
          col = "white"
        )
      ),
      grid::rasterGrob(png::readPNG(
        system.file("extdata/logo/", "logokedata2.png", package = "dataplot")
      ),
      x = 0.912
      )
    )
  return(footer)
}

#' Kedata style 2
#'
#' @description Menempatkan footer dibagian bawah yang terdiri dari logo dan data source
#'
#' @param plotname ggplot object
#' @param title character for plot title
#' @param subtitle character for plot subtitle
#' @param data_source character for plot caption
#'
#' @return ggdraw object
#'
#' @examples
#' \dontrun{
#' library(dataplot)
#' library(ggplot2)
#'
#' p1 <- ggplot(data = economics, aes(x = pce, y = pop)) +
#'   geom_line() +
#'   kedata_theme()
#'
#' kedata_final2(
#'   plotname = p1,
#'   title = "Lorem Ipsum is simply dummy text",
#'   subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'   data_source = "Sumber Data"
#' )
#' }
#'
#' @export
kedata_final2 <- function(plotname,
                          title,
                          subtitle,
                          data_source) {
  options(warn = 1)
  # Title
  title <- cowplot::ggdraw() +
    cowplot::draw_label(
      paste0(toupper(title)),
      fontface = "bold",
      x = 0,
      hjust = 0,
      fontfamily = "Roboto",
      size = 18,
      color = "#274374"
    ) +
    cowplot::draw_label(
      paste0(subtitle),
      fontface = "plain",
      x = 0,
      hjust = 0,
      vjust = 2.5,
      fontfamily = "Roboto",
      size = 12,
      color = "#0F9FD6"
    ) +
    ggplot2::theme(plot.margin = ggplot2::margin(0, 0, 0, 20))
  # Ploting title and subtitel
  p1 <-
    cowplot::plot_grid(title,
      plotname,
      ncol = 1,
      rel_heights = c(0.1, 1)
    )
  # Footer and data source
  footer <- create_footer(source_name = paste0(data_source))
  # Final plot
  p1 <-
    ggpubr::ggarrange(
      p1,
      footer,
      ncol = 1,
      nrow = 2,
      heights = c(1, 0.045 / (450 / 450))
    )
  return(p1)
}
