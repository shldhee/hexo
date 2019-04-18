---
title: javascript-native
categories: javascript
tags:
  - javascript
  - native
  - String
  - Number
  - Array
  - Function
  - Error
  - Date
  - Symbol
date: 2019-04-17 00:23:17
---


# 1. Javascript - native

- `native(네이티브)`란 사실 내장 함수이다.

- `String()`
- `Number()`
- `Boolean()`
- `Array()`
- `Object()`
- `Function()`
- `RegExp()`
- `Date()`
- `Error()`
- `Symbol()`

``` js
var a = new String("abc");
typeof a; // "object" ... "String"이 아니다.
a instanceof String; // true
Object.prototype.toString.call(a); // "[object String]"
console.log(a); // String {"abc"} chrome
```

- `(new String("abc"))` 생성자의 결과는 원시 값 "abc"를 감싼 **객체 래퍼**다.
- `object`하위 타입에 가깝다.
- **`new String("abc")`은 "abc"를 감싸는 문자열 래퍼를 생성하며 원시 값 "abc"는 아니라는 점**

## 1.1 내부 \[[Class]]

- `typeof`가 `"object"`인 값에는 `[[Class]]`라는 내부 프로퍼티가 추가로 붙는다.
- 이 프로퍼티는 직접 접근할 수 없고 `Object.prototype.toString()`이라는 메서드에 값을 넣어 호출함으로써 존재를 엿 볼 수 있다.

```js
Object.prototype.toString.call([1,2,3]);
// "[object array]"
Object.prototype.tostring.call(/regex-literal/i);
// "[object RegExp]"

// 원시값은?? 원시값 내부에도 [[Class]] 존재
Object.prototype.toString.call(null);
// "[object Null]"
Object.prototype.toString.call(undefined);
// "[object Undefined]"
```

- `Null`, `undedefined`는 네이티브 생성자가 없지만 내부 `[[Class]]` 값을 확인해보니 `Null, Undefined`다.
- 그 밖에 다른 원시 값들도 같은 결과는 낸다. 바로 객체 레퍼로 자동`박싱(Boxing)`이다.

## 1.2 래퍼 박싱하기

- 원시 값엔 프로퍼티나 메서드가 없으므로 `.length, .toString()`으로 접근하려면 원시 값을 객체 래퍼로 감싸줘야 한다. 하지만 자바스크립트는 원시 값을 알아서 박싱해준다.

``` js
var a = "abc";
a.length; // 3;
a.toUpperCase(); // "ABC"

// 예) i < a.length;
```

### 1.2.1 객체 래퍼의 함정

- `Boolean`으로 래핑한 경우 주의해야 한다.

```js
var a = new Boolean(false);

if(!a) {
  console.log("OOPS!!"); // 실행되지 않는다.
}
```

- `false`를 객체 래퍼로 감쌌지만 문제는 객체가 `truthy`한 점이다. 따라서 조건문에서는 `false`이므로 실행되지 않는다.
- 수동으로 원시 값을 박승하려면 `Object()`함수를 이용하자(앞에 `new`키워드가 없다.)
- 객체 래퍼로 직접 박싱하는건 권하고 싶지 않다.

## 1.3 언박싱

- 객체 래퍼의 원시 값은 `valueOf()` 메서드로 추출한다.

```js
var a = new String('abc');
var b = new Number(42);
var c = new Boolean(true);

a.valueOf(); // "abc"
b.valueOf(); // 42
c.valueOf(); // true

// 이떄도 언박싱이 일어난다.
var a = new String("abc");
var b = a + ""; // 'b'에는 언박싱된 "abc"가 대입

typeof a; // "object"
typeof b; // "string"
```

## 1.4 네이티브, 나는 생성자다.

- 생성자보단 리터럴 형태로 생성하자.

### 1.4.1 Array()

```js
var a = new Array(1,2,3);
a; // [1,2,3]

var b = Array(1,2,3);
b; // [1,2,3]
```

- `new`가 있고 없고 차이는 없다. 둘은 결과적으로 같다.
- `Array()` 인자를 하나면 받으면 `length`가 적용되어 크기가 된다.
- 빈배열을 만들고 나중에 `length`프로퍼티에 숫자 값을 할당하는게 맞는데 자바스크립트는 혼란스러운 구조로 되어있다.

``` js
var a = new Array(3);

a.length; // 3
a;  // (3) [empty × 3] 윈도우 크롬
```

``` js
var a = new Array(3);
var b = [ undefined, undefined, undefined ];
var c = [];
c.length = 3;

a; // (3) [empty × 3]
b; // (3) [undefined, undefined, undefined]
c; // (3) [empty × 3]
```

