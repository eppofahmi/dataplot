## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, warning = FALSE, message = FALSE, 
  fig.align='center', fig.width=7, fig.height=5,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  library(dataplot)
#  
#  # type y on the console
#  dataplot::import_fonts()

## -----------------------------------------------------------------------------
library(dataplot)
library(ggplot2)

p1 = ggplot(data = economics, aes(x = pce, y = pop)) +
  geom_line() +
  kedata_theme()
p1

## -----------------------------------------------------------------------------
library(dataplot)
library(ggplot2)

p1 = ggplot(data = economics, aes(x = pce, y = pop)) +
  geom_line() +
  kedata_theme()

p2 <- kedata_final1(plotname = p1, 
                    title = "Lorem Ipsum is simply dummy text", 
                    subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text")
p2

## -----------------------------------------------------------------------------
library(dataplot)
library(ggplot2)

p1 = ggplot(data = economics, aes(x = pce, y = pop)) +
  geom_line() +
  kedata_theme()

p3 <- kedata_final2(plotname = p1,
              title = "Lorem Ipsum is simply dummy text",
              subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
              data_source = "Sumber Data")

p3

## -----------------------------------------------------------------------------
library(dataplot)
library(ggplot2)

p1 = ggplot(data = economics, aes(x = pce, y = pop)) +
  geom_line(color = "#E0A526") +
  kedata_theme()

p4 <- kedata_custom(plotname = p1,
              footer_col = "#BB4628",
              logo = system.file("extdata/logo/", "contohlogo.png", package = "dataplot"),
              title = "Lorem Ipsum is simply dummy text",
              subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
              data_source = "www.sadasa.id")

p4

## -----------------------------------------------------------------------------
rainfall <- dataplot::dataset

hydrograph_plot(timeSeries = rainfall$`Date Time`,
           streamflow = rainfall$Discharge,
           precip = rainfall$`Rainfall depth (mm)`,
           S1.col = "red",
           left_label = "Discharge", S.units = "mm",
           right_label = "Rainfall", P.units = "mm")

