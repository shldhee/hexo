---
title: javascript-closure
date: 2017-09-29 10:52:45
categories: javascript
tags:
- javascript
- closure
- function
thumbnail:
---

# 작성중....입니다....

# closure(클로저)

>클로저는 함수와 함수가 선언된 어휘적 환경의 조합이다.
 클로저는 외부함수(포함하고 있는)의 변수에 접근할 수 있는 내부 함수를 일컫습니다.
 클로저는 자신의 범위(Scope) 밖에 있는 변수들에 접근할 수 있는 함수를 의미합니다.

* 내부 함수는 외부 함수에 접근할 권한을 가지고 있다. (`displayName()`는 부모함수 `init()`에 선언된 변수 `name`에 접근)

``` js
function init() {
	var name = "Mozilla"; // name은 init의 지역변수
	function displayName() { // displayName()은 내부 함수, 클로저
		alert(name); // 부모 함수(init())에서 선언된 변수 사용
	}
	displayName();
}
init();
```

## clouser(클로저)



``` js
function makeFunc() {
	var name = "Mozliia";
	function displayName() {
		alert(name);
	}
	return displayName;
}

var myFunc = makeFunc();
myFunc();
```

* 몇몇의 프로그래밍 언어들은 함수 안의 지역 변수들은 그 함수가 수행되는 기간 동안에만 존재한다.
* `makeFunc()` 실행이 끝나면 `name`변수에 더 이상 접근할 수 없게 될 것으로 예상하는 것이 합리적이다.
* 하지만 위 코드는 예상대로 작동하므로 자바스크립트는 몇몇의 프로그래밍 언어와는 다르다.
* **그 이유는 자바스크립트의 클로저 때문이다.**
