---
title: Javascript-Type
date: 2019-04-09 00:28:15
categories: javascript
tags:
- javascript
- type
- undefined
- undeclared
thumbnail:
---

# Javascript - type

- `type(타입)`이란 자바스크립트 엔진, 개발자 모두에게 어떤 값을 다른 값과 분별할 수 있는, 고유한 내부 특성의 집합

## 1.1 타입, 그 실체를 이해하자

- 타입별로 내재된 특성을 제대로 알아야 값을 다른 타입으로 변환하는 방법을 정확히 이해할 수 있다.(강제변환)
  - ex) 42를 문자열로 보고 위치 1에서 "2"라는 문자를 추출하려면, 먼저 숫자 42에서 문자열 "42"로 변경(강제변환)해야 한다.
- 강제변환은 다양한 방식으로 일어나므로 값/타입을 확실히 알아야 추후 문제가 생기지 않는다.

## 1.2 내장타입

- `null`
- `undefined`
- `boolean`
- `number`
- `string`
- `object`
- `symbol(ES6부터)`
- `object`를 제외한 이들은 `원시 타입(primitives)`이다.


``` js
typeof undefined === "undefined" // true
typeof true === "boolean" // true
typeof 42 === "number" // true
typeof "42" === "string" // true
typeof { life : 42 } === "object" // true
// ES6부터 추가
typeof Symbol() === "symbol" // true
```

- `null`를 제외한 6개 타입은 자신의 명칭과 동일한 문자열을 반환한다.

``` js
typeof null === "object" // true
```

- `null`를 반환하면 좋겠지만 현재 수정하기에는 너무 멀리 온 듯하다.....

``` js
var a = null;
(!a && typeof a === "object"); // true
```

- `null`을 확인하는 방법은 `null`이 falsy한 값을 이용해 falsy한 원시값과 object를 이용해 타입을 체크한다.
- `typeof`가 반환하는 문자열은 하나 더 있다. `"function"`

``` js
typeof function a() {...} === "function"; // true
```

- `function`이 최상위 레벨의 내장타입같지만 명세를 읽어보면 `object`의 하위 타입이다.
- 함수는 `호출 가능한 객체(Callable Object)내부 프로퍼티[[Call]]로 호출할 수 있는 객체`라고 명시되어 있다.
- 함수는 객체이므로 프로퍼티를 사용할 수 있다.
  - 함수의 선언된 인자 개수는 함수 객체의 `length`프로퍼티로 알 수 있다.

``` js
function sum(a, b) {
  ...
}

sum.length; // 2
```

- 배열도 객체의 '하위 타입'이며 숫자 인덱스를 가지며, `length` 프로퍼티가 자동으로 관리되는 등 추가 특성을 가지고 있다.

``` js
typeof [1,2,3] === "object" // true
```

## 1.3 값은 타입을 가진다.

- **값에는 타입이 있지만 변수엔 타입이 없다.**
- 변수는 언제라도 어떤 형태의 값이라도 가질 수 있다.
- 자바스크립트는 `타입 강제(type enforcement`를 하지 않는다.
  - 변수값이 처음에 할당된 값과 동일한 타입일 필요가 없다.(문자열을 넣었다가 숫자를 넣었다 불린을 넣어도 된다.)
- 반면에, 값은 타입을 절대 바꿀 수 없다.
  - 42는 내장된 숫자 타입의 값이고 "42"는 내장된 문자열 타입의 값이다. 이 타입은 절대 바꿀 수 없지만 강제변환을 할 수 있다.
- 변수에 typeof 연산자를 사용하는건 `이 변수의 타입이 무엇이니?`랑 같지만 실은 타입이란 개념은 변수에 없으므로 `이 변수에 들어있는값의 타입은 무엇이니?`라고 묻는게 정확하다.

``` js
var a = 42;
typeof a; // "number"

a = true
typeof a; // "boolean"
```

- typeof 연산자의 반환값은 언제나 문자열이다.

``` js
typeof typeof 42; // string
```

### 1.3.1 값이 없는(undefined) vs 선언되지 않은(undeclared)

- `undefined` : 접근 가능한 스코프에 변수가 선언되었으나 현재 아무런 값도 할당되지 않는 상태
- `undeclared` : 변수 자체가 선언조차 되지 않은 상태

``` js
var a;

a; // undefined;
b; // ReferenceError: b가 정의되지 않았습니다.
// b is not defined
```

- `undefined`와 `b is not defined`랑 뜻이 다르니 꼭 참고하자.
- 선언되지 않은 변수의 typeof 변수는 더 헷갈린다.

``` js
var a;
typeof a; // undefined
typeof b; // undefined
```

- typeof는 선언되지 않는 변수인데 오류를 발생하지 않는다.
- **이것이 바로 typeof만의 특별한 안전가드**이다.

### 1.3.2 선언되지 않는 변수

- 여러 스크립트 파일의 변수들이 전역 네임스페이스를 공유할때, typeof의 안전 가드는 의외로 쓸모가 있다.
- 존재하지 않는 기능이나 전역변수 플래그 등을 사용할때

``` js
// DEBUG가 선언되지 않았을 경우 이떄는 에러가 난다.
if (DEBUG) {
  console.log("디버깅 시작");
}

// typeof 안전가드를 사용해 에러가 나지 않는다.
if (typeof DEBUG !== "undefined") {
  coosole.log("디버깅 시작");
}

// 새로운 폴리필 기능을 추가할때
if (typeof sum === "undefined") {
  sum = function() { ... }
}
```

- 새로운 폴리필 기능을 추가할때 `var sum = function() {}`대신 `sum = function() {}`를 사용하는 이유는 `var`를 사용시에는 호이스팅이 적용되어 최상위에 `sum`이 선언된다.
- 이러한 경우 `sum`이 다른곳에 존재하여 여기서 사용이 되지 않아도 중복 선언이 되면 오류를 내는 경우가 있으므로 조심해야 한다.
- ES6에서는 `let`는 블록스코프가 적용되므로 문제가 발생하지 않는다.

- 소스를 복사해서 붙혀넣기할때 소스안에 특정 변수값이 정의되어 있는지 체크할때

``` js
function doSomethingCool() {
  var helper = (typeof Feature !== "undefined") ? Feature : function() {...}

  var val = helper();
  //
}
```

- `Feature`라는 변수가 있으면 그대로 사용하고 없으면 새로 만든 함수를 할당하여 사용한다.


``` js
(function() {
  function feature() { return "새로운 기능" }
  function doSomethingCool() {
    var helper = (typeof feature !== "undefined") ? feature : function () { return "기본 기능" }
  }
  doSomethingCool();
})();
```

- 새로운 기능을 선언하고 없으면 기본 기능을 사용

``` js
function doSomethingCool(feature) {
  var helper = feature || function () { return "기본기능"; }
}
```
- 의존성 주입 설계 패턴
- 참고 : https://m.blog.naver.com/PostView.nhn?blogId=pjt3591oo&logNo=220893520541&proxyReferer=https%3A%2F%2Fwww.google.com%2F

## 1.4 정리하기

- 타입은 값의 내재된 특성을 정의한다.
- 자바스크립트에는 7가지 타입이 있다.
- 변수는 타입이 없고 값은 타입이 있다.
- `undefined`, `undeclared` 큰 차이가 있다. 아예 다르다.
- `typeof` 안전가드의 활용이 제법 쓸만하다.
