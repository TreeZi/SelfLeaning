# 迷你超級任天堂遊戲機擴充遊戲

## 重要參考資料
[為迷你超任新增遊戲](https://medium.com/wenli-moe/%E7%82%BA%E8%BF%B7%E4%BD%A0%E8%B6%85%E4%BB%BB%E6%96%B0%E5%A2%9E%E9%81%8A%E6%88%B2-85ad0879b7ab)
需要環境與物件
	1. Windows PC（Windows 7/8/10均可）
	2. Micro-USB連接線
	3. 迷你超任（廢話）
	4. 刷機工具程式Hakchi2（本文寫作時最新版本為2.21d）


###### Github小教室
1. 如果`Repository`端口有新增新的東西，需要先`git pull`把上面的新資料下載到 `Working Directory`，才能再`git push`上去，若否則：

```
~$ git push
Username for 'https://github.com': Username
Password for 'https://TreeZi@github.com': 
To [Repository]
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to '[Repository]'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

2. 若要刪除暫存區`Staging Area`，要使用 `git rm --cached [檔案名]`