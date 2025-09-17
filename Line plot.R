library(ggplot2)
library(export)

# 读取数据
rt <- read.table(file = "input.txt", header = T, row.names = 1, check.names = F, sep = "\t")

# 设置误差棒函数
topbar <- function(x) { mean(x) + sd(x) / sqrt(length(x)) }
bottombar <- function(x) { mean(x) - sd(x) / sqrt(length(x)) }

custom_colors <- c(
  "DiFi" = "black",
  "SW48" = "#1F77B4",  
  "CaCO2" = "red",      
  "SNUC1" = "#F37B1D",  
  "HT29" = "#2CA02C"   
)

custom_shapes <- c(
  "DiFi" = 16,
  "SW48" = 16,
  "CaCO2" = 16,
  "SNUC1" = 16,
  "HT29" = 16
)

ggplot(rt, aes(concentration, value, color = group)) +
  stat_summary(geom = 'line', fun = 'mean', size = 0.4) +
  stat_summary(geom = 'errorbar', fun.min = bottombar, fun.max = topbar,
               width = 5, cex = 0.5, aes(color = group)) +
  stat_summary(geom = 'point', fun = 'mean', aes(fill = group, pch = group), size = 4.5) +
  scale_color_manual(values = custom_colors) +
  scale_fill_manual(values = custom_colors) +
  scale_shape_manual(values = custom_shapes) +
  labs(title = "CCK-8",
       x = "Concentration (μg/mL)",
       y = "Cell viability", cex = 0.5) +
  theme_bw() +
  theme_classic() +
  scale_x_continuous(breaks = seq(0, 160, 20), expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0.0, 1.5, 0.25))

# 导出 PPT
graph2ppt(file = "CCK8.pptx", width = 6, height = 5)
