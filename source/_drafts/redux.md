---
title: redux
tags: react, redux, store, dispatch, subcribe
---

## 하나의 애플리케이션 안에는 하나의 스토어가 있습니다.
## 상태는 읽기전용입니다.
## 변화를 일으키는 함수, 리듀서는 순수한 함수여야 합니다.

* dispatch(action) => 리듀서 작동 => store의 state변경 => 변경된 state가 state를 subscribe하고 있는 컴포넌트에 전달

