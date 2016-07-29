#! /bin/usr/env python
# -*- coding:utf-8 -*-

#値の設定 
m = 23456789012345678907
A = 23433333333333333333
B = 23456789012345678901

print "mh:",hex(m)
print "Ah:",hex(A)
print "Bh:",hex(B)

#とりま、必要パラメータを抽出
S = 0
b = bin(B).replace("0b","")
i = len(b)-1 #Bのビット長抽出
n = i

print "\ncalcutlating...\n"

#インターリーブ法開始
while i >= 0:
    #biの抽出
    if i >= 0:
        bi = int(b[n-i])
    else:
        bi = 0
    
    #メイン計算部分
    S = S << 1
    I = bi*A
    S = S + I
    if S >= m:
        S = S - m
    if S >= m:
        S = S - m

    #iのデクリメント
    i -= 1;
#end while

print "by calculate of cpu = ",A*B%m
print "by interleave deci  = ",S
print "by interleave hex   = ",hex(S)

if S == (A*B)%m:
    print "* succeeded!:) *"
else:
    print "\nsomething is wrong:("

