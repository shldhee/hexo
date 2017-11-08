---
title: JSP-1강 웹프로그래밍이란?
date: 2017-11-08 22:06:15
categories: java
tags: java, jsp, servlet, tomcat, apache, jdk
thumbnail:
---

# JSP

## 1강

### 웹프로그래밍이란?

* 웹프로그래밍 : 웹어플리케이션을 구현하는 행위
* 웹어플리케이션 : 웹을 기반으로 작동되는 프로그램
* 웹 : 1개 이상의 사이트가 연결되어 있는 인터넷 서비스의 한가지 형태
* 인터넷 : 1개 이상의 네트워크가 연결되어 있는 형태

---

* 프로토콜 : 네크워크상에서 약속한 통신규약(Http, FTP, SMTP(메일), POP(메일), DHCP)
* IP : 네트워크상에서 컴퓨터를 식별할 수 있는 주소
* DNS : IP주소를 인간이 쉽게 외우도록 맵핑한 문자열
* Port : IP주소가 컴퓨터를 식별할 수 있게 해준다면, Port번호는 해당컴퓨터의 구동되고 있는 프로그램을 구분할 수 있는 번호

`http://www.sba.seoul.kr:80/kr/index`
`http(프로토콜)://www.sba.seoul.kr(컴퓨터주소(DNS를통해 IP주소로 변경):80(port)/kr/index(Information path)`

---

### JAVA웹

JAVA플랫폼(J2EE)

* JSP(Java Server Page) : HTML파일 내에 JAVA언어를 삽입한 문서
* Servlet(Server Applet) : JAVA언어로 이루어진 웹프로그래밍 문서

컨테이너 안에 컴포넌트
컴포넌트(JSP, Servlet, HTML 문서등의 웹 어플리케이션을 구현하기 위한 구성요소)가 모여 컨테이너를 만든다.

---

### 웹프로그램의 동작

* 웹서버 : 클라이언트의 요청에 의해 정보를 제공해 주는 서버 (Aphach, IIS) 별도의 구현이 필요한 로직이 있을 경우 웹어플리케이션 서버에 요청
* 웹브라우저 : 웹서버에 정보를 요청하고, 웹서버로부터 정보를 받는 매개체. 이때 HTTP 프로토콜을 사용함.

클라이언트 ->(request) 웹서버 -> 웹어플리케이션 서버(WAS) -> 데이터베이스 -> WAS -> 웹서버 ->(response) 클라이언트

웹서버에서 바로 클라이언트 응답가능하지만 이미지, 게시판 등 불러오기 위해 WAS의 요청 WAS도 자료가 필요하므로 DB에 요청 후 응답 처리
