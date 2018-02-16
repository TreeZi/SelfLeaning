##### title: `Python 3 Tutorial 第三堂`
##### date: `2/16`
##### lessson: [`Python 3 Tutorial 第三堂（1）`](https://openhome.cc/Gossip/CodeData/PythonTutorial/FunctionModuleClassPackagePy3.html)
-----
	> Python support procedural programming, to some extent, and OO. These two aren't so different, and Python's procedural style is still strongly influenced by objects (since the fundamental data tyoes are all objects). Python supports a tiny bit of functional programming -- but it doesn't resemble any real finctionl language, and it never will.
關鍵在於架構程式時應思考的幾個重點，像是：
	- 抽象層的封裝與隔離			  `不懂`
	- 物件的狀態
	- 名稱空間（Namespace）		`不懂`
	- 資源的實體組織方式，像是原始碼檔案、套件等等
# 函式
```ruby
...
max1 = a if a > b else b
...
max2 = x if x > y else y
...
```
```ruby
def max(a,b ):
	return a if a > b else b
```
>	函式是一種抽象，對流程的抽象，在定義了max函式之後，客戶端對求最大值的流程，被抽象為`max(x, y)`這樣的函式呼叫，實際求值的流程被隱藏起來。
>	在Python中，函式不單只是定義，也是個**值**。
舉例來說，可以如下max指向的函式指定給maximum變數，透過maximum來呼叫：
```ruby
maximum = max
maximum(10, 20) # 傳回 20
```
`lambda`表示式來定義一個函式，如：
```ruby
lambda a, b: a if a < b else b
```
這種函式叫做**λ函式**或者**匿名函式**。
	> 有什麼特別的嗎？
```ruby
min = lambda a, b: a if a < b else b
minimum = min
min(10, 20)  # 回傳10
minimum(10, 20) # 回傳10
```
# 模組
如果有一大堆數學相關的函式與常數定義，像是：
```ruby
def max(a, b):
	return a if a > b else b
def min(a, b):
	return a if a < b else b

def sum(*numbers): # numbers 接受可變長度引數
	total = 0
	for number in numbers:
		total += number
	return total 
	
pi = 3.141592653589793
e = 2.718281828459045
```
要如何組織它們呢，讓它們有別于其他開發者撰寫的函式與常數定義？避免**名稱空間**衝突的問題？
在Python中，**模組是幾個重要抽象層的機制之一，也許是最自然的機制之一**，只要建立一個原始碼檔案modu.py，就建立一個模組modu，原始碼主檔名就是**模組名稱**。
`import modu`陳數據會在相同目錄下尋找modu.py，如果沒找到，**則會試著尋找在sys.path中遞迴地尋找modu.py**，如果還是沒有，就會引發`ImportError`例外。
# 類別

# 以下看不懂
> 模組提供了名稱空間。模組中的變數、函式與類別，基本上需透過模組的名稱空間來取得。在 Python 中，import、import as 與 from import 是陳述句，可以出現在程式中陳述句可出現的任何位置，它們基本上用來在現有範疇（Scope）中匯入、設定名稱空間，舉例來說，如果先前程式範例是撰寫於 xmath.py 檔案中，那麼以下是一些 import、import as 與 from import 的使用實例，假設這些程式是撰寫在與 xmath.py 相同目錄的另一個 .py 檔案：
```ruby
import xmath
print('# import xmath')
print(xmath.pi)
print(xmath.max(10, 5))
print(xmath.sum(1, 2, 3, 4, 5))

print('# import xmath as math')
import xmath as math # 為 xmath 模組取別名為 math
print(math.e)

print('# from xmath import min')
from xmath import min  # 將 min 複製至目前模組，不建議 from modu import *，易造>成名稱衝突
print(min(10, 5))
```
> 結果應該會顯示：
```ruby
# import xmath
3.141592653589793
10
15
# import xmath as math
2.718281828459045
# from xmath import min
5
```
