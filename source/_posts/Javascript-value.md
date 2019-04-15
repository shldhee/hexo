---
title: Javascript-value
date: 2019-04-11 23:50:37
categories: javascript
tags:
  - javascript
  - value
  - reference
  - null
  - undefined
  - string
  - number
---

# Javascript-value

## 1.1 배열

- 자바스크립트는 배열은 타입이 엄격한 다른 언어와 달리, 문자열, 숫자, 객체, 배열 등 어떤 타입의 값이라도 담을 수 있는 그릇

```js
var a = [1, "2", [3]];

a.length; // 3
a[0] === 1; // true
a[2][0] === 3; //true
```

- 배열 크기는 미리 정하지 않고 선언 가능하다.

```js
var a = [];
a.length; // 0
a[0] = 1;
a[1] = "2";
a[2] = [3];

a.length; // 3
```

- 배열 값에 `delete` 연산자를 적용하면 슬롯 제거가 가능하지만, `length`는 변하지 않는다.

```js
var a = [];

a[0] = 1;
a[2] = "test";

a[1]; // undefined

a.length; // 3
```

- 중간에 `a[1]`이 `undefined`처럼 보이지만 실제로(크롬에서)는 `empty`라고 나오며 `a[1] = undefined`랑은 다르다.
- 배열 자체도 객체여서 키/프로퍼티 문자열을 추가 할수 있지만 `length`의 영향은 없다.

```js
var a = [];

a[0] = 1;
a["foobar"] = 2;

a.length; // 1
a["foobar"]; // 2
a.foobar; // 2
```

- 키로 넣는 문자열 값에 10진수 숫자를 넣으면 숫자 키를 인식해서 배열 크기로 인식한다.

```js
var a = [];

a["10"] = 42;

a.length; // 11
```

- 배열의 키/프로퍼티는 추천하지 않으며 객체를 사용하고 배열 원소의 인덱스는 숫자만 쓰자.

### 1.1.1 유사배열

- 유사 배열 값(숫자 인덱스가 가리키는 값들의 집합)을 진짜 배열로 바꾸고 싶을 때가 있다. 이럴때는 `indexOf(), concat(), forEach()`를 사용한다.
- 예를 들어 DOM 쿼리 작업을 수행하면 배열은 아니지만 유사배열 형태의 DOM 원소 리스트가 반환된다. 다른 예로는 함수에서 `arguments` 객체를 사용하여 인자를 리스트로 가져오는것도 마찬가지다.

```js
function foo() {
  var arr = Array.prototype.slice.call(arguments);
  arr.push("bam");
  console.log(arr);
}

foo("bar", "baz"); // ["bar","baz","bam"]
```

- `slice()`에 인자가 없으면 `slice(0)`과 같으며 배열복사와 같다.
- ES6부터는 `Array.from()`이 대신한다.

```js
var arr = Array.from(arguments);
```

## 1.2 문자열

- 문자열은 문자 배열과 비슷할 뿐 같지 않다.
- 문자열은 배열과 겉모습이 닮았다.(유사배열) 둘다 `length`프로퍼티, `indexOf()`, `concat()`메서드를 가진다.

```js
var a = "foo";
var b = ["f", "o", "o"];

a.length; // 3
b.length; // 3

a.indexOf("o"); // 1
b.indexOf("o"); // 1

var c = a.concat("bar"); // "foobar"
var d = b.concat(["b", "a", "r"]); // ["f","o","o","b","a","r"];

a === c; // false
b === d; // false

a; // foo;
b; // ["f","o","o"]
```

- 그렇다면 기본적으로 둘 다 **문자의 배열**이라고 할수 있나? 그렇지 않다.

```js
a[1] = "O";
b[1] = "O";

a; // "foo"
b; // ["f","O","o"]
```

- **문자열은 불변 값(imuutable)이지만 배열은 가변(mutable)이다.**
- `a[1]`처럼 문자열의 특정 인덱스 값에 접근할수 없다. `a.charAt(1)`로 접근해야 한다.
- **문자열은 불변값이므로 문자열 메서드는 그 내용을 바로 수정하지 않고 항상 새로운 문자열을 생성한 후 반환한다.** 반면에 _배열 메서드는 그 자리에서 곧바로 그 배열을 수정한다._

```js
c = a.toUpperCase();
a === c; // false
a; // "foo";
c; // "FOO";

b.push("!");
b; // ["f", "O", "o", "!"];
```

