% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_kedata.R
\name{kedata_theme}
\alias{kedata_theme}
\title{theme kedata}
\usage{
kedata_theme()
}
\value{
ggplot theme
}
\description{
tema dengan aturan khusus yang bisa langsung dimasukkan dengan
   tanda + pada saat membuat plot dengan ggplot. Font yang digunakan di
   sini adalah Roboto Light. Jika anda menggunakan caption, maka hal
   tersebut akan ditempatkan di bagian pojok kanan bawah.
}
\examples{
\dontrun{
library(ggplot2)
# Create usual ggplot object
p1 <- ggplot(data = economics, aes(x = pce, y = pop)) +
  geom_line() +
  kedata_theme()
# Drawing left aligned title
p1 <- kedata_final(
  plotname = p1, title = "Bagian judul ada di sini",
  subtitle = "Bagian Sub Judul dibawah judul, biasanya lebih panjang dari Judul"
)
p1
# Saving plot result
ggsave(filename = "tes.png", dpi = 300, height = 6, width = 9)
}

}
