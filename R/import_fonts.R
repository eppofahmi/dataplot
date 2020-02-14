#' import fonts
#'
#' @description Import fonts from this package
#'
#' @return loading req fonts
#'
#' @examples
#' import_fonts()
#'
#' @export
import_fonts <- function() {
  extrafont::font_import(paths = system.file("extdata/logo/", package = "dataplot"))
  extrafont::loadfonts()
  }
