---
title: Algorithm(Level2) - Harshad
date: 2017-12-20 16:50:17
categories: Algorithm
tags:
    - Algorithm
    - Javascript
    - JS
thumbnail:
---

# 다섯번째 알고리즘

## 문제 설명

양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다. 예를들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다.

Harshad함수는 양의 정수 n을 매개변수로 입력받습니다. 이 n이 하샤드수인지 아닌지 판단하는 함수를 완성하세요.
예를들어 n이 10, 12, 18이면 True를 리턴 11, 13이면 False를 리턴하면 됩니다.

### 내 답안

``` js
function Harshad(n){
  let result ;
  let numToStringArr = n.toString().split('');
  let sum = numToStringArr.reduce( (p, c) => Number(p) + Number(c) );
  n % sum === 0 ? result = true : result = false;
  return result;
}

console.log(Harshad(18));
```

### 리팩토링

``` js
function Harshad(n){
  var result ;
  n % n.toString().split('').reduce( (p, c) => (+p) + +(c) ) === 0 ? result = true : result = false;
  return result;
}
```

### 공부할 점

#### 1. 숫자 -> 문자열 변환

``` js
  var n = 123;
  n + '';
  n = '123';
```

#### 2. 숫자문자열은 연산자 숫자를 이용해 숫자로 변환이 가능

- 연산자를 활용해 문자열을 숫자로 변경
- Number(p) + Number(c)를 +p + +c 로 변경 가능 
