---
title: Algorithm(Level1) - findKim
date: 2017-07-25 01:18:23
categories: algorithm
tags:
    - Algorithm
    - javascript
    - js
thumbnail:
---
# 첫번째 알고리즘

## 문제 설명

findKim 함수(메소드)는 String형 배열 seoul을 매개변수로 받습니다.

seoul의 element중 "Kim"의 위치 x를 찾아, "김서방은 x에 있다"는 String을 반환하세요.
seoul에 "Kim"은 오직 한 번만 나타나며 잘못된 값이 입력되는 경우는 없습니다.

### 답안

``` js
function findKim(seoul){
  var idx = 0;
  seoul.findIndex((v, i) => v === "Kim" ? idx = i : '' );
  return "김서방은 " + idx + "에 있다";
}

// 실행을 위한 테스트코드입니다.
console.log( findKim(["Queen", "Tod", "Kim"]));
```

### 보충

#### 1. forIndex 사용법

``` js
function isBigEnough(element) {
  return element >= 15;
}

[12, 5, 8, 130, 44].findIndex(isBigEnough); // 3

[12, 5, 8, 130, 44].findIndex((e) => e > 15); // 3
```

#### 2. indexOf로도 구현 가능

``` js
var a = ["a","b","c"];
    a.indexOf("c");
```
