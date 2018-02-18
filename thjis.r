# thjis
#Gamefaqs_VdGame_Feb09----------------------------------
library(xml2)
library(rvest)
library(magrittr)
#j <- 1
#list <- NULL
#改網址-----------------------------------------
#vd.list.crdt.re <- lapply(1:length(vd.list.crdt),function(i){sub("https://www.gamefaqs.com","https://gamefaqs.gamespot.com",vd.list.crdt[i])})
#vd.list.crdt.re <- unlist(vd.list.crdt.re)
repeat{
  if(j > length("所有網址")) break
  x <- read_html("所有網址"[j])
  crdt <- html_nodes(x,".credits a") %>% html_text()		#讀取credit資料
  vd <- html_nodes(x,".page-title a") %>% html_text()		#讀取遊戲名稱
  if (length(crdt)==0)  list.tmp <- cbind(vd,"NA")			#如果沒有credit，把遊戲名稱和NA值連在一起
  if (length(crdt) >0)  list.tmp <- cbind(vd,crdt)			#如果有credit，把遊戲名稱跟credit連在一起
  list[j] <- list(list.tmp)									#這是為了避免在跑的時候，遭遇到跳號的問題，將上面跑出來的內容指派到list的一個位置，之後unlist時就比較不會出錯。
  j <- j + 1
  Sys.sleep(runif(2,2,4))
  if (j %% 200 == 0) save.image("C:/tre318zzzsecond/Tre318ZZZSecond/VdGame_Feb09_re.RData")		#每兩百筆就自動存檔一次避免出現意外
}
     save.image("C:/tre318zzzsecond/Tre318ZZZSecond/VdGame_Feb09_re.RData")
process <- j
#轉成table---------------------------------------------------
table <- NULL
for(i in 1:length(list)){
table.tmp <- matrix(unlist(list[i]), nrow = length(unlist(list[i]))/2 , ncol = 2, byrow = F)
table <- rbind(table,table.tmp)
}
table <- as.data.frame (table)



