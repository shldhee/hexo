---
title: JSP-3강 JSP 맛보기
date: 2017-11-09 23:17:52
categories: java
tags: java, jsp, servlet, tomcat, apache, jdk
thumbnail:
---

# JSP

## 3강. JSP 맛보기

### JSP 문서 작성 하기

#### JSP특징

* 동적 JSP 정적은 HTML
* 동적 웹어플리케이션 컴포넌트
* .jsp 확장자
* 클라이언트의 요청에 동적으로 작동하고, 응답은 html을 이용
* jsp는 서블릿으로 변환되어 실행
* MVC패턴에서 View로 이용됨.

**홈페이지(Client) -> (request)Controller(servlet) -> Model(DB 게시판 이미지 등 작업 후) -> Controller -> View(JSP) ->(response) 홈페이지 적용**

* Controller에서 Model에서 적합한 컴포넌트에 전달 후 다시 받고 해당 View에 전달

1. 프로젝트 생성(Dynamic Web Project)
2. 첫글자 소문자
3. Target runtime : Apache Tomcat v7.0
4. Dynamic web module version : 3.0
5. next -> next -> next ->Generate web.xml deployment descriptor check
6. WebContent 폴더에서 jsp파일 선택
7. Hello World 실행 Server Run

파일 오른쪽 클릭 후 Run as로 실행
jsp작성 -> html 문서로 출력

---

### JSP 아키텍처

#### 아키텍처

1. .jsp file(helloworld.jsp) 생성
Java파일로 변환(톰캣 서버)
1. Java file(helloworld_jsp.java)
컴파일(컴파일러)
1. class file(helloworld_jsp.class)
브라우저 응답

#### 생성 파일 위치

tomcat/work/Catalina/localhost/proejctFolder/org/apache/jsp
