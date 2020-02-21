#' theme kedata
#'
#' @description tema dengan aturan khusus yang bisa langsung dimasukkan dengan
#'    tanda + pada saat membuat plot dengan ggplot. Font yang digunakan di
#'    sini adalah Roboto Light. Jika anda menggunakan caption, maka hal
#'    tersebut akan ditempatkan di bagian pojok kanan bawah.
#'
#' @return ggplot theme
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' # Create usual ggplot object
#' p1 = ggplot(data = economics, aes(x = pce, y = pop)) +
#'   geom_line() +
#'   kedata_theme()
#' # Drawing left aligned title
#' p1 <- kedata_final(plotname = p1, title = "Bagian judul ada di sini",
#'                    subtitle = "Bagian Sub Judul dibawah judul, biasanya lebih panjang dari Judul")
#' p1
#' # Saving plot result
#' ggsave(filename = "tes.png", dpi = 300, height = 6, width = 9)
#' }
#'
#' @export
kedata_theme <- function() {
  options(scipen=999) # turn off scientific number
  ggplot2::theme_set(cowplot::theme_minimal_grid())  # pre-set the bw theme.

  ggplot2::theme(legend.position = "top",
                 legend.title = ggplot2::element_blank(),
                 legend.text = ggplot2::element_text(size = 8, color = "#323441"),
                 # legend.text.align = 0.5,
                 legend.justification = c("right", "top"),
                 legend.box.just = "left",
                 legend.margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 0, unit = "line"),
                 text = ggplot2::element_text(size = 10,  family = "Roboto"),
                 plot.caption = ggplot2::element_text(face = "italic", color = "#274374",
                                                      family = "Roboto"),
                 axis.text = ggplot2::element_text(family = "Roboto", size=10),
                 plot.margin = ggplot2::unit(c(1.7, 1, 1, 1), "line")
                 )
  }
