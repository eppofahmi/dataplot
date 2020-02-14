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
  extrafont::font_import(paths = "inst/extdata/fonts/")
  extrafont::loadfonts()
  }
