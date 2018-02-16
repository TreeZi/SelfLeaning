##### title: `Python 3 Tutorial 第二堂`
##### date: `2/14`
-----------------------------------
###### date: 	`2/14`
###### lesson: 	[`Python 3 Tutorial 第二堂（2）數值與字串型態`](https://openhome.cc/Gossip/CodeData/PythonTutorial/NumericStringPy3.html)
-----------------------------------

一門語言提供的資料型態（Data type）、運算子（Operator）、程式碼封裝方式等等，會影響演算法與資料結構的實作方式。
- 內建型態（Built-in type）、變數（Variable）與運算子（Operator）
- 函式（Function）、類別（class）、模組（Module）與套件（Package）
	>	函數式語言是？

------------------------------------

```ruby
type(1)			# 1 是什麼型態？
type(1111111111111111111111111111111111111111111111111)				# 很長的整數也是 int
type(3.14)		# 浮點數是 float 型態
type(True)		# 布林值是 bool	型態
type(3+4j)		# 支援複數的 complex 型態
2**100			# 2 的 100 次方
```

不管如何，只要數字後面有`.`，其型態就會變成`float`浮點數。
```ruby
type(10/3)		# float
type(10//3)		# int
type(10/3.0)	# float
type(10//3.0)	# float
```

多數的CPU與浮點數運算器多採用**IEEE754浮點樹運算**。會有一些浮點數本身就有誤差。
```ruby
1.0 - 0.8
#0.19999999999999996
print(1.0 - 0.8)
#0.19999999999999996
(10 - 8)/10
#0.2
print((10 - 8)/10)
#0.2
```

#在Python中，有`__`開頭暗示著**不要直接呼叫或使用**。
```ruby
import decimal
a = decimal.Decimal('1.0')
b = decimal.Decimal('0.8')
a - b
type(a - b)		# 類型是什麼？
#<class 'decimal.Decimal'>	# 類型是 'decimal.Decimal
#Decimal('0.2')
type(print(a - b))			# 類型是什麼？
#<class 'NoneType'>			# 類型是 'NoneType' 但這個類型是啥？？？
```

有些時候會需要使用略過符號 `\` ，如以下幾種情況：`\t` `\r` `\n`：
```ruby
'c:\todo'
print('c:\todo')
print('c:\\todo')
```

此外，也可以在字串前面加上`r`，表示後面是**原始字串**。這樣會自動略過特殊情況的字元：
```ruby
r'c:\todo'
print(r'c:\todo')
print(r'c:\nodo')
print(r'c:\todo')
```

- 在Python中的字串**不可變**，無法改變已經建立的字串內容。
- 測量字串實際的字元長度，要使用`len`
- 用`for`來迭代字串
- 用`in`來測試字串是否包含某一段特定的子字串
- 用`+`來串街字串
- 用`*`來複製字串

```ruby
name = 'Treezi'
len(name)
twname = '李樹'
len(twname)
for ch in name:
	print(ch)

for ch in twname:
	print(ch)

'Just' in name
'李' in twname
name + name
twname + twname
name * 3
twname * 3
#----------------------------------------------
#測試錯誤： 這個錯誤是什麼意思？？？
>>> name ** 2
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for ** or pow(): 'str' and 'int'
```

### `[]`
`[]`可以用來取得字串中的某個字元。注意：索引從**0**開始。負數表示從尾端開始計數。
```ruby
lang = 'Python'
lang[0]
lang[-1]
```
`[]`也可以用來切割字串
```ruby
lang[1:5]		# 取得索引 1 至 5 （包括 1 但不包括 5 ）的字串
#有前沒有後）
lang[0:]		# 省略結尾，表示從頭到尾
lang[:6]		# 省略起始，表示從 0 開始
```
`[]`可以指定距離：
```ruby
lang[0:6:2]		# 每隔2個字元來取得字串
```

### 字串格式化 `看不懂！！！`

```
>>> '%d %.2f %s' % (1, 99.3, 'Treezi')
'1 99.30 Justin'
>>> '(real)s is %(nick)s' % {'real' : 'Justin', 'nick' : 'caterpillar'}
'(real)s is caterpillar'
>>> '%(real)s is %(nick)s' % {'real' : 'Justin', 'nick' : 'caterpillar'}
'Justin is caterpillar'
```
```ruby
'%(d)s %(.2f)s %(s)s' % {"d" : "1", ".2f" : "99.3", "s" : 'Treezi'}
>>> '1 99.3 Treezi'  #跟後面跑的一樣
```
```ruby
'{0} is {1}'.format('TreeZi', 'tree')
'{he} is {yoo}'.format(he = 'TreeZi', yoo = 'tree')
'{0} is {yoo}'.format('TreeZi', yoo = 'tree')
```