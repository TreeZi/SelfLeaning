# Step by Step 的程式語言教學

# R
## 安裝篇
1. [下載R](https://cran.r-project.org/bin/windows/base/)
2. [下載Rstudio](https://www.rstudio.com/products/rstudio/download/)
3. 因為Window內建的文字編輯器並不是很好用，為了方便編輯語法，建議下載[notepad++](https://notepad-plus-plus.org/)

## 設定環境
R Studio的操作介面比起R更好用，故之後絕大多數的操作都會在R Studio上進行。
剛進入R最重要的工作是設定`Project`，也就是工作環境，如果沒有設定的話，之後跑出來的資料很容易找不到，資料管理上也很麻煩。
### 建立新的Project
1. 點選畫面上方的`File`>>`New Project`
2. 在`Create Project`的介面上，選擇`New Directory`>>`New Project`
3. 在`Create New Project`的介面中有兩個欄位：
    - Directory name: 新設定的Project名稱
    - Create project as subdirectoy of: Project的路徑
    為方便起見，路徑就設定在`桌面`，Project名稱設定為`hello`
4. 設定好後，點選`Create Project`就會移動到剛剛創立的Project介面了。
    > 註：左下角的按鈕可按可不按

### 熟悉R的介面
1. R可以作為一個簡單的計算機。網路上許多關於R的介紹都有說明，可以自行去翻閱，下面提供幾個連結：
    - [初學R語言的60](https://www.slideshare.net/chenpanliao/slide-44171070)
    > 這邊有基本的操作介紹。
    
    可以練習在`Console`裡面輸入下面的指令，看看會發生什麼事：
    ```{r}
    1+1
    10*2
    49/7
    100-87
    ```
2. 一般由於要操作的指令很多，所以我們多半在操作R Studio中會心建一個`Script`，然後在這邊輸入我們要打的指令。叫出一個新的`Script`可以從`File`>>`New File`>>`R Script`的方式；或者輸入快捷鍵`ctrl`+`shift`+`N`。
3. 新叫出的`Script`會在畫面的左上方，一樣，我們可以在裡面輸入指令：
    ```{r}
    1+1
    10*2
    49/7
    100-87
    ```
    指令全部輸入完之後，可以全選全部的指令，按下`ctrl`+`Enter`，就會自動執行，並將結果呈現在`Console`中。
4. R最常使用的功能是`指派物件`。也是處理資料分析時一定會用到的指令。指派物件的基本概念如下：
    ```{r}
    soc <- 1
    soc
    ```
    注意，在R裡面，大小寫是不一樣的`物件`，因此：
    ```{r}
    SOC   #會跑不出東西
    #Error: object 'SOC' not found
    ```
    在上面我使用了多個`#`，這個符號的意思是：在此符號之後的內容會被視為是`註解`不會被R執行；因此：
    ```{r}
    password = 1234567890
    password
    password_1 = 123456#7890
    password_1
    ```
    上面這兩個`物件`的內容會不一樣。
   > 另外，在R裡面， `<-`與`=`是一樣的意思。
5. R還有大量的套件（`package`）可以安裝，視情況可以安裝自己需要的套件。套件的安裝方式有幾種，以下簡介兩種最常使用到的：
    - 點選畫面右下角的`Packages`>>`Install`，在`Install Packages`的介面上輸入自己需要的套件名稱，再點選`Install`就可以安裝。（常用的例如`markdown`與`magrittr`）
    - 安裝完成之後，每一次開啟R都需要載入套件。套件的載入方式為：在`Packages`的介面下尋找自己要的套件名稱，將左邊的框框打勾。
6. 上述的方法很慢，在跨平台處理資料時，也容易手忙腳亂，因此常用的方法是輸入指令，讓R自行運作：
    ```{r}
    install.packages("markdown")     #安裝套件`markdown`
    library(markdown)                #載入套件`markdown`
    ```
    `markdown`的部分可以自行替換成其他套件。
    有些套件在載入的時候會出現這樣的訊息：
    ```
    > library(markdown) 
    Warning message: package ‘markdown’ was built under R version 3.3.3
    ```
    這代表這個套件已經被載入了，新版的R Studio會內建許多常用的套件，因此就無須另外再下載。
### 存檔
1. 在R Stduio上，會經常存兩種檔案：一種是我們輸入指令的`Script`，另外一種是資料`.RData`。每一次在R Studio上面執行的指令，若有創立新的物件（或者載入新的物件）都會在畫面右上方的`Global Environment`中呈現，`.RData`就是要把這些跑出來的資料存檔。
2. 存`Script`可以直接按下`ctrl`+`S`，輸入檔案名稱，記得在最後加上`.R`。
3. 存`.RData`則可點選`Global Environment`區塊下方的`存檔圖示`，輸入檔案名稱，並在最後加上`.RData`。或者輸入指令：
    ```{r}
    save.image("路徑/檔案名稱.RData")
    ```

## 進階資料
1. [R Basic](https://www.gitbook.com/book/joe11051105/r_basic/details)
2. [輕鬆學習 R 語言](https://www.gitbook.com/book/yaojenkuo/learn-r-the-easy-way/details)
3. [R語言學習筆記](https://www.gitbook.com/book/tianyiwangnovanyc/r/details)
4. [R](https://www.gitbook.com/book/fongcilin/r/details)
5. [機率統計 - 使用 R 軟體](https://www.gitbook.com/book/ccckmit/r_statistics/details)
6. [R語言開發範例](https://www.gitbook.com/book/opentaoyuan/r_language/details)
7. [使用 R 語言進行資料分析](https://www.gitbook.com/book/pecu/-r/details)
8. 
