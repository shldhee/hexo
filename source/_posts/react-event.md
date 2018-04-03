---
title: React - event binding
date: 2018-01-25 00:49:05
categories: react
tags:
  - react
  - create-react-app
  - state
  - event handler
thumbnail:
---

## React 이벤트

* 상태를 관리하면 컴포넌트 자체가 상태를 관리하는 값으로 기억해야 하므로 컴포넌트의 `state` 객체를 이용
* 상태 값 변경시에는 `setState()`를 이용(메서드 이용하여 값 변경시 `render()`메서드를 함께 호출해 컴포넌트를 재구성)
* 이벤트 등록 `<div onClick={clickHandler}>click Me</div>`
* 클릭 이벤트로 클래스의 메서드 호출 `this.clickHandler = this.clickHandler.bind(this)`
  * [React 에서의 바인딩(binding) 방법들](https://goo.gl/Hrpfpk)
  * [[ES6, react] 리액트에서 화살표 함수(arrow function)는 선택이 아닌 필수](https://goo.gl/Bd2VDB)
* 화살표 함수 사용시 함수 객체를 정의하면 함수 내부의 `this`가 변경되지 않는다.
  * `this.state.checked`라고 작성하면 클래스의 `staet.checked`를 나타낸다.

## React 로 이벤트를 만드는 방법

### 1. render() 메서드 내부에서 이벤트 핸들러 정의하기

```js
class Name extends React.Component {
  render() {
    const handler = e => alert('Hello');
    return <button onClick={handler}>Click</button>;
  }
}
```

* 가장 쉬운 방법
* `render()` 함수내에 같이 있으므로 `this`를 사용할 필요가 없다.

### 2. 클래스의 메서드로 정의하고, this 바인드하기

```js
class Name extends React.Component {
  constructor() {
    this.classhandler = this.classhandler.bind(this);
  }

  classhandler(e) {
    alert('Hello');
  }

  render() {
    return <button onClick={this.classhandler}>Click</button>;
  }
}
```

* 이벤트 핸들러가 여러줄이라면 1 번의 경우 `render()` 내부가 너무 복잡해진다.(렌더링시 느려질수도.....?)
* `bind()`메서드 사용

### 3. 클래스 메서드로 정의하고, 화살표 함수로 호출하기

```js
class Name extends React.Component {
  classHandler() {
    alert('Hello');
  }

  render() {
    return <button onClick={e => this.classHandler(e)}>Click</button>;
  }
}
```

* 2 번보다 `bind()` 메서드를 사용하지 않아 편리하다.
* 책에서 이걸 추천한다.

#### creat-react-app

* `npm install -g create-react-app`
* `create-react-app hello`
* `cd hello` -> `npm start`
* `npm run build` : build 폴더 생성, 다양한 압축 파일 생성
  * 이 생성파일들을 웹 브라우저에서 바로 실행이 안되게 보안이 되어있다.
  * 로컬 환경에서 빌드 확인 하려면 웹 서버가 필요
* `npm install -g serve` : 서버 실행시 필요한거 설치
* `serve -s build` : build 폴더에 있는것들 실행
