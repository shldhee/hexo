---
title: Algorithm(Level2) - getDayName
date: 2017-07-31 23:17:40
categories: Algorithm
tags:
    - Algorithm
    - Javascript
    - JS
thumbnail:
---

# 세번째 알고리즘

## 문제 설명

2016년
2016년 1월 1일은 금요일입니다. 2016년 A월 B일은 무슨 요일일까요? 두 수 A,B를 입력받아 A월 B일이 무슨 요일인지 출력하는 getDayName 함수를 완성하세요. 요일의 이름은 일요일부터 토요일까지 각각

SUN,MON,TUE,WED,THU,FRI,SAT

를 출력해주면 됩니다. 예를 들어 A=5, B=24가 입력된다면 5월 24일은 화요일이므로 TUE를 반환하면 됩니다.

### 내 답안

``` js
function getDayName(a,b){
	 var answer = "";
	 var agoDate = new Date(2016,0,1);
	 var newDate = new Date(2016,a-1,b); // a-1 은 0이 1월 11이 12월이므로
	 console.log(newDate);
	 var result = (newDate-agoDate)/86400000%7; // 하루 86400000초
	 var result1 = console.log((newDate-agoDate)/86400000);
	 var result2 = console.log(result1%7);
	 console.log(result);
	 switch (result) {
		 case 0: return "FRI";
			 break;
		 case 1: return "SAT";
			 break;
		 case 2: return "SUN";
			 break;
		 case 3: return "MON";
			 break;
		 case 4: return "TUE";
			 break;
		 case 5: return "WED";
			 break;
		 case 6: return "THU";
			 break;
		 default: throw new Error("이거 실행되면 안댕");
	 }
 }
```

### 다른 사람 답안

``` js
function getDayName(a,b){
	var answer = "";
	answer = new Date(2016,a-1,b).toString.slice(0,3);
	return answer;
	}
}

console.log(getDayName(2,9));
```

### 공부할 점

#### 1. 2016-1-1원래 금요일이므로
	- agoDate를 구할 필요가 없음

#### 2. 간단하게 `toString`을 이용하여 푼다.
