library(export)
rt=read.table("input.txt",sep="\t",header=T,row.names=1,check.names=F)

library(ggplot2)
#pdf("NCOA3 vs SP1.pdf",height=13,width=13)              #????ͼƬ???ļ?????
p <- ggplot(rt,aes(x=rt$circEGFR,y=rt$`miR-942`)) + geom_point(size=3) + stat_smooth(method='lm',formula = y~x,colour='red')
model.lm<-lm(formula = rt$circEGFR ~ rt$`miR-942`, data = rt)
summary(model.lm)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)),
          b = as.numeric(format(coef(model.lm)[2], digits = 4)),
          r2 = format(summary(model.lm)$r.squared, digits = 4),
          p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
p + geom_text(aes(x = -2, y = -2, label = as.character(as.expression(eq))), parse = TRUE)
graph2ppt(file="circEGFR_vs_miR-942-3p_corrplot.pptx", width=10, height=10)

