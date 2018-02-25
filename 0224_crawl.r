#chaungsong 
cha_list = c(rm = "http://chuansong.me/account/rmrbwx",                #人民日報
             xinhua = "http://chuansong.me/account/xinhuashefabu1",    #新華社
             cctv = "http://chuansong.me/account/cctvnewscenter",      #央視新聞
             hq = "http://chuansong.me/account/hqsbwx",                #環球時報
             capital = "http://chuansong.me/account/capitalnews",      #長安街知事
             Bei = "http://chuansong.me/account/Beijing_Daily",        #北京日報
             xia = "http://chuansong.me/account/xiake_island",         #俠客島
             tal = "http://chuansong.me/account/Talkpark",             #團結湖
             bej = "http://chuansong.me/account/beijingqingnianbao",   #北京青年報
             gq = "http://chuansong.me/account/gqtzy2014",             #共青團中央
             wepo = "http://chuansong.me/account/wepolitics",          #政知圈
             jfj = "http://chuansong.me/account/jfjbjzb")              #解放軍報記者部
#setting---------------------------------------
library(magrittr)
library(tmcn)
library(xml2)
library(rvest)
#----------------------------------------------
save.image("~/R/crawl_update/crawl_update.1.RData")
cha_mat = NULL
MAIN = NULL
i = 1
repeat {
    if (i > length(cha_list)) break
    j = 1
        repeat{
              main = paste(cha_list[[i]],"?start=",12*(j-1),sep = "")	#設定網站連結
              main.2 = read_html(main)
              MAIN[j] = list(html_nodes(main.2,".question_link") %>% html_attr("href"))		#網頁爬蟲函式
              ddln = html_nodes(main.2,".timestamp") %>% html_text							#時間軸測試
              j = j + 1
              if (1 %in% (ddln %in% "2017-12-31")) break
              if (1 %in% (ddln %in% "2017-12-30")) break
              Sys.sleep(runif(2,2,2))
              }
    url = unlist(MAIN)
    url = lapply(1:length(url),function(i){paste("http://chuansong.me",url[i],sep = "")})
    url = unlist(url)
    FUN.art <- function(i){return(tryCatch(read_html(url[i], options = "HUGE"),error = function(e) NULL))}
    title.tmp <- NULL
    date.tmp <- NULL
    ctnt.tmp <- NULL      
    k = 1
    repeat{
        if (k > length(url)) break
        tmp = FUN.art(k) 
        FUN.title = function(i){return(tryCatch(html_nodes(tmp, "#activity-name") %>% html_text(),error = function(e) NULL))}
        FUN.date = function(i){return(tryCatch(html_nodes(tmp, "#post-date") %>% html_text(),error = function(e) NULL))}
        FUN.ctnt = function(i){return(tryCatch(html_nodes(tmp, "#img-content") %>% html_text(),error = function(e) NULL))}
        tmp.title = FUN.title(k)
        if (length(tmp.title) == 0) title.tmp[k] = NA
        if (length(tmp.title)  > 0) title.tmp[k] = tmp.title
        tmp.date = FUN.date(k)
        if (length(tmp.date) == 0) date.tmp[k] = NA
        if (length(tmp.date)  > 0) date.tmp[k] = tmp.date
        tmp.ctnt = FUN.ctnt(k)
        if (length(tmp.ctnt) == 0) ctnt.tmp[k] = NA
        if (length(tmp.ctnt)  > 0) ctnt.tmp[k] = tmp.ctnt
        k <- k + 1
        Sys.sleep(runif(2,5,5))
        if (i %% 200 == 0 ) save.image("~/R/crawl_update/crawl_update.2.RData")
        }
    cha_mat[(i*5)-4] = list(date.tmp)
    cha_mat[(i*5)-3] = list(url)
    cha_mat[(i*5)-2] = list(title.tmp)
    cha_mat[(i*5)-1] = list(ctnt.tmp)
    i = i + 1
    save.image("~/R/crawl_update/crawl_update.3.RData")
}
save.image("~/R/crawl_update/crawl_update.4.RData")
