# 在Ubuntu上運作網路爬蟲：rvest

######tags: `R` `Ubuntu` `rvset` `debug`
######date: `Sun Feb 11 13:19:40 2018`
######author: `TreeZi`

# 在Ubuntu上使用R
ubuntu上透過終端機安裝R，無法安裝Rstudio而只能使用線上服務的`RServer`。而在Ubuntu上，網路爬蟲最重要的Package: `rvest`是無法正常安裝的：

```{r}
install.packages('vrest')		#錯誤
```
要解決這個狀況要用別的方式安裝這個Package，方法如下：

```{r}
sudo add-apt-repository 'deb 
https://mirrors.nic.cz/R/bin/linux/ubuntu trusty/'
sudo apt-get update
sudo apt-get install r-base-dev
sudo apt-get install libxml2-dev
sudo apt-get install libssl-dev
```

執行過上述的指令後，再回到RServer或者R的操作界面上，就可以執行`rvest`了！恭喜！距離脫離Microsoft，又大大地跨出一步了！^___________^

# 資料來源與出處
[R Package “rvest” can not insta (credit: stack overflow)](https://stackoverflow.com/questions/46986292/r-package-rvest-can-not-install-and-the-same-as-in-ubuntu-terminal)
[UBUNTU PACKAGES FOR R](https://mirrors.nic.cz/R/bin/linux/ubuntu/)