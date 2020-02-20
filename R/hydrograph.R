#' Hydrograph plot
#'
#' @description Creates a hydrograph with one or two streamflow data sets, and can include a precipitation hyetograph adapted form `EcoHydRology`
#'
#' @importFrom graphics axis
#' @importFrom graphics barplot
#' @importFrom graphics grid
#' @importFrom graphics lines
#' @importFrom graphics mtext
#' @importFrom graphics par
#' @importFrom graphics plot
#' @importFrom stats na.omit
#'
#' @param input This is a data frame with at least two columns of data First column: Must be a time/date series Second column: If including precip, precip. Otherwise, streamflow - AND do not include any other columns Third column: (Only include if precip is in the second column) First streamflow dataset Forth column: (optional) Second streamflow dataset
#' @param streamflow vector of streamflow values - not necessary if using "input"
#' @param timeSeries vector of time or date values - not necessary if using "input"
#' @param streamflow2 optional vector of streamflow values - not necessary if using "input"
#' @param precip vector of precipitation values - not necessary if using "input"
#' @param begin If you don't want to graph the whole data set, include the index where you would like to start
#' @param endindex 	If you don't want to graph the whole dataset, include the index where you would like to end
#' @param P.units Precipitation units (character)
#' @param S.units Streamflow units (character). Users who have volumetric flow will have the superscript correctly formatted if they enter "m3s" or "ft3s"
#' @param S1.col color of the line representing streamflow
#' @param S2.col color of the line representing second streamflow data
#' @param left_label Character for left label
#' @param right_label Character for left label
#' @param streamflow3 optional vector of additional streamflow values
#' @param streamflow4 optional vector of additional streamflow values
#' @param precip2 optional vector of a second precip gage data if you are interested in comparing precip inputs
#'
#' @return ploted data object
#'
#' @warning The date series should be continuous and evenly spaced. If not, the dates will not line up accurately on the x-axis.
#'
#' @note This function can now take NA values. If you chose to use the input argument but are not including precipitation, input must only have two columns - you will need to add the second streamflow dataset using the "streamflow2" argument.
#'
#' @examples
#' \dontrun{
#' rainfall <- dataplot::dataset
#'
#' hydrograph_plot(timeSeries = rainfall$`Date Time`,
#'            streamflow = rainfall$Discharge,
#'            precip = rainfall$`Rainfall depth (mm)`,
#'            S1.col = "red",
#'            left_label = "Discharge", S.units = "mm",
#'            right_label = "Rainfall", P.units = "mm")
#' }
#' @export
hydrograph_plot <-
  function (input = matrix(ncol = 2, nrow = 2), streamflow = input[,
                                                                   2], timeSeries = input[, 1], streamflow2 = NULL, precip = NULL,
            begin = 1, endindex = length(streamflow), P.units = "", S.units = "",
            S1.col = "black", S2.col = "red", left_label = "Streamflow", right_label,
            streamflow3=NULL,streamflow4=NULL, precip2=NULL) {
    if (is.null(streamflow2) & (ncol(input) > 3))
      streamflow2 <- input[, 4]
    if (is.null(precip) & (ncol(input) > 2)) {
      precip <- input[, 2]
      streamflow <- input[, 3]
    }
    if (!is.null(precip))  {
      par(mar = c(3, 5, 1, 4))
      barplot(precip[begin:endindex], yaxt = "n", space = NULL,
              ylim = rev(c(0, 4 * max(na.omit(precip[begin:endindex])))),
              xaxt = "n")
      axis(side = 3, pos = 0, tck = 0,xaxt = "n")
      axis(side = 4, at = seq(0, floor(max(na.omit(precip[begin:endindex])) +
                                         1), length = (1 + ifelse(floor(max(na.omit(precip[begin:endindex])) +
                                                                          1) < 10, floor(max(na.omit(precip[begin:endindex])) + 1),
                                                                  4))), labels = as.integer(seq(0, floor(max(na.omit(precip[begin:endindex])) +
                                                                                                           1), length = (1 + ifelse(floor(max(na.omit(precip[begin:endindex])) +
                                                                                                                                            1) < 10, floor(max(na.omit(precip[begin:endindex])) + 1),
                                                                                                                                    4)))))
      if (P.units=="") {
        mtext(paste(right_label, P.units), 4, line = 2, cex = 0.9, adj = 1)
      } else  mtext(paste(right_label, " (", P.units, ")", sep=""), 4, line = 2, cex = 0.9, adj = 1)
      par(new = T)
    }
    if (!is.null(precip2)){
      barplot(precip2[begin:endindex], yaxt = "n", space = NULL, col="pink",
              ylim = rev(c(0, 4 * max(na.omit(precip[begin:endindex])))),
              xaxt = "n")
      par(new = T)
    }

    plot(streamflow[begin:endindex], col = S1.col, type = "l",
         lwd = 1, ylab = left_label, xaxt = "n", xlab = "date",
         ylim = c(0, 1.2 * max(na.omit(streamflow[begin:endindex]), na.omit(streamflow2[begin:endindex]))),
         panel.first = grid(ny = NULL, nx = NULL, col = "lightgray", lty = 2,
                            lwd = par("lwd"), equilogs = FALSE),
         axes = FALSE)
    #mtext (expression(paste("                              ", " (" , m^3/s, ")", sep="")), 2,3)
    if (S.units=="m3/s" | S.units=="m3s"){
      mtext (expression(paste(" (" , m^3/s, ")", sep="")), 2,1.5)
    } else if (S.units=="ft3/s" | S.units=="ft3s") {
      mtext (expression(paste(" (" , ft^3/s, ")", sep="")), 2,1.5)
    } else if (S.units!="") mtext (paste(" (" , S.units, ")", sep=""), 2,1.5)
    lines(streamflow2[begin:endindex], col = S2.col, lwd = 1,
          lty = 2, xaxt = "n")
    if (!is.null(streamflow3)){
      lines(streamflow3[begin:endindex], col = "blue", lwd = 1,   ##potential for more streamflows
            lty = 3, xaxt = "n")
    }
    if (!is.null(streamflow4)){
      lines(streamflow4[begin:endindex], col = "green", lwd = 1,   ##potential for more streamflows
            lty = 4, xaxt = "n")
    }
    axis(side = 1, at = seq(1, (endindex - begin + 1), length = 14),
         pos = 0, labels = format(timeSeries[seq(begin, endindex,
                                                 length = 14)], "%d-%b-%y"))

    axis(side = 2, pos = 0)
  }

# Exsample
# dataset <- read_rds("data-raw/rainfall.rds")
#
# hydrograph_plot(timeSeries = dataset$`Date Time`,
#            streamflow = dataset$Discharge,
#            precip = dataset$`Rainfall depth (mm)`,
#            S1.col = "red",
#            left_label = "Discharge", S.units = "mm",
#            right_label = "Rainfall", P.units = "mm")

