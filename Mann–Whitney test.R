
inputFile="Age.txt"                                         #?????ļ?
rt=read.table(inputFile,sep="\t",header=T,check.names=F)
wilcoxTest<-wilcox.test(GAS1 ~ Age, data = rt)        #��?????ϣ???krustal????
pValue=wilcoxTest$p.value
b = boxplot(HMGB3 ~ Age, data = rt,outline = FALSE, plot=F) 
yMin=min(b$stats)
yMax = max(b$stats/5+b$stats)
ySeg = max(b$stats/10+b$stats)
ySeg2 = max(b$stats/12+b$stats)
n = ncol(b$stats)

tiffFile=paste0("HMGB3",".","Age",".tiff")
outTiff=paste(picDir,tiffFile,sep="\\")
tiff(file=outTiff,width = 25,height = 15,
units ="cm",compression="lzw",bg="white",res=600)
par(mar = c(4,7,3,3))
boxplot(HMGB3 ~ Age, data = rt,
     ylab = paste0("HMGB3"," fraction"),
     cex.main=1.6, cex.lab=1.4, cex.axis=1.3,ylim=c(yMin,yMax),outline = FALSE)
segments(1,ySeg, n,ySeg);
segments(1,ySeg, 1,ySeg2)
segments(n,ySeg, n,ySeg2)
text((1+n)/2,ySeg,labels=paste0("p=",pValue),cex=1.5,pos=3)
dev.off()

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######??????ѧ??: http://www.biowolf.cn/
######QQ??2749657388
######????QȺ??219795300
######΢??: 18520221056
