library(ggplot2) # Create Elegant Data Visualisations Using the Grammar of Graphics
library(reshape2) # Flexibly Reshape Data: A Reboot of the Reshape Package
library(tidyr) # Tidy Messy Data
library(dplyr) # A Grammar of Data Manipulation
library(ggsignif) # Significance Brackets for 'ggplot2'
library(export)

#数据——ggplot自带的ToothGrowth数据
df <- read.table(file = "input.txt",header = T,check.names = F,row.names = 1,sep = "\t")
df$group <- as.factor(df$group)
data <- df
#计算均值及标准差
df1 <- data%>% group_by(group)%>%
  summarise(mean= mean(expression), sd= sd(expression))

ggplot()+ 
  geom_bar(df1,mapping=aes(x=group,y=mean), fill = "white",
           size = 0.5,colour = c("midnightblue","firebrick","midnightblue","firebrick","firebrick"),position="dodge",
           stat="identity",width = 0.6)+
  geom_errorbar(df1,mapping=aes(x = group,ymin = mean-sd, ymax = mean+sd),
                width = 0.3,color = c("midnightblue","firebrick","midnightblue","firebrick","firebrick"), size=0.5)+
  geom_jitter(df, mapping=aes(x=group,y=expression,fill = group,color = group,shape = group),
              size = 8,width = 0.2,alpha=0.9)+ 
  geom_point(df1,mapping=aes(x=group,y=mean),color="black",size=2,shape=8)+
  scale_color_manual(values = c("midnightblue","firebrick","midnightblue","firebrick","firebrick"))+ 
  scale_y_continuous(limits = c(-6,0),expand = c(0, 0))+
  theme_classic(base_line_size = 1)+
  theme(panel.grid=element_blank(),
        axis.text=element_text(colour='black',size=13),
        axis.title.y = element_text(colour='black',size=15),
        axis.line = element_line(linewidth = 0.5),
        legend.text = element_text(colour='black',size=13),
        legend.title = element_blank(),
        legend.position = "none")+
  labs(x=NULL,y="Value")

graph2ppt(file="barplot.pptx", width=6, height=5)
