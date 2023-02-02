################################
# R code of statistical figure.
################################

# Pathway enrichment circle diagram:
install.packages('GOplot')
library(GOplot)
dataFrame2 <- read.csv("quiz-GOplot.csv", header = TRUE, sep =",")
dataFrame<- read.csv("quiz_gene.csv", header = TRUE, sep =",")
circ<- circle_dat(dataFrame2, dataFrame)
pdf('enrichment-circle-quiz.pdf', width = 16, height = 7) GOCircle(circ,nsub = 10,
table.legend=T,label.size=4)
dev.off()


# Bubble chart:
library(ggpolot2)
dataFrame<- read.csv("pathway.csv", header = TRUE, sep =",")
pp = ggplot(dataFrame,aes(NES,pathway))
pp + geom_point()
pp + geom_point(aes(size=SIZE))
pbubble = pp + geom_point(aes(size=SIZE,color=-1*log10(FDR)))
pbubble + scale_colour_gradient(low="green",high="red")
pr = pbubble + scale_colour_gradient(low="green",high="red") + labs(color=expression(-log[10](Qvalue)),size="Gene number",x="Rich factor",y=" pathway",title="Top20 of pathway enrichment")
pr + theme_bw()
ggsave("BB_pathway.pdf")

