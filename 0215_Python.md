##### title: `Python 3 Tutorial 第二堂`
##### date: `2/15`
----------------------------------------
Python能夠支援的容器型態有`list`、`set`、`dict`、`tuple`。
# `list` 型態
	`list`的操作跟`str`一樣。
	- 可以用`len`回傳list的長度
	- `in`可以測量某元素是否在list中
	- `+`用來串接兩個list
	- `*`用來複製指定數量的list
	- `[]`用來指定索引，並從list中取得元素。（同樣，負索引是從最後一個元素計數。

```ruby
[0] * 10
', '.join(['justin', 'caterpillar', 'openhome'])	
list('justin')
```

# `join`的用法
join後面接一串`str`或者一個`list`。用法如下：
```ruby
#join + str
'; '.join(['str1','str2','str3','str4','str5',...])
```
這樣會把這些str全部串接為一個新的str。

# `if`、`for` 與 `while`
```ruby
from sys import argv
if len(argv) > 1:
	print('Hello, ', argv[1])
else:
	print('Hello, Guest')
```
在Python中，使用 `:` 來作為區塊（Block）開始的標示，相同`縮排`則表示**相同區塊範圍的程式碼**。縮排必須一致。如果想使用四個空白字元縮排，整個程式都必須是四個空白字元縮排。如果要用 `Tab` 縮排，整個程式都必須使用 `Tab` 縮排。

此外， `if..else`也可以寫成運算式的形式，如下：
```ruby
from sys import argv
print('Hello, ', argv[1] if len(argv) > 1 else 'Guest')
```
`print`([滿足if條件的值]() `if` [if的條件]() `else` [沒滿足if的值]())

# **覺得很重要的重點
> Python中的 `for` 可用來迭代循序結構的物件。例如想將某個list的元素都做二次方運算，收集在另一個 `list` 中的話，可以如下：
```ruby
numbers = [10, 20, 30]
squares = []
for number in numbers:
	squares.append(number ** 2)
print(squares)
```
至於 `while` ，一般是用在結束條件不確定的情況下。例如求最大公因數可以如下：
```ruby
print('Enter two numbers...')
m = int(input('Number 1: '))
n = int(input('Number 2: '))
while n !=0:				# 若 n 不等於 0 ，進行以下程式碼；若 n 等於 0 ，回傳 print函式
	r = m % n				# r 等於 m 除以 n 的 「餘數」
	m = n					# m 帶入 n 的值 
	n = r					# n 帶入 r （也就是 m 除以 n 的餘數）的值。
print('GCD: {0}'.format(m))	# 若 n 為 0 ，則打印 m 值。
```
	> 為什麼是拿剩下的 `餘數` 去做＠＠（這是一個數學問題）
	##### tags:	`餘數` `最大公因數`
	
# 【複習】t0214的內容：將字串格式化的方式
	```ruby
	'{0} is {1}'.format('TreeZi', 'tree')
	'{he} is {yoo}'.format(he = 'TreeZi', yoo = 'tree')
	'{0} is {yoo}'.format('TreeZi', yoo = 'tree')
	```
-------------------------------------------------
`for`指令

`numbers = [10, 20, 30]`				> 創造一個名為 `numbers` 的list
`squares = []`							> 狀造一個名為 `squares` 的list
`for number in numbers:`				> 對每一個在`numbers`裡面的 `number`（這個 `number` 是無意義的，很類似 R 的函式中， `function(i){i...}`的那個 `i` 。
`	squares.append(number ** 2)`		> 對每一個 `number` 做這個動作：平方 `**2` ，並把平方值 `append` 到 `squares` 裡面。
`print(squares)`						> 打印 `squares`。

		append: 添加、附加
# `for包含式`
上述這段指令也可以用 `for包含式` 來寫：
```ruby
numbers = [10, 20, 30]
print([number ** 2 for number in numbers])
```

# 牛刀小試一下
	> 有一 list ，其內容為[34, 59, 90, 49, 87, 29, 97, 31, 51, 58, 50, 65]取其中的 `偶數` 到另一個新的 list 中。
```ruby
N = [34, 59, 90, 49, 87, 29, 97, 31, 51, 58, 50, 65]
D = []
for n in N:
	if n % 2 != 0:
		D.append( n )

print(D)
```
```ruby
N = [34, 59, 90, 49, 87, 29, 97, 31, 51, 58, 50, 65]
# D.append([n for n in N if n %  2 != 0]) 這樣也可以，但是會變成list中的list
print([n for n in N if n %  2 != 0])
```

# `for包含式` Part 2 
- for包含式也可以形式巢狀結構。
	##### tag: `巢狀結構`
有一個list裡面的元素都是list，想將list串起來（`平坦化`）的作法如下：
```ruby
lts = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print([ele for lt in lts for ele in lt])
```



# `for` 與 `set` 
當使用 `[]` 包圍住 `for` 包含式時，會建立 `list` 實例，如果使用 `{}` 的話，可以建立 `set` 實例，重複的元素會自動刪去。如：
```ruby
{name for name in ['caterpiller', 'Justin', 'caterpillar', 'openhome']}
```
{name for name in ['1','1','1','1','1','1','1','1','1','2']}
```ruby
tests = [10, 20, 30]
hhhs = []
for tt in tests:
	hhhs.append(tt ** 2)

print(squares)
```









# 練習3：使用for包含式

```ruby
	numbers = []
	for number in range(20):
		numbers.append(str(number))

	print(", ".join(numbers))
```
```ruby
	N = []
	print(", ".join([str(n) for n in range(20)]))
```
> 找出周長為24，每個邊長都為整數且不超過10的直角三角形。
```ruby
x + y + z = 24
x > 10
y > 10
z > 10
print([(a,b,c) for a in range(1,11) for b in range(1,11) for c in range(1,11) if a**2 + b**2 == c**2 if a + b + c ==24])
```

# 以下是看不懂的地方
其他三項資料型態：`set`、`dict`、`tuple`
``` ruby
admins = {'Justin', 'caterpillar'}  # 建立 set
users = {'momor', 'hamini', 'Justin'}
'Justin' in admins  # 是否在站長群？
admins & users      # 同時是站長群也是使用者群的？
admins | users      # 是站長群或是使用者群的？
admins - users      # 站長群但不使用者群的？
admins ^ users      # XOR
admins > users      # ∈
admins < users 
```

```ruby
passwords = {'Justin' : 123456, 'caterpillar' : 933933}
passwords['Justin']
passwords['Hamimi'] = 970221
passwords
del passwords['caterpillar']
passwords
passwords.items()
passwords.keys()
passwords.values()
```
```ruby
passwords.get('openhome', '000000')
passwords['openhome']
Traceback (most recent call last):
	File "<stdin>", line 1, in <module>
KeyError: 'openhome'
```



