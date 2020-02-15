#' Finishing plot dengan gaya kedata1
#'
#' @description Pertama, membuat judul dan subjudul plot rata dengan tulisan di garis X.
#'        kedua, membuat logo kedata ada di pojok kanan atas plot yang dibuat.
#'
#' @param plotname Sebuah objek yang dibuat dengan menggunakan fungsi ggplot
#' @param title Sebuah kalimat berupa karakter untuk judul
#' @param subtitle Sebuah kaliamt berupa karakter untuk subjudul
#'
#' @return Objek ggplot
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' # Create usual ggplot object
#' p1 = ggplot(data = economics, aes(x = pce, y = pop)) +
#'   geom_line() +
#'   kedata_theme()
#' # Drawing left aligned title
#' p1 <- kedata_final1(plotname = p1, title = "Bagian judul ada di sini",
#'                    subtitle = "Bagian Sub Judul dibawah judul, biasanya lebih panjang dari Judul")
#' p1
#' # Saving plot result
#' ggsave(filename = "tes.png", dpi = 300, height = 6, width = 9)
#' }
#'
#' @export
kedata_final1 <- function(plotname, title, subtitle){
  # Footer
  logo_file <- magick::image_read(path = system.file("extdata/logo/", "logokedata.png", package = "dataplot"))
  p1 <- cowplot::ggdraw() +
    cowplot::draw_image(logo_file,
                        x = 1,
                        y = 1,
                        hjust = 1.16,
                        vjust = 0.25,
                        width = 0.13,
                        height = 0.2,
                        clip = "inherit") +
    cowplot::draw_plot(plotname)
  # Title
  title <- cowplot::ggdraw() +
    cowplot::draw_label(paste0(toupper(title)),
                        fontface = 'bold',
                        x = 0,
                        hjust = 0,
                        fontfamily = "Roboto Black",
                        size = 18,
                        color = "#274374") +
    cowplot::draw_label(paste0(subtitle),
                        fontface = 'plain',
                        x = 0,
                        hjust = 0,
                        vjust = 2.5,
                        fontfamily = "Roboto Light",
                        size = 12,
                        color = "#0F9FD6") +
    ggplot2::theme(plot.margin = ggplot2::margin(0, 0, 0, 20))
  # Final
  p1 <- cowplot::plot_grid(title, p1, ncol = 1, rel_heights = c(0.1, 1))
  return(p1)
  }
