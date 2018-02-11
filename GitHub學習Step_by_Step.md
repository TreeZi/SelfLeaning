# GitHub學習Step_by_Step

GitHub是一個版本控制系統，最簡單的運作流程圖可以參考[這個網站](http://rogerdudler.github.io/git-guide/index.html)。版本控制系統可以用來處理多人共同編輯、校對的時候常常發生的錯誤。詳細的概念網路上有許多資料，以下簡單列舉幾項供作參考：

1. [關於版本控制](https://git-scm.com/book/zh-tw/v2/%E9%96%8B%E5%A7%8B-%E9%97%9C%E6%96%BC%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6)
2. [開始 - Git 基礎要點](https://git-scm.com/book/zh-tw/v2/%E9%96%8B%E5%A7%8B-Git-%E5%9F%BA%E7%A4%8E%E8%A6%81%E9%BB%9E)
3. [[懶人包] 整理 Git 教學資訊](https://dotblogs.com.tw/initials/2016/10/08/gittraining) `大推`

## 安裝

Windows作業系統下，可以透過內建的`命令提示字元`來進行git的操作，不過在此之前，我們還是要先[下載](https://git-scm.com/downloads)，並安裝`git`。安裝教學可參考[這裡](https://git-scm.com/book/zh-tw/v2/%E9%96%8B%E5%A7%8B-Git-%E5%AE%89%E8%A3%9D%E6%95%99%E5%AD%B8)。

完成安裝之後，也請建立一個GitHub的帳號。GitHub網站的連結可以[點此](https://github.com/)

接下來，我們需要告訴Git使用者的資訊，打開命令提示字元，輸入以下的指令：

```ruby
$ git config --global user.name "GitHub的使用者名稱"
$ git config --global user.email "GitHub的信箱"
```

許多Git的基本操作，可以參考這篇[網誌](https://hellolynn.hpd.io/2017/01/18/git%E6%96%B0%E6%89%8B%E5%85%A5%E9%96%80%E6%95%99%E5%AD%B8-part-1/)，這系列的網誌寫得很仔細。

## 設定環境

在進行之後的操作之前，我習慣上還是會先設定Git的工作環境，建議先建立一個自己的Git資料夾，並將`命令提示字元`的工作路徑設定在這個資料夾裡面。
```ruby
$ cd ~/desktop			#這串指令的意思是：將命令提示字元的路徑移動到「桌面」
$ mkdir myproject		#這串指令的意思是：建立一個叫做「myproject」的資料夾
$ cd myproject			#一樣，這是移動的指令。這次把路徑移動到「myproject」
```
`mkdir`的意思，是設定一個資料夾，而`cd`則是移動路徑的指令。這兩個指令在後面的操作會很常用到，可以先記著。

## 取得現有專案

既然是要用來共同編輯，我們就需要先將已經有的**專案**下載下來，下載現有專案的指令如下：

```ruby
$ git clone

#在後面加上專案的網址即可將專案複製並下載下來，例如：

$ git clone https://github.com/TreeZi/SelfLearning.git

#接下來，就可以讓Github連結進駐到資料夾裡面
$ git init
```
當我在執行上面這串指令時，為了確保下載下來的專案內容可以找得到，我會先將路徑設定在`myproject`，之後才進行上述指令。完整的指令會長成這樣：
```ruby
$ cd ~/desktop/myproject
$ git clone https://github.com/TreeZi/SelfLearning.git
$ cd SelfLearning
$ git init
```

## 建立自己的專案

接下來，請先進入Github裡面，設定一個叫做「myproject」的專案。設定方式參考這個網誌的教學：[Git新手入門教學 – part 2](https://hellolynn.hpd.io/2017/01/18/git%e6%96%b0%e6%89%8b%e5%85%a5%e9%96%80%e6%95%99%e5%ad%b8-part-2/)

注意，請記得將專案名稱設定為「myproject」。

## 編輯與上推（push）

有了屬於自己的專案後，我們可以在自己的專案內新增檔案，並將新增的檔案上推到Github裡。在處理文字內容時，多半都使用Windows內建的**記事本**，但記事本的功能並不好用，因此建議還是下載**[Notepad++](https://notepad-plus-plus.org/zh/)**。

如果平常有在使用[Dropbox Paper](https://www.paper.dropbox.com/)、[hackpad](https://hackpad.tw/)的話，對**Markdown**語言應該不陌生。後面的說明我會以**Markdown**語言的檔案為例，說明如何在電腦上的git編輯文件，並上傳到Github。

首先，打開notepad++，輸入以下的內容：
```ruby
hello world
```
並將這個檔案存到myproject裡面，檔案名稱為`hello.md`。注意，請設定成`.md`檔。

儲存完成後，開啟`命令提示字元`，輸入以下指令：
```ruby
$ git add hello.md				#這串指令的意思，是指把myproject資料夾中的「hello.md」文件，上傳到「暫存區」裡面。
$ git commit -m "新增新檔案"		#這串指令的意思，是賦予前面add的檔案一串文字說明：「新增新檔案」。
$ git push						#這串指令的意思，是將前面暫存區的檔案push到Github裡面。
```
在輸入`git push`後，程式會要求你輸入`使用者名稱`與`使用者密碼`，而這邊輸入的內容就是一開始設定Github網站的帳號密碼。

接下來，你就可以點進去Github裡面去看剛剛上傳的`hello.md`檔案了！