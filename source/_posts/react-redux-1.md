---
title: React - react-redux-1(reducer, connect, mapStateToProps)
date: 2017-12-21 01:08:37
categories: react
tags: react, redux, reducer, container, component, mapStateToProps, connect
thumbnail:
---

# REACT

## 리듀서

#### 1. 리듀서 생성

#### 2. 어플리케이션과 연결

*reducer_books.js*
``` js
  {
    books: [{title:"harryPotter"},{title:'Javascript'}], // Books Reducer
    activeBook: {title:'Javascript: The Good parts'} // activeBook Reducer
  }
```

* `books` : key 스테이트의 이름
* `[{title:"harryPotter"},{title:'Javascript'}]` : value 리듀서 그 자체

*index.js*
``` js
const rootReducer = combineReducers({
  books: booksReducer
})
```

* state 매핑
* `books` : `books`
* `booksReducer` : `[{title:"harryPotter"},{title:'Javascript'}]`

*BooksReducer 불러오기*
`import BooksReducer from './reducer_books`

## 리액트-리덕스

#### 1. 리액트와 리덕스를 연결하는 라이브러리 react-redux

* 리액트 컴포넌트에서 스테이트를 주입할 때 이 브릿지를 이용할 수 있다.
* 이 데이터를 컴포넌트로 주입시키는 것을 **컨테이너라고** 한다.
* 컨테이너는 리덕스에 의해 만들어지는 스테이트를 직접 접근하는 컴포넌트라는 것을 기억하세요.
* 가장 상위에 있는 컴포넌트가 리덕스 스테이트를 접근하는 컨테이너로 지정한다.
`App>BookList+DetailBook` 일 때 App은 DOM 컴포넌트이므로 BookList, DetailBook 컴포넌트가 컨테이너 역할을 한다.

#### 2. redux state 적용 컨테이너

*mapStateToProps sample*
``` js
import { connect } from react-redux;

console.log(this.props.asdf); // -> 1234

function mapStateToProps(state) { // state는 BookList, activeBook 배열을 가지고 있다.
  // 반환되는 것들은 Booklist에서 Props를 사용된다. this.props
  return {
    asdf: '1234'
  }
}
```

*using mapStateToProps, reducer_books.js 참조*
``` js
import { connect } from react-redux;

console.log(this.props.asdf); // -> 1234

function mapStateToProps(state) { // state는 BookList, activeBook 배열을 가지고 있다.
  // 반환되는 것들은 Booklist에서 Props를 사용된다. this.props
  return {
    books: state.books;
  }
}
```

* 본문에서 `this.props.books` 사용하기 위해 `books` 프로퍼티를 리턴한다.
* `state.books`는 state는 *reducer_books.js* 에 있는 리턴 배열
* `connect`함수는 이 컴포넌트를 자겨오고 `mapStateToProps`를 가져와 컨테이너를 반환한다.
* `mapStateToProps`가 react-redux를 연결하는 접착제역할을 한다.

``` js
export default connect(mapStateToProps)(BookList);
```

1. state가 바뀔때마다 리 렌더링
2. `connect` state 바뀔때마다 반환되는 객체가 `this.props`로 할당

#### 구조 및 전체 소스

* containers/book-list.js
* reducers/index.js
* reducers/reducer_books.js

*index.js*
``` js
import { combineReducers } from 'redux';
import booksReducer from './reducer_books';

const rootReducer = combineReducers({
  books: booksReducer,
});

export default rootReducer;
```

*reducer_books.js*
``` js
export default function() {
  return [
    { title: 'Javascript: The Good Parts'},
    { title: 'Javascript: ES6'},
    { title: 'Javascript: React'},
    { title: 'Javascript: CookBook'},
  ]
}
```

*book-list.js*
``` js
import React, { Component } from 'react';
import { connect } from 'react-redux';

class BookList extends Component {
  renderList() {
    return this.props.books.map((book) =>
      return (
        <li key={book.title} className="list-group-item">{book.title}</li>
      );
    });
  }

  render() {
    return (
      <ul className="list-group col-sm-4">{this.renderList()}</ul>
    )
  }
}

function mapStateToProps(state) {
  return {
    books: state.books;
  }
}

export default connect(mapStateToProps)(BookList);
```
