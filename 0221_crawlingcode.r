library(magrittr)
library(tmcn)
library(xml2)
library(rvest)
#Sys.setlocale("LC_ALL","Chinese")
#-----------------------------------
MAIN = NULL
i = 1
repeat{
  if (i > 407) break
  main = paste("http://chuansong.me/account/jfjbjzb?start=",12*(i-1),sep = "")	#設定網站連結
  main.2 = read_html(main)
  MAIN[i] = list(html_nodes(main.2,".question_link") %>% html_attr("href"))			#網頁爬蟲函式
  ddln = html_nodes(main.2,".timestamp") %>% html_text													#時間軸測試
  #	if (1 %in% (ddln %in% "2017-12-31")) break
  i = i + 1
  Sys.sleep(runif(2,2,2))
  if (i %% 200 == 0 ) save.image("~/R/helloworld/jfjb_Feb20.RData")
}

#------------------------------------------------
url = unlist(MAIN)
url = lapply(1:length(url),function(i){paste("http://chuansong.me",url[i],sep = "")})
url <- unlist(url)
#網頁內容爬取-------------------------------------
FUN.art <- function(i){return(tryCatch(read_html(url[i], options = "HUGE"),error = function(e) NULL))}
FUN.title <- function(i){return(tryCatch(html_nodes(x, "#activity-name") %>% html_text(),error = function(e) NULL))}
FUN.date <- function(i){return(tryCatch(html_nodes(x, "#post-date") %>% html_text(),error = function(e) NULL))}
FUN.ctnt <- function(i){return(tryCatch(html_nodes(x, "#img-content") %>% html_text(),error = function(e) NULL))}
#-------------------------------------------------

title.tmp <- NULL
date.tmp <- NULL
ctnt.tmp <- NULL
i <- 1
repeat{
  if (i > length(url)) break
  x <- FUN.art(i)
  ttl = FUN.title(i)
  if (length(ttl) == 0 ) title.tmp[i] <- NA  #如果沒有內容，回傳NA值
  if (length(ttl)  > 0 ) title.tmp[i] <- ttl #如果有內容，回傳內容
  dt = FUN.date(i)
  if (length(dt) == 0 ) date.tmp[i] <- NA    #如果沒有內容，回傳NA值
  if (length(dt)  > 0 ) date.tmp[i] <- dt    #如果有內容，回傳內容
  ctt = FUN.ctnt(i)
  if (length(ctt) == 0 ) ctnt.tmp[i] <- NA   #如果沒有內容，回傳NA值
  if (length(ctt)  > 0 ) ctnt.tmp[i] <- ctt  #如果有內容，回傳內容
  i <- i + 1
  Sys.sleep(runif(2,5,5))  
  if (i %% 200 == 0 ) save.image("~/R/helloworld/jfjb_Feb21.RData")
}

save.image("~/R/helloworld/jfjb_Feb21.RData")

jhjb_Feb21 = data.frame(date = unlist(date.tmp),
                        url = url[1:(i-1)],
                        title = unlist(title.tmp),
                        ctnt = unlist(ctnt.tmp))
View(jhjb_Feb21)
