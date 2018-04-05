#!/bin/bash

TEST="
num1
num2
num3
num4
"

### 出力が1行になっちゃう
while read VARI; do

  echo $VARI
  echo "test"

done <<< $TEST

# ただの区切り文字
echo "-------"

### 改行される but 改行も1行として扱われる？
while read VARI; do

  echo $VARI
  echo "test2"

done <<< "$TEST"

# ただの区切り文字
echo "-------"

# こちらが改行を除いたヒアストリング
TEST2="num1
num2
num3
num4"

while read VARI; do

  echo $VARI
  echo "test3"

done <<< "$TEST2"