- 따라서 문자열에는 배열 메서드는 사실상 사용할 수 없지만, 문자열에 대해 불변 배열 메서드는 빌려 쓸 수 있다.

```js
a.join; // undefined
a.map; // undefined

var c = Array.prototype.join.call(a, "-");
var d = Array.prototype.map
  .call(a, function() {
    return v.toUpperCase() + ".";
  })
  .join("");

c; // "f-o-o"
d; // "F.O.O."
```

- 문자열을 거꾸로 뒤집는 코드
- 문자열은 지원하지 않지만 배열은 사용가능하다.

```js
a.reverse(); // Uncaught TypeError: a.reverse is not a function

b.reverse();
b; // ["!","o","O","f"]
```

- `reverse()`는 배열 가변 메서드(배열 원본을 바로 수정)이므로 문자열에서 빌려 쓰는것도 불가능하다.
- 문자열 -> 배열 -> 문자열로 해야 문자를 거꾸로 출력할 수 있다.

```js
var c = a
  .split("") // 'a'를 문자의 배열로 분할
  .reverse() // 문자 배열의 순서를 거꾸로
  .join(""); // 문자 배열을 합쳐 문자열로 되돌린다.
c; // "oof"
```

- 문자열 자체에 빈번하게 수정될 경우에는 문자 단위를 저장하는 배열로 사용하고 나중에 `join("")`을 이용해 문자열로 나타는것도 좋은 방법이다.

## 1.3 숫자

- 자바스크립트의 숫자 타입은 `number`가 유일하며 정수, 부동 소수점 숫자를 모두 아우른다.
- 정수는 부동 소수점 값이 없는 값이다.(42.0은 정수 42와 같다.)
- IEE754표준을 따르며 그중에서도 정확히 '배 정도(Double Precision) 표준 포맷을 사용

### 1.3.1 숫자 구문

- 자바스크립트 숫자는 10진수 리터럴로 표기한다.

```js
var a = 42;
var b = 42.3;

// 소수점이 이하가 0일때 생략 가능하다.
var a = 42.0;
var b = 42;
```

- 아주 크거나 아주 작은 숫자는 지수로 표시

```js
var a = 5e10;
a; // 50000000000
a.toExponetial(); // "5e+10"

var b = a * a;
b; // 2.5e+21

var c = 1 / a;
c; // 2e-11
```

- 숫자 값은 `Number` 객체 래퍼로 박싱할 수 있기 때문에 `Number.prototype` 메서드로 접근할 수 있다.

```js
var a = 42.59;

a.toFixed(0); // "43" 지정한 소수점 이하 자릿수까지 숫자를 나타낸다.
a.toFixed(1); // "42.6"
a.toFixed(2); // "42.59"
a.toFixed(3); // "42.590"
a.toFixed(4); // "42.5900"
```

- `.`을 사용할때 프로퍼티 접근자가 아닌 숫자 리터럴의 일부로 해석되므로 주의해야 한다.

```js
// 잘못된 예
42.toFixed(3); // Syntax Error

// 올바른 예
(42).toFixed(3);
0.42.toFixed(3);
42..toFixed(3);
42 .toFixed(3);
```

- 큰 숫자는 보통 지수형으로 표시한다.

```js
var onethousand = 1e3; // 1 * 10^3
var onemilliononehundredthousand = 1.1e6; // 1.1 * 10^6
```

- 숫자 리터럴은 2진,8진,16진 등 다른 진법으로 나타낼 수 있다.

```js
0xf3; // 243의 16진수
0xf3; // 위와 같다
0363; // 243의 8진수

// ES6
0o363; // 243의 8진수 헷갈리지 않게 o을 소문자로 하는것을 추천
0o363; // 위와 같다.
```

### 1.3.2 작은 소수 값

```js
0.1 + 0.2 === 0.3; // false

0.1 + 0.2; // 0.30000000000000004
```

- 이진 부동 소수점으로 나타낸 0.1과 0.2는 원래의 숫자와 일치하지 않는다. 그래서 0.3이 정확히 아니다.
- 이런 오류를 해결하기 위해서는 반올림 오차를 허용 공차(Tolerance)로 처리하는 방법이 있다. 이런 미세한 오차를 머신 입실론(Machine Epsilon)이라 한다.
- 자바스크립트의 머신 입실론은 2^-52이다. ES6에서는 `Number.EPSILON`으로 정의되어 있다.

```js
// ES6 이전 폴리필
if (!Number.EPSILON) {
  Number.EPSILON = Math.pow(2, -52);
}
```

