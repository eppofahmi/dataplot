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

  rc_font_dir <- system.file("extdata/fonts/", package = "dataplot")
  suppressWarnings(suppressMessages(extrafont::font_import(rc_font_dir, prompt=FALSE)))
  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\nKamu masih perlu untuk menginstall fonts ini dalam system yang digunakan\n\nYou can find them in/Kamu bisa menemukannya di folder [%s]",
      rc_font_dir)
  )}
