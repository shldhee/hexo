---
title: 입사에 필요한 JS 기술 #1
date: 2018-02-21 17:14:37
categories: javascript
tags:
  - javascript
  - js
  - toString
  - valueOf
thumbnail:
---

# [입사에 필요한 JS 기술 #1](https://www.youtube.com/watch?v=VYqPToE_GxM&t=1326s)

1. if(2 == \_\_\_ ) 중에 밑줄에 값이 들어올때 true 가 아닌 경우?
   1. Number(2)
   1. Number(2).valueOf()
   1. Number(2).toString()
   1. 1.valueOf()
   1. 1 .toString()

## valueOf, toString

> valueOf : 어떤 객체를 원시값으로 변환하는 메소드
> toString : The toString() 은 문자열을 반환하는 object 의 대표적인 방법이다. toString() 함수는 어떠한 객체를 나타내는 문자열을 return 한다.

### `==`,`===` 와 어떻게 다른가?

#### 기본형, 참조형

* 기본형 : String, Number, null, undefined, boolean, symbol
* 참조형 : 나머지(object, array 등)

##### 기본형

* 형과 값이 일치

```js
1 === 1;
// 형은 숫자, 값은 1 일치해야 true

1 === '1';
// 숫자 === 문자열, 형이 틀리다. false
```

##### 참조형

```js
  [1,2] === [1,2] // false
  // 레퍼런스가 다르다.
  //

  a = { a: 1 };
  b = a;
  b.a = 2;
  a.a = ?? // ??는 2
```

* 참조형은 `b===a` 이런경우에만 `true`가 된다.(레퍼런스 일치할때만!)

##### `==` 동치

* 동치는 일치를 포함한다.
* 일치하는 것은 동치다. 일치가 `true`면 동치도 `true`
* 동치지만 일치 하지 않는 것!

##### 문제풀이

* 두 값이 일치
* undefined == null
* 0 == '0'
* true == '1'
* [2,3] == '2,3' valueOf -> toString

```js
null == undefined; // true , 동치

0 == '0'; // '0'을 숫자로 변경, 따라서 일치하니깐 true 0 === 0

true == '1'; // true.toString -> 'true'라서 false인것 같지만 true랑 '1'을 둘다 숫자로 변경, 동치이므로 1===1 true

0 == 'a'; // 'a' -> NaN로 변경

(NaN == NaN[(2, 3)]) == // 같지 않다.
  '2,3'; // 참조형, 기본형 비교 우선 참조형을 기본형으로 변경 [2.3].valueOf 수행하면 자기 자신이 나온다. 기본형이 아니니 다시 [2,3].toString 실행 "2,3" 으로 변경 "2,3" === "2,3" true
```

```js
1.toString(); // Syntax Error
1 .toString(); // "1"
```

* 숫자 뒤에 "." 다음에는 무조건 숫자로 나와야 한다.
* 1.23.toString()은 "1.23"으로 나온다. 소수 점 뒤에 점이 나오는 숫자가 없으므로 객체로 만들어 toString() 실행하게 한다.
* 1 .toString(); 뒤에 소수부가 없어 인정하게 된다. 따라서 toString() 사용가능

**정답 : 4**

참고 동영상 : [입사에 필요한 JS 기술 #1](https://www.youtube.com/watch?v=VYqPToE_GxM&t=1326s)
