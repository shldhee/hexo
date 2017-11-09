---
title: JSP-4강 Servlet 맛보기
date: 2017-11-09 23:17:56
categories: java
tags: java, jsp, servlet, tomcat, apache, jdk
thumbnail:
---

# JSP

## 4강. Servlet 맛보기

### Servlet 문서 작성 하기

#### Servlet 특징

* 동적 웹어플리케이션 컴포넌트
* .java 확장자
* 클라이언트의 요청에 동적으로 작동하고, 응답은 html을 이용
* java thread이용하여 동작(이게 제일 중요)
* MVC패턴에서 Controller로 이용됨.(3강 참조)

1. 프로젝트 생성(3강 참조)
1. Servlet파일 생성(package, class, superclass 기입)
1. URL Mappings(닉네임 정해주기 접근할 네임)
1. next - finish

* Java Resources에 존재
* doGet, doPost 존재

``` java
protected void doGet() {
  System.out.println("Hellow");
}
// 콘솔창 찍힘
// Url 확인
```

---

### 맵핑

`기존 경로 :  http://localhost:8181/helloworld/servlet/com.javalec.ex.HelloWorld`
`URL맵핑 경로 : http://localhost:8181/helloworld/HWorld`

* 보안 측면
* 편리 측면

---

### webxml에 서블릿 맵핑

`WebContent/WEB-INF/web.xml`

`<servlet-name>` : 임의의 이름을 만들어 줍니다.
`<servlet-class>` : 매핑할 클래스 파일명을 패키지명을 포함하여 정확하게 입력 합니다.
`<url-pattern>` : servlet-class의 클래스를 매핑할 임의의 이름을 입력합니다. 주위할 점은 '/'로 시작해야 합니다.

``` java
<servlet>
  <servlet-name>helloworld</servlet-name>
  <servlet-class>com.javalec.ex.HelloWorld</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>helloworld</servlet-name>
  <url-pattern>/hw</url-pattern>
</servlet-mapping>
```

---

### 어노테이션을 이용한 서블릿 맵핑

* 자바파일에서 실행

``` java
@WebServlet("/HWorld") // 어노테이션
```