- `Number.EPSILON`으로 동등함 비교

```js
function numbersCloseEnoughToEqual(n1, n2) {
  return Math.abs(n1 - n2) < Number.EPSILON;
}

var a = 0.1 + 0.2;
var b = 0.3;

numbersCloseEnoughToEqual(a, b); // true
numbersCloseEnoughToEqual(0.000001, 0.000002); // false
```

- `Number.MAX_VALUE` 부동 소수점의 최대값
- `Number.MIN_VALUE` 부동 소수점의 최소값

### 1.3.3 안전한 정수 범위

- 안전하게 표현할 수 있는 정수는 최대 2^53 - 1 이다.
- ES6에서는 `Number.MAX_SAFE_INTEGER`로 정의, 최솟값은 `Number.MIN_SAFE_INTEGER`
- 큰 숫자가 필요한 경우는 데이터베이스 등에서 64비트 ID를 처리할때가 대부분이며 숫자 타입으로 정확하게 표시할 수 없으므로 `string` 타입으로 저장한다.
- 아니면 큰수 유틸리티 사용

### 1.3.4 정수인지 확인

- ES6 부터는 Number.isInteger()로 정수 여부 확인이 가능하다.

```js
Number.isInteger(42); // true
Number.isInteger(42.0); // true
Number.isInteger(42.3); // false

// ES6 이전 버전 폴리필
if (!Number.isInteger) {
    Number.isInteger = function(num) {
        return typeof num = "number" && num % 1 == 0;
    }
}
```

- 안전한 정수 확인은 ES6부터는 `Number.isSafeInteger()`

```js
// ES6 이전 버젼 폴리필
if (!Number.isSafeInteger) {
  Number.isSafeInteger = function(num) {
    return Number.isInteger(num) && Math.abs(num) <= Number.MAX_SAFE_INTEGER;
  };
}
```

### 1.3.5 32비트(부호 있는 )정수

- Math.pow(-2,31) 에서 Math.pow(2,31)-1 까지이다.

## 1.4 특수 값

### 1.4.1 값 아닌 값

- `Undefined` 타입의 값은 undefined이다.
- `null` 타입의 값은 null이다.
- undefined와 null은 종종 빈값과 값 아닌 값을 나타낸다.

```
- null은 빈값이다.
- undefined는 실종된 값이다.

- null은 예전에 값이 있었지만 지금은 없는 상태다.
- undefined는 값을 아직 가지지 않은 것이다.
```

- null은 식별자가 아닌 키워드므로 변수로 사용할 수 없지만 undefined는 식별자로 쓸 수 있다.

### 1.4.2 Undefined

- 느슨한 모드에서 전역스코프에서 변수로 undefined 사용이 가능하다.

```js
function foo() {
  undefined = 2;
}

foo();

function foo() {
  "use strict";
  undefined = 2; // 타입 에러 발생
}
foo();
```

- 모드에 상관없이 지역변수는 가능하다.

```js
function foo() {
  "use strict";
  var undefined = 2;
  console.log(undefined); // 2
}
foo();
```

### 1.4.3 특수 문자

#### NaN

- 두 피 연산자가 숫자가 아닌 이상 유효한 숫자가 나오지 않고 NaN이 나온다.
- Not a Number그대로 숫자 아님이라는 설명은 너무 부실하고 유효하지 않은 숫자, 실패한 숫자, 또는 몹쓸 숫자라고 불리는 게 더 정확하다.

```js
var a = 2 / "foo"; // NaN
typeof a === "number"; // true
```

- 숫자가 아닌데 타입은 `number`라니....
- NaN은 경계 값의 일종으로 숫자 집합 내에서 특별한 종류의 에러 상황을 나타낸다.
- 다른 타입처럼 체크하고 싶지만 이상하다.

```js
var a = 2 / "foo";

a == NaN; // false
a === NaN; // false
```

- **NaN은 어떤 NaN과도 동일하지 않다.**

```js
var a = 2 / "foo";
var b = "foo";

a; // NaN
b; // "foo"

window.isNaN(a); // true
window.isNaN(b); // true - ???
```

- b는 숫자가 아니지만 NaN이 아니다.
- 이걸 해결하기 위해 ES6부터는 Number.isNaN()을 사용

```js
if (!Number.isNaN) {
  Number.isNaN = function(n) {
    return typeof n === "number" && window.isNaN(n);
  };
}

var a = 2 / "foo";
var b = "foo";

Number.isNaN(a); // true
Number.isNaN(b); // false
```

