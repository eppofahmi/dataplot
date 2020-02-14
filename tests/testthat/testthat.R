library(ggplot2)
library(dataplot)

# Create usual ggplot object
p1 = ggplot(data = economics, aes(x = pce, y = pop)) +
  geom_line() +
  kedata_theme()
# Drawing left aligned title
p1 <- kedata_final(plotname = p1, title = "Bagian judul ada di sini",
                   subtitle = "Bagian Sub Judul dibawah judul, biasanya lebih panjang dari Judul")
p1
