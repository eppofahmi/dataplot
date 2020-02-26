create_footer1 <- function(source_name, logo_path, footer_col) {
  # Make the footer
  footer <- grid::grobTree(
    grid::rectGrob(gp = grid::gpar(fill = footer_col, lwd = 0)),
    # grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
    grid::textGrob(
      source_name,
      x = 0.025,
      hjust = 0,
      gp = grid::gpar(
        fontsize = 8,
        family = "Roboto",
        col = "white"
      )
    ),
    grid::rasterGrob(png::readPNG(logo_path), x = 0.944)
  )
  return(footer)
}
#' Kedata style custome plot finishing
#'
#' @description Menempatkan footer dibagian bawah yang terdiri dari logo dan data source
#'
#' @param plotname ggplot object
#' @param title character for plot title
#' @param subtitle character for plot subtitle
#' @param data_source character for plot caption
#' @param footer_col default to red
#' @param logo path to image logo
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
#' kedata_custom(
#'   plotname = p1,
#'   footer_col = "grey",
#'   logo = "inst/extdata/logo/logokedata.png",
#'   title = "Lorem Ipsum is simply dummy text",
#'   subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
#'   data_source = "www.kedata.online"
#' )
#' }
#'
#' @export
kedata_custom <- function(plotname,
                          title,
                          subtitle,
                          data_source,
                          footer_col = "red",
                          logo) {
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
  footer <-
    create_footer1(
      source_name = paste0(data_source),
      logo_path = paste0(logo),
      footer_col
    )
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
