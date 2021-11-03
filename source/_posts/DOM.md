---
title: JavaScript - DOM이란?
date: 2018-04-08 00:54:31
categories: javascript
tags:
  - javascript
  - DOM
  - browser
thumbnail:
redirect: https://hasudoki.tistory.com/entry/JavaScript-DOM%EC%9D%B4%EB%9E%80-1
---

- DOM 이란 뭘까? HTML 태그? JavaScript로 접근 하는 것? Node? 트리구조? 등등 용어만 들었을뿐 정확히 설명을 못했다.(이것뿐만 아니라 공부한 모든것들을 설명할 수가 없어 차근차근 정리해볼 계획이다.)

## DOM 정의(MDN 참조)

- 문서 객체 모델(Document Object Model)은 JavaScript Node 개체의 계층화된 트리다.
- DOM은 HTML, XML 문서의 프로그래밍 API이다.
- 문서의 구조화된 표현을 제공하며 프로그래밍 언어가 DOM 구조에 접근할 수 있는 방법을 제공한다.
- 문서 구조, 스타일, 내용 등을 변경할 수 있게 돕는다.

## DOM이 뭘까?

- HTML 파일이 쓴 것들이 DOM인가? No
- 소스보기에 보여지는 것들이 DOM인가? No
- 크롬 개발자 도구에서 보여주는 것들이 DOM인가? Yes
- 개발자도구나 HTML 파일이나 같은데.....? **하지만 종종 다른 경우가 있다.**

### HTML과 DOM이 다른 점이 뭘까?

- HTML 작성할때 실수(필요한 TAG를 생략 한 경우 등)를 브라우저가 고쳐준다.
- 예를 들면 HTML 작성시 `<table>` 안에 `<tbody>`없이 `<tr>,<th>`를 사용한 경우 개발자 도구를 보면 `<tbody>`가 존재한다.
- `<tbody>`는 바로 DOM에 있을것 이다.
- 따라서 CSS, JavaScript으로 찾을 수 있고 스타일을 변경하거나 조작이 가능하다.

[<img title="big size image" src="https://raw.githubusercontent.com/shldhee/shldhee.github.io/master/images/JavaScript/dom-1.png">](https://raw.githubusercontent.com/shldhee/shldhee.github.io/master/images/JavaScript/dom-1.png)

### JavaScript vs DOM

- JavaScript는 브라우저가 읽고 사용하는 언어입니다.
- 하지만 DOM은 그 일이 일어나는 곳입니다.
- 사실은 JavaScript의 것라고 생각하는 것들이 정확히는 **DOM API**이다.
- 예를 들면, element에 있는 mouseenter event를 확인하기 위해 JavaScript를 사용한다.
- element는 사실 DOM node이다. DOM node의 DOM 속성을 통해 해당 event listener를 연결합니다.
- event가 발생할때 DOM node는 event를 내보낸다(발생시킨다).
  - node란 어떤 객체의 구성 요소를 의미한다.

![dom-2](https://raw.githubusercontent.com/shldhee/shldhee.github.io/master/images/JavaScript/dom-2.jpg)

### 결론

- JavaScript는 문법, 언어이며 DOM API가 없는 브라우저 밖에서 완전히 사용이 가능하다.(Node.js)
- DOM은 브라우저내에서 작동하고 존재한다.
- DOM은 파싱 된 HTML이라고 말할 수 있습니다.
- 웹페이지가 로드되면 브라우저는 DOM 페이지을 만든다.
- 내 생각으로는 브라우저내에 DOM이 존재하고 HTML 문서를 해석한 다음 생성되는 것이 DOM이다. 한줄로 정의하고 싶은데 쉽지 않다.

**참조**

- [CSS-Trick:What is the DOM?](https://css-tricks.com/dom/)
