########
set.seed(123)
library(ggstatsplot)
library(export)

rt <- read.table("1.txt",header = T,sep = "\t",row.names = 1,check.names = F)
ggbetweenstats(
  data  = rt,
  x     = group,
  y     =  riskScore,
  title = "Expression of circ-EGFR"
)
graph2ppt(file="newviolin.pptx", width=10, height=10)
