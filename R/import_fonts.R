#' import fonts
#'
#' @description Import fonts Roboto untuk kebutuhan pembuatan judul dan
#'      subjudul dengan menggunakan fungsi kedata_final
#'
#' @return loading req fonts
#'
#' @examples
#' import_fonts()
#'
#' @export
import_fonts <- function() {
  extrafont::font_import(paths = system.file("extdata/fonts/", package = "dataplot"))
  extrafont::loadfonts()
  }
