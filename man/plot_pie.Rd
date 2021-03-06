% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_pie.R
\name{plot_pie}
\alias{plot_pie}
\title{Pie chart in kedata style}
\usage{
plot_pie(data, x, y, color, title, subtitle, data_source)
}
\arguments{
\item{data}{data frame with 2 variabel representing categorical and numeric data}

\item{x}{categorical variabel}

\item{y}{numeric variabel}

\item{color}{character of color hexagon for coloring x variabel}

\item{title}{character}

\item{subtitle}{character}

\item{data_source}{character}
}
\value{
ggplot and ggarrange object
}
\description{
create pie chart form 2 variabel in kedata style. Percentage computed from
      each y varaibel value / total of y value * 100
}
\examples{
\dontrun{
library(dataplot)
library(ggplot2)

df <- data.frame(
  "brand" = c("Samsung", "Huawei", "Apple", "Xiaomi", "OPPO"),
  "share" = c(10, 30, 20, 35, 5)
)

mycolor <- c("#55DDE0", "#33658A", "#2F4858", "#F6AE2D", "#F26419")

plot_pie(
  data = df, x = "brand", y = "share", color = mycolor,
  title = "Lorem Ipsum is simply dummy text",
  subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
  data_source = "Sumber: www.kedata.online"
)
}
}
