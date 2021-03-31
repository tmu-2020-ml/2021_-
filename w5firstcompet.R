getwd()
setwd("tmu-1092-nlp-1/train_dataset.txt/")
tmp = read.table("train_dataset.txt", sep = "\t", quote = "")


w5df = read.csv("train_dataset.csv")
nrow(w5df)
w5df$seg = ""
library(jiebaRD)
library(jiebaR)
setwd("..")
cutter <- worker(stop_word ="cn_stopword.txt")
for (i in c(1:nrow(tmp))) {
  aa =cutter[tmp$V2[i]]
  tmp$seg[i] = paste(aa,collapse=" ")
}
library(beepr)
beep(sound = 8, expr = NULL)

tmp$seg[2][1,]


dfout = w5df
dfout$POST = NULL
write.csv(dfout,"train_segged_dataset.csv", row.names = FALSE)