- NaN은 자기 자신과도 동등하지 않는 독특함을 응용해서 폴리필을 더 간단히 구현

```js
if (!Number.isNaN) {
  Number.isNaN = function(n) {
    return n !== n;
  };
}
```

#### 무한대

```js
var a = 1 / 0; // Infinity
var b = -1 / 0; // -Infinity
```

- 자바스크립트는 유한 숫자 표현식을 사용하므로 연산 결과가 +무한대 / -무한대가 될 수 있다.
- 무한을 무한으로 나누면 NaN

#### 영(0)

- 보통의 영(+0)과 음의 영(-0)이 존재

```js
var a = 0 / -3; // -0
var b = 0 * -3; // -0
```

- 덧셈과 뺄셈에는 -0이 나올일이 없다.
- 명세에 따르면 -0을 문자열화 하면 항상 "0"이다.

```js
var a = 0 / -3;

a; // -0

a.toString(); // "0"
a + ""; // "0"
String(a); // "0"

JSON.stringify(a); // "0"
```

- 브라우저만 제대로 표시되고 나머지에서는 0으로 보여준다.
- 반대로 하면 -0으로 있는 그대로 보여준다.(문자열 -> 숫자)

```js
+"-0"; // -0
Number("-0"); // -0
JSON.parse("-0"); // -0
```

- 0과 -0을 구분하려면 다음 함수를 사용

```js
// -0 인지 확인
function isNegZero(n) {
  n = Number(n);
  return n === 0 && 1 / n === -Infinity;
}

isNegZero(-0); // true;
isNegZero(0 / -3); // true;
isNegZero(0); // false;
```

- -0, +0 이 필요한 이유는 값의 크기로 어떤 정보(예 : 애니메이션 프레임당 넘김 속도)와 그 값의 부호로 또 다른 정보(예 : 넘김방향)를 동시에 나타내야 하는 경우가 있기 때문이다.

### 1.4.4 특이한 동등 비교

- ES6부터는 두 값이 절대적으로 동등한지를 확인하는 새로운 유틸리티를 지원한다.
- `Object.is()`를 사용

```js
var a = 2 / "foo"; // NaN
var b = -3 * 0; // -0

Object.is(a, NaN); // true
Object.is(b, -0); // true
Object.is(b, 0); // False

//ES6 이전 폴리필
if (!Object.is) {
  Object.is = function(v1, v2) {
    // -0 테스트
    if (v1 === 0 && v2 === 0) {
      return 1 / v1 === 1 / v2;
    }
    // NaN 테스트
    if (v1 !== v1) {
      return v2 !== v2;
    }
    // 기타
    return v1 === v2;
  };
}
```

- `==`,`===`가 안전하다면 `Object.is()`는 사용하지 않는것이 좋다.(강제변환 이슈) 그리고 기본 연산자가 빠르고 일반적이다. 특이한 동등 비교 할때만 사용하자.

## 2.5 값 vs 레퍼런스

- 언어마다 값-복사, 레퍼런스-복사의 형태로 할당/전달된다.
- 자바스크립트에서 레퍼런스는 (공유된) 값을 가리키므로 서로 다른 10개의 레퍼런스가 있다면 이들은 저마다 항상 공유된 단일 값(서로에 대한 레퍼런스/포인터 따위는 없다)을 개별적으로 참조
- 값의 타입만으로 값-복사, 레퍼런스-복사 둘 중 한쪽이 결정된다.

```js
var a = 2; // 2는 원시값으로 a엔 초기 사본
var b = a; // 'b'는 언제나 'a'값을 복사 또다른 사본
b++;
a; // 2
b; // 3

var c = [1, 2, 3]; // 동일한 공유 값 [1,2,3]에 대한 개별 레퍼런스
var d = c; // 'd'는 공유된 '[1,2,3]'값의 레퍼런스
d.push(4);
c; // [1,2,3,4]
d; // [1,2,3,4]
```

- `null, undefined, string, number, boolean, symbol` 같은 단순 값은(원시값) 언제나 값-복사 방식으로 할당/전달
- 객체나 함수 등 합성 값은 할당/전달 시 반드시 **레퍼런스 사본**을 생성
- `c,d`는 레퍼런스 값을 동등하게 참조, 레퍼런스로 실제 공유한 배열 값이 변경되면, 이 공유 값 한군데에만 영향을 미치므로 두 레퍼런스는 갱신된 값 [1,2,3,4]를 쳐다본다.
- 레퍼런스는 변수가 아닌 값 자체를 가리키므로 A레퍼런스로 B레퍼런스가 가리키는 대상을 변경할 수 없다.

