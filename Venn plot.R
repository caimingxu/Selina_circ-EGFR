# BiocManager::install("RBGL","reshape")
library(Vennerable)
library(export)
rt <- read.table("input.txt",header = T,sep = "\t",check.names = F)
str(rt)
Vstem3 <- Venn(rt)
Venn<-plot(Vstem3, doWeights = F)
graph2ppt(file="Venn plot.pptx", width=6, height=4)



data(StemCell)
Vstem <- Venn(rt)

Vstem <- Venn(StemCell)
Vstem

data<-Venn(list("186"=paper,"100"=my, "7"= vgene))    #使用Venn函数处理数据，完成了集合的命名并存入
