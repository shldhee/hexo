---
title: JavaScript - var
date: 2017-09-29 09:32:50
categories: javascript
tags:
- javascript
- var
- hoisting
thumbnail:
---

# var

> 변수 선언은 변수, 선택적인 값으로 초기화된 변수를 선언합니다.

## 설명

* var로 선언된 변수의 범위는 현재 실행 문맥인데, 그 문맥은 둘러싼 함수, 혹은 함수의 외부에 전역으로 선언된 변수도 될 수 있습니다.

``` js
function x() {
  var a = "local";
  b = "global";
}

x();

console.log(a);
console.log(b);
```

* 위와 같이 실행 하면 `Uncaught ReferenceError: a is not defined` 발생한다.
* `x()` 함수 안에 변수 `a`는 함수 안에서만 존재한다.
**선언된 변수들은 변수가 선언된 실행 콘텍스트(execution context)안에서 만들어지기 때문이다.**

``` js
function x() {
  var a = "local";
  b = "global";
}

x();

console.log(b);
```

* 위와 같이 실행하면 `"global"` 출력한다.
**선언되지 않은 변수들은 항상 전역변수이다.**

``` js
console.log(a);
console.log("still going...");
```

* `ReferenceError: a is not defined` 출력
**선언되지 않은 변수들은 변수들을 할당하는 코드`(ex a = 0;)`가 실행되기 전까지는 존재하지 않는다.**

``` js
var a;
console.log(a);
console.log("still going...");
```

* `undefined`
* `"still going..."` 출력

* `undefined`는 만들어졌지만 초기화 할당이 되지 않은 상태
**선언된 변수들은 어떠한 코드가 실행되기 전에 만들어집니다.**

*ECMAScript 5 안에 [strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode), 선언되지 않은 변수에 할당하면 오류를 출력합니다.*


### var 호이스팅(hoisting)

> 위에 말했듯이 변수 선언들은 코드가 실행 되기 전에 처리된다.
> 따라서, 코드 안 어디서든 변수 선언은 최상위에 선언한것과 동등하다.
> 즉, 변수가 선언되기전에 사용될 수 있다는것을 위미합니다.

``` js
hoisting = 1;
var hoisting;
console.log(hoisting);
```

* 위 코드는 아래처럼 작동된다.

``` js
var hoisting;
hoisting = 1;
console.log(hoisting);
```

#### 요약

* var를 사용한 선언된 변수는 현재 실행 문맥 즉, 실행 컨텍스트(execution context)에서 만들어져 그 안에서만 사용이 가능하다.
* var를 사용하지 않은 변수는 지역 변수로 선언된다.
* var 호이스팅(변수 선언들은 코드가 실행되기 전에 처리된다. 즉, 변수가 선언되기전에 사용될 수 있다는것을 의미한다.)
* var를 사용하는 것이 좋고, 최상단에 선언하는 것이 좋다.

참조 : [mdn](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Statements/var)