```js
var a = [1, 2, 3];
var b = a;

b = [4, 5, 6];
a; // [1,2,3]
b; // [4,5,6]
```

- b를 [4,5,6]으로 할당해도 a가 참조하는 [1,2,3]은 영향 받지 않는다.
- a가 변경경되려면 포인터 개념이 존재해야되는데 자바스크립트는 포인터 개념이 없다!

```js
function foo(x) {
  x.push(4);
  x; // (1)

  x = [4, 5, 6];
  x.push(7);
  x; // (2)
}

var a = [1, 2, 3];
foo(a);

a; // (3)
```

- (1) : [1,2,3,4]
- (2) : [4,5,6,7]
- (3) : [1,2,3,4]
- a를 인자로 넘기면 a의 레퍼런스 사본이 x에 할당 (a와 x는 [1,2,3])
- x = [4,5,6] 하는 순간 x는 새로운 레퍼런스를 참고하면서 a와 같은 곳을 참조하던 레퍼런스가 변경된다.
- 레퍼런스 x로 a가 가리키고 있는 값을 바꿀 방법이 없다.

```js
function foo(x) {
  x.push(4);
  x; // (1)

  x.length = 0;
  x.push(4, 5, 6, 7);
  x; // (2)
}

var a = [1, 2, 3];
foo(a);

a; // (3)
```

- (1) : [1,2,3,4]
- (2) : [4,5,6,7]
- (3) : [4,5,6,7]
- `x.length`로 배열(a와 x가 가리키고 있는 레퍼런스)은 변경하는 방식이다.

- 합성 값을 값-복사에 효과적으로 전달하려면 손수 값의 사본을 만들어 레퍼런스가 원본을 가리키지 않게 한다.

```js
foo(a.slice());
```

- `slice()`가 얕은 복사로 새로운 배열의 사본을 생성
- `foo()`는 `a`의 내용을 건들릴 수 없다.
- 반대로 원시값을 합성 값(객체, 배열 등)처럼으로 바로바로 바뀐값을 반영시키려면 다른 합성 값으로 감싸야 한다.

```js
function foo(wrapper) {
  wrapper.a = 42;
}

var obj = {
  a: 2
};

foo(obj);

obj.a; // 42
```

```js
function foo(x) {
  x = x + 1;
  x; //3
}

var a = 2;
var b = new Number(a);

foo(b);
console.log(b);
```

```js
function foo(x) {
  console.log(typeof x); //object
  x = x + 1;
  console.log(typeof x); // number
  x; //3
}

var a = 2;
var b = new Number(a);

foo(b);
console.log(b); // Number {2}
```

- 원시값은 불변이다. 따라서 원시값 2를 가진 `Number`객체가 있다면, 이와 동일한 객체(Number)가 다른 원시값을 가지도록 변경할 수 없다. 단 새로운 다른값을 넣은 별개의 `Number` 객체를 생성할 수는 있다.
- `x = x + 1`에서 `x`는 자동으로 객체에서 언박싱되어 `x`는 공유된 레퍼런스에서 `Number` 객체로 교모하게 바뀌고 `x`의 값은 3이 된다.
- 따라서 바깥의 b는 원시 값 2를 씌운, 변경되지 않는/불변의 원본 `Number` 객체를 참조한다.
- 손수 객체 래퍼(obj)나 원시값을 쓰는게 좋다.

## 1.6 정리하기

- 자바스크립트 배열은 모든 타입의 값을 숫자로 인덱싱한 집합
- 문자열은 일종의 '유사배열'이므로 주의하고 숫자는 '정수'와 '부동소수점'으로 이루어져있다.
- `null`은 `null`타임 하나고 `undefined`도 `undefined`하나이다.
- 변수에 할당된 값이 없다면 `undefined`값이 기본값
- 숫자에는 `NaN, +Infinity, -Infinity, -0`같은 특수 값이 있다.
- 원시값은 값-복사, 합성값(배열, 함수 등 객체)는 레퍼런스-복사에 의해 값이 할당/전달된다.
- 자바스크립트의 레퍼런스는 또 다른 변수/레퍼런스가 아닌 오직 자신의 값만을 가리킨다.
