---
title: React - React-Router
date: 2018-04-02 00:34:08
categories: react
tags:
  - react
  - route
  - javascript
thumbnail:
---

> 리액트 라우터는 여러개의 페이지를 가진 애플리케이션을 만들 때 사용합니다.
> 리액트 라우터를 사용하면 애플리캐이션의 페이지 이동, 페이지 전체 이동, URL을 기반으로 페이지의 일부만 다시 작성하게 하는 세부적인 설정 등이 가능합니다.

## react-router 설치

`npm install --save react-router-dom`

## react-router 설명

- `exact` 주어진 경로와 정확히 일치 해야 설정한 컴포넌트를 보여준다.
	- `/about`으로 접속시 Home 컴포넌트와 About 컴포넌트가 같이 보인다.(`/`, `/about` 둘다 포함되기 때문)

``` js
<div>
  <Route exact path="/" component={Home}/>
  //<Route path="/" component={Home}/>
  <Route path="/about" component={About}/>
</div>
```

- `Switch`를 사용하면 정상적이지 않은 URL 접근을 감지할 수 있다.
	- 아래 코드에서 `/user/:id`,`/about/:id`에 매치되지 않은 경우 `UserList` 컴포넌트를 보여준다.

``` js
<Switch>
  <Route path='/user/:id' component={UserCard} />
  <Route path='/about/:id' component={About} />
  <Route component={UserList} />
</Switch>
```

- `<Route path='/user/:id' component={UserCard} />` path에 `/user/:id`처럼 경로를 지정하면 컴포넌트(여기선 `UserCard`)의 `this.props.match.params.id`로 `id`의 값을 구할 수 있다.
- `<Link to="path">...</Link>`는 `<a href="path">...</a>`로 작성해도 문제 없지만 `<Link>`는 브라우저의 이력(`history`객체)과 관련된 세부적인 설정을 할 수 있다.

*Route - CustomerApp.js*
``` js
import React, { Component } from 'react';
import {
  BrowserRouter as Router,
  Route,
  Link,
  Switch
} from 'react-router-dom';

const users = [
  {id: 1, name:"토티", info: "AS로마"},
  {id: 2, name:"델피에로", info: "유벤투스"},
  {id: 3, name:"다비즈", info: "유벤투스"},
];

const CustomerApp = () => (
  <Router>
    <div style={{margin: 20}}>
      <div>
        <Switch>
          <Route path='/user/:id' component={UserCard} />
          <Route component={UserList} />
        </Switch>
      </div>
    </div>
  </Router>
)

class UserList extends Component {
  render() {
    const ulist = users.map(e => (
      <li key={e.id}>
        <Link to = {'/user/' + e.id }>{e.name}</Link>
      </li>
    ))

    return (
       <ul>{ulist}</ul>
    )
  }
}

class UserCard extends Component {
  render () {
    const {params} = this.props.match;
    console.log(typeof params.id); // string
    const id = parseInt(params.id, 10);
    console.log(typeof id); // number
    const user = users.filter(e => e.id === id)[0];
    return (
      <div>
        <div>{id}: {user.name} - {user.info}</div>
        <div><Link to='/'>-> 뒤로가기</Link></div>
      </div>
    )
  }
}

export default CustomerApp;
```

## 결론

- 리액트 라우터를 사용하면 간단하게 화면 전환을 구현할 수 있다.
- 리액트 라우터는 고정 헤더와 푸터를 지정할 수 있다.
- URL 매개변수를 지정해서 매개변수를 기반으로 컴포넌트의 내용을 변경할 수 있습니다.
