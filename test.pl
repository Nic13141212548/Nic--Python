#!/usr/bin/env python
# _*_ coding:utf-8 _*_
movies=["walle","xiaoshengke","taitannic"]
print(movies[1])
movies.append("coco")
print(movies)
movies.pop(-1)
print(movies)
movies.extend(["lalala","cococo"])
print(movies)
movies.insert(1,1975)
movies.insert(3,1996)
movies.insert(5,2017)
for a in movies:
    print(a)

#输出列表里面的每个数据
movie=["walle","xiaoshengke","taitannic",["123",["456","789","123456789"]]]  #注释
for a in movie:
    if isinstance(a,list):
        for b in a:
            if isinstance(b,list):
                for c in b:
                    print(c)
            else:
                print(b)
    else:
            print(a)
#给函数建立循环，自动调用函数来实施
def print_movie(m):
    for a in m:
        if isinstance(a,list):
            print_movie(a)
        else:
            print(a)

print_movie(movie)

#BIF 内置函数
#组--python代码块，会通过缩进来指示分组。

help(isinstance)

import sys; sys.path


#递归
def fact(n):
    if n==1:
        return 1
    else:
        return n*fact(n-1)
#加个print才会有值哈
print(fact(5))

#列表生成式
list(range(1,11))
l=[]
for x in range(1,11):
    l.append(x*x)

[x*x for x in range(1,11)]