### 1.4.2 Object(), Function(), and RegExp()

- 정말 특별하지 않은 이상 생성자 대신 **리터럴**로 모두 사용하자.

``` js
var c = new Object();
c.foo = "bar"

var d = { foo: "bar" }

var e = new Function("a", "return a * 2;");
var f = function(a) { return a * 2 }
function g(a) { return a * 2; }

var h = new RegExp("^a*b+","g");
var i  = /^a*b+/g;
```

### 1.4.3 Date(), Error()

- `Date(), Error()`는 리터럴이 없으므로 네이티브, 생성자 함수로 사용해야 한다.
- `new Date()`로 유닉스 타임스탬프 값을 얻는 용도로 사용 `getTime()`
- ES5부터는 `Date.now()`를 사용하는게 더 쉽다.

``` js
if (!Date.now) {
  Date.now = function() {
    return (new Date().getTime());
  }
}
```

- `error`객체의 주 용도는 현재의 실행 스택 콘텍스트를 포착하여 객체에 담는 것

``` js
function foo(x) {
  if (!x) {
    throw new Error("x를 안줬다");
  }

  //...
}
```

- `Error` 객체 인스턴스에는 적어도 `message` 프로퍼티가 있고 `type`등이 포함되어 있을 때도 있다.
- 사람들이 보기 쉽게 하려면 `.stack`프로퍼티 대신 `error`객체의 `toString()`를 호출하는 것이 좋다.

### 1.4.4 Symbol()

- ES6에서 처음 선보인, 새로운 원시 값 타입니다.
- 심볼은 충돌 염려 없이 객체 프로퍼티로 사용 가능한, 특별한 `유일 값`이다.
- 프로퍼티명으로 사용 가능하다 코드나 콘솔에서 실제 값을 보거나 접근은 불가능하다.

```js
obj[Symbol.iterator] = function() { /* ... */ };
```

- 심볼을 정의하려면 `Symbol()` 네이티브를 사용 `new`를 붙이면 에러가 난다!

``` js
var mysym = Symbol("my own symbol");
mysym; // Symbol(my own symbol)
mysym.toString(); // "Symbol(my own symbol)"
typeof mysym; // "symbol"

var a = {};
a[mysym] = "footer"

Object.getOwnPropertySymbols(a); // [Symbol(my own symbol)]
```

- 전용 혹은 특별한 프로퍼티에 사용될 수 있으며, 개발자가 `전용/특수/내부 프로퍼티입니다.`라고 하면서 `_`가 붙은 프로퍼티명도 심볼로 대체될 가능성이 높다.

### 1.4.5 네이티브 프로토타입

- 내장 네이티브 생성자는 각자의 `.prototype` 객체를 가진다.(`Array.prototype, String.prototype 등)
- `prototype` 객체에는 해당 객체의 하위 타입별로 고유한 로직이 담겨 있다.
- 이를테면 문자열 원시 값을(박싱으로) 확장한 것까지 포함하여 모든 `String` 객체는 기본적으로 `String.prototype` 객체에 정의된 메서드에 접근할 수 있다.

- `String.prototype.indexOf()`
- `String.prototype.charAt()`
- `String.prototype.substr()`
- `String.prototype.substring()`
- `String.prototype.slice()`
- `String.prototype.toUpperCase()`
- `String.prototype.toLowerCase()`
- `String.prototype.trim()`

- **이중 문자열 값을 변경하는 메서드는 없고 수저잉 일어나면 늘 기존값으로부터 새로운 값을 생성한다.**
- 프로토타임 위임(Delegation) 덕분에 모든 문자열이 이 메서드들을 같이 쓸 수 있다.

``` js
var a = " abc ";

a.indexOf("c"); // 3
a.toUpperCase(); // " ABC ";
a.trim(); // "abc";
```

- 네이티브 프로토타입은 변경할 수도 있지만 바람직하지 않다.
- `Function.prototype`은 함수, `RegExp.prototype`은 정규 표현식, `Array.prototype`은 배열이다.

## 1.5 정리하기

- 자바스크립트는 원시 값을 감싸는 객체 래퍼, 즉 네이티브(`String,Number,Boolean 등`)를 제공
- "abc" 같은 원시 값이 있을 때, 이 값의 `length` 프로퍼티나 `String.prototype`에 정의된 메서드를 호출하면 자바스크립트는 **자동으로 원시 값을 `박싱`(해당하는 객체 래퍼로 감싼다)**하여 필요한 프로퍼티와 메서드를 쓸 수 있게 도와준다.


