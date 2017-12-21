---
title: javascript-runtime
date: 2017-12-21 11:13:22
categories: javascript
tags:
- javascript
- eventloop
- setTimeout
- v8
thumbnail:
---

## 자바스크립트는 어떻게 작동하는가: 엔진, 런타임, 콜스택

* 자바스크립트가 단일 쓰레드(Single-threaded)이고 콜백 큐(callback queue) 이용
* 자바스크립트 엔진은 구글의 V8엔진입니다. V8엔진은 크롬과 노드js에서 사용됩니다.

#### V8엔진은 두 부분으로 구성됩니다.

* 메모리힙(Memory Heap): 메모리할당이 이루어지는 곳
* 콜스택(Call Stack): 코드가 실행되면서 스택 프레임이 쌓이는 곳입니다.

#### 런타임

* 자바스크립트의 엔진이 중요하기 하지만 엔진만으로 모든 것이 이루지는 것은 아닙니다. 브라우저가 제공하는 웹 API라는 것도 있어서 DOM, AJAX, `setTimeout` 등이 여기에 포함됩니다. 또한 **이벤트루프**와 **콜백큐**도 있습니다.

#### 콜스택

* 자바스크립트는 싱글 쓰레드(single-threaded) 프로그래밍 언어입니다. 다시 말하면 콜스택이 하나라는 뜻입니다. 따라서 한번에 하나의 일만 할 수 있습니다.
* 콜스택은 우리가 프로그램의 어디에 있는지를 기록하는 자료구조입니다.
* 함수 안으로 들어가게 되면 그 함수는 스택의 제일 위에 놓이게 됩니다. 실행이 완료되면 제거됩니다.

``` js
function multiply(x, y) {
  return x * y ;
}

function printSquare(x) {
  var s = multiply(x, x);
  console.log(s);
}

printSquare(5);
```

Step1|Step2|Step3|Step4|Step5|
--|--|--|--|--|
-|multiply(x, y)|console.log(s);||
printSquare(5)|printSquare(5)|printSquare(5)|printSquare(5)||

* 콜스택의 각각은 **스택프레임(Stack Frame)**이라고 부릅니다.
* 예외가 발생했을때 스택트레이스가 만들어지는 방식입니다. 스택 트레이스란 기본적으로 예외가 발생했을때 콜스택의 상태입니다.

*스택트레이스 생성*
``` js
function foo() {
    throw new Error('SessionStack will help you resolve crashes :)');
}
function bar() {
    foo();
}
function start() {
    bar();
}
start();
```

* **스택 날림(Blowing the stack)** : 콜 스택의 최대 크기에 다다랐을때 나타나는 현상(재귀 함수에서 많이 나타남)

``` js
function foo() {
  foo();
}

foo();
```

Step1|Step2|Step3|Step4|Overflowing
--|--|--|--|--
-|-|-||foo()
-|-|-||foo()
-|-|-||foo()
-|-|-|foo()|foo()
-|-|foo()|foo()|foo()
-|foo()|foo()|foo()|foo()
foo()|foo()|foo()|foo()|foo()

`Maximum call stack size exceeded` 에러 발생

#### 동시성과 이벤트 루프

만약 콜스택 내에 수행시간이 긴 함수가 있으면 어떻게 될까?

* 긴 함수가 동작할때는 끝날때까지 아무것도 할 수 없다.
* 브라우저 콜스택 내의 많은 작업을 수행하면서 긴 시간동안 응당이 없을 수도 있다.(이떄, 브라우저 에러창 뜨면서 응답없음 표시)
* UI를 막지 않고 브라우저가 응답없음 상태에 바지게 하지 않으면서 무거운 코드를 실행하려면 바로 **비동기 콜백(asynchronous callbacks)**을 사용해야 한다.

#### setTimeout

``` js
console.log("Before"); // A
setTimeout(function(){
	console.log("0초뒤"); // B
},0);
console.log("After"); // C
```

* 실행결과는 A->C->B 순이다.
* `setTimeout`은 호출스택이 아닌 이벤트 큐에 추가한다.
* 따라서 호출스택에 A가 쌓이고 없어지고 C가 쌓이고 없어진 다음 이벤트 큐에 있는 B가 실행된다.


#### 참조
---
* [Huiseoul Enginnering](https://engineering.huiseoul.com/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EB%8A%94-%EC%96%B4%EB%96%BB%EA%B2%8C-%EC%9E%91%EB%8F%99%ED%95%98%EB%8A%94%EA%B0%80-%EC%97%94%EC%A7%84-%EB%9F%B0%ED%83%80%EC%9E%84-%EC%BD%9C%EC%8A%A4%ED%83%9D-%EA%B0%9C%EA%B4%80-ea47917c8442)
* [TOAST](http://meetup.toast.com/posts/89)
