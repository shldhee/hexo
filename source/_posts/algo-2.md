---
title: Algorithm(Level2) - adder
date: 2017-07-29 00:54:55
categories: Algorithm
tags:
    - Algorithm
    - Javascript
    - JS
thumbnail:
---

# 두번째 알고리즘

## 문제 설명

adder함수는 정수 a, b를 매개변수로 입력받습니다.
두 수와 두 수 사이에 있는 모든 정수를 더해서 리턴하도록 함수를 완성하세요. a와 b가 같은 경우는 둘 중 아무 수나 리턴하세요.
예를들어 a가 3, b가 5이면 12를 리턴하면 됩니다.

a, b는 음수나 0, 양수일 수 있으며 둘의 대소 관계도 정해져 있지 않습니다.

### 답안

#### 내 답안

``` js
function adder(a, b){
	var result = 0
	//함수를 완성하세요
	if(a === b) return result = a;
	if(a > b) {
		var temp = a;
		a = b;
		b = temp;
	}

	if(a < b) {
		for(a; a <= b; a++ ) {
			result += a;
		}
	}
	return result;
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
console.log( adder(3, 5) )
```

#### 수정용 답안(다른 사람 참고)

``` js
function adder(a, b){
	var result = 0
	//함수를 완성하세요
	for(var i = Math.min(a,b); i <= Math.max(a,b); i++) {
		result += i;
	}
	return result;
}

// 아래는 테스트로 출력해 보기 위한 코드입니다.
console.log( adder(3, 5) )
```

### 공부할 점

#### 1. `Math.max,Math.min` 활용

`Math.min`으로 두 정수 중 최솟값 찾기
`Math.max`으로 두 정수 중 최대값 찾기
