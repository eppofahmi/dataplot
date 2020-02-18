## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, warning = FALSE, message = FALSE, fig.align='center', fig.width=7, fig.height=5,
  comment = "#>"
)

## ----sctr2--------------------------------------------------------------------
library(dataplot)
library(ggplot2)

sctr2(data = economics, x = "psavert", y = "uempmed",
      title = "Lorem Ipsum is simply dummy text",
      subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
      data_source = "www.kedata.online")

## ----sctr3--------------------------------------------------------------------
library(dataplot)
library(ggplot2)
sctr3(data = midwest, x = "poptotal", y = "popwhite", color = "state",
      title = "Lorem Ipsum is simply dummy text",
      subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
      data_source = "www.kedata.online")

## ----sctr4--------------------------------------------------------------------
library(dataplot)
library(ggplot2)
sctr4(data = midwest, x = "poptotal", y = "popwhite", color = "state", size = "popdensity",
      title = "Lorem Ipsum is simply dummy text",
      subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
      data_source = "www.kedata.online")

