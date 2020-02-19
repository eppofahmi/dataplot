## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, warning = FALSE, message = FALSE, fig.align='center', fig.width=7, fig.height=5,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(dataplot)
library(ggplot2)

df = data.frame("brand" = c("Samsung","Huawei","Apple","Xiaomi","OPPO"),
                "share" = c(10,30,20,35,5))

mycolor <- c("#55DDE0", "#33658A", "#2F4858", "#F6AE2D", "#F26419")

pie_plot(data = df, x = "brand", y = "share", color = mycolor,
         title = "Lorem Ipsum is simply dummy text",
         subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
         data_source = "Sumber: www.kedata.online")


