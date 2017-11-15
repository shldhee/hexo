---
title: JSP-5강 Servlet 본격적으로 살펴보기
date: 2017-11-16 00:17:56
categories: java
tags: java, jsp, servlet, tomcat, apache, jdk
thumbnail:
---

# JSP

## 5강. Servlet 본격적으로 살펴보기

### 프로젝트 만들기

Servlet은 JAVA언어를 사용하여 웹프로그램을 제작하는 것입니다. 간단한 Servlet 프로젝트를 만들어 보면서 전체적인 구조(흐름)을 살펴보도록 합니다.

* Servlet클래스는 HttpServlet 클래스를 상속 받음.
HttpServlet -> GenericServlet(abstract) -> Servlet(Interface)

``` java
public class HelloWorld extends HttpServlet { // HttpServlet 클래스를 상속
  private static final long serialVersionUID = 1L;
}
```

* 요청처리객체 및 응답처리객체를 톰캣에서 받음.
클라이언트 -> request WAS -> DB
클라이언트 <- response WAS <- DB

``` java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 System.out.println("hello");

 response.setContentType("text/html"); // 응답을 html형태로 반환
 PrintWriter writer = response.getWriter(); // 웹브라우제 출력하기 위한 스트림, JSP는 바로 태그 사용가능하지만 Servlet은 JAVA언어이므로 response객체를 이용

 writer.println("<html>");
 writer.println("<head>");
 writer.println("</head>");
 writer.println("<body>");
 writer.println("<h1>Hi</h1>");
 writer.println("</body>");
 writer.println("</html>");

 writer.close();
}
```

* 요청처리객체 : HttpServletRequest request,
* 응답처리객체 : HttpServletResponse response

#### Servlet 특징

* 동적 웹어플리케이션 컴포넌트
* .java 확장자

#### GET & POST 방식

* GET방식 : URL값으로 정보가 전송되어 보안에 약함
  - form tag method 속성값 : get
* POST방식 : header를 이용해 정보가 전송되어 보안에 강함
  - form tag method 속성값 : header

``` java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
```

### doGet()

* html내 form태그의 method속성이 get일 경우 호출 됩니다.
* 웹브라우저의 주소창을 이용하여 servlet을 요청한 경우에도 호출 됩니다.

doGet메소드는 매개변수로 HttpServletRequest와 HttpServletResponse를 받습니다.

웹브라우저  ->요청 doGet()
doGet() ->응답 웹브라우저

doGet()
* HttpServletRequest : 클라이언트의 요청 처리 객체
* HttpServletReponse : 클라이언트에게 응답 처리 객체

``` java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  response.setContentType("text/html; charset=euc-kr");
  PrintWriter writer = response.getWriter();
}
```

* 출력스트림의 println() 메소드를 이용하여 출력하면, 웹브라우저에 출력 됩니다.

``` java
writer.println("<html>");
writer.println("<head>");
writer.println("</head>");
writer.println("<body>");
writer.println("<h1>Hi</h1>");
writer.println("</body>");
writer.println("</html>");
```

1. Dynamic Web Proejct
2. new - Servlet(mapping)
3. 실습
``` java
System.out.println("hello");

response.setContentType("text/html"); // 응답을 html형태로 반환
PrintWriter writer = response.getWriter(); // 웹브라우제 출력하기 위한 스트림, JSP는 바로 태그 사용가능하지만 Servlet은 JAVA언어이므로 response객체를 이용

writer.println("<html>");
writer.println("<head>");
writer.println("</head>");
writer.println("<body>");
writer.println("<h1>Hi</h1>");
writer.println("</body>");
writer.println("</html>");

writer.close();
```
4. Run

### doPost

* html내 form태그의 method속성이 post일 경우 호출됩니다.

``` html
<form action="PostMethod" method="post">
  <input type="submit" value="post">
</form>
```

``` java
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  System.out.println("doPost");

  response.setContentType("text/html; charset=euc-kr");
  PrintWriter writer = response.getWriter();

  writer.println("<html>");
  writer.println("<head>");
  writer.println("</head>");
  writer.println("<body>");
  writer.println("<h1>Hi Post 방식</h1>");
  writer.println("</body>");
  writer.println("</html>");
}
```

WebContent안에 html파일

### 컨텍스트 패스(Context Path)
WAS(Web Application Server)에서 웹어플리케이션을 구분하기 위한 path입니다.
이클립스에서 프로젝트를 생성하면, 자동으로 server.xml에 추가 됩니다.

server,xml
Context
