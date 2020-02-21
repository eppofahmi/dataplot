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

plot_pie(data = df, x = "brand", y = "share", color = mycolor,
         title = "Lorem Ipsum is simply dummy text",
         subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
         data_source = "Sumber: www.kedata.online")


## -----------------------------------------------------------------------------
library(dataplot)
library(ggplot2)

df <- structure(list(region = c("Africa", "Asia", "Latin America",
                                "Other", "US-born"),
                     ncases = c(36L, 34L, 56L, 2L, 44L)),
                .Names = c("region","ncases"),
                row.names = c(NA, -5L), class = "data.frame")

plot_waffle(data = df, x = "region", y = "ncases", ndeep = 10,
            title = "Lorem Ipsum is simply dummy text",
            subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
            data_source = "www.kedata.online")

