# dataplot <img src="man/figures/sticker.png" align="right" width=150/>


[![Travis-CI Build Status](https://travis-ci.org/eppofahmi/dataplot.svg?branch=master)](https://travis-ci.org/eppofahmi/dataplot)

# dataplot

Tema dan jenis plot umum yang digunakan oleh Kedata Indonesia

# Install 
Install from GitHub: `devtools::install_github("eppofahmi/dataplot")`


## Waffle Chart

Plot Waffle merupakan cara lain untuk menunjukkan komposisi kategorikal dari total populasi. Plot ini bisa menjadi alternatif dari pie jika plot tersebut dianggap terlalu umum. Di dalam `ggplot2` plot waffle bisa dibuat dengan menggunakan fungsi `geom_tile()` . Berikut adalah contohnya. 

```{r}
library(dataplot)
library(ggplot2)

df <- structure(list(region = c("Africa", "Asia", "Latin America",
                                "Other", "US-born"),
                     ncases = c(36L, 34L, 56L, 2L, 44L)),
                .Names = c("region","ncases"),
                row.names = c(NA, -5L), class = "data.frame")

waffle_plot(data = df, x = "region", y = "ncases", ndeep = 10,
            title = "Lorem Ipsum is simply dummy text",
            subtitle = "Contrary to popular belief, Lorem Ipsum is not simply random text",
            data_source = "www.kedata.online")
```

![](https://raw.githubusercontent.com/eppofahmi/dataplot/master/man/figures/waffle.png)

Apa yang terjadi di dalam fungsi? sama dengan yang terjadi dan dipahami dalam membuat pie chart. Di mana isi dari plot merupakan persentase dari jumlah masing-masing variabel kategorik. Hanya dalam waffle chart di representasikan dalam bentuk potingan-potongan balok yang ditempatkan dalam x dan y yang sudah disesuaikan dengan kondisi masing-masing kategori.
