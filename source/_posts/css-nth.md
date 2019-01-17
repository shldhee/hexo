---
title: CSS - nth-child, nth-of-type 알아보기
date: 2019-01-17 17:59:22
categories: CSS
tags: 
  - CSS
  - SELECTOR
  - NTH-CHILD
  - NTH-OF-TYPE
thumbnail:
---

# CSS - nth-child, nth-of-type

-   특정 순서를 선택하고 싶을때 `nth-child, nth-of-type` 사용한다.

## **`element:nth-child(n)`**

-   부모의 n번째 자식을 찾고 해당 `element` 선택
-   해당 `element`가 아니면 선택되지 않는다.
-   중간 중간 다른 `element`들이 있으면 모두 자식으로 선택되어 자식의 n번째를 찾는다.

## **`element:nth-of-type(n)`**

-   부모의 n번째 해당 `element` 선택
-   중간 중간 다른 `element`들이 있어도 모두 자식으로 선택되지 않고 해당 `element` 만 선택되어 n번째를 찾는다.

### 예제

#### 자식이 `<p></p>` 2개 일때

```css
<style>
  p:nth-child(2)  {  color: red;  }
  p:nth-of-type(2)  {  color: red;  }
</style>
```
```html
<section>
  <p>Little</p>
  <p>Piggy</p>    <!-- 이 부분을 선택하고 싶다 -->
</section>
```

-   `p:nth-child(2)` 는 부모의 2번째 자식을 찾고 해당 `element`가 `<p></p>`여야 한다.
-   `p:nth-of-type(2)`는 부모의 자식들 중 `element`가 `<p></p>` 중에서 2번째 `p`를 선택한다.
-   현재 `<p></p>`는 2개 있으므로 둘 다 선택된다.

![nth1](/images/CSS/nth/nth1.png)

#### 자식이 `<h1></h1>`1개이고 `<p></p>` 2개 일때

``` css
<style>
  p:nth-child(2)  {  color: red;  }  /* Now incorrect */
  p:nth-of-type(2)  {  color: red;  }  /* Still works */
</style>
```
```html
<section>
  <h1>Words</h1>
  <p>Little</p>
  <p>Piggy</p>    <!-- 이 부분을 선택하고 싶다 -->
</section>
```

-   `p:nth-child(2)` 는 부모의 2번째 자식(`<p>Little</p>`)을 찾고 해당 `element`가 `<p></p>`이므로 선택된다.
-   `p:nth-of-type(2)`는 부모의 자식들 중 `element`가 `<p></p>` 중에서 2번째 `p`를 선택한다.

![nth2](/images/CSS/nth/nth2.png)
![nth3](/images/CSS/nth/nth3.png)

#### 정리

-   `nth-of-type`을 사용하는 것이 더 직관적이고 편한 것 같다. 우선 구조가 변경(태그 추가 및 삭제)되도 적용이 가능한 점이 좋아보인다.
-   CSS 관련된 다른 선택자들은 아래 참고 사이트를 참조해주세요.

##### 참고

<https://css-tricks.com/pseudo-class-selectors/>
<https://css-tricks.com/the-difference-between-nth-child-and-nth-of-type/>
