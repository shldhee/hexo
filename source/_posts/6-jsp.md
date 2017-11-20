---
title: JSP-6강 Servlet 본격적으로 살펴보기-2
date: 2017-11-21 00:53:04
categories: java
tags: java, jsp, servlet, tomcat, apache, jdk
thumbnail:
---

# JSP

## 6강. Servlet 본격적으로 살펴보기-2

### Servlet 작동 순서

* 클라이언트에서 servlet요청이 들어 오면 서버에서는 servlet컨테이너를 만들고, 요청이 있을 때마다 스레드가 생성됩니다.

웹브라우저 -> 웹서버 -> 웹어플리케이션 서버 WAS -> Servlet 컨테이너(1. 스레드 생성, 2. Servlet 객체 생성)

### Servelt 라이프사이클(생명주기)

* Servlet의 사용도가 높은 이유는 빠른 응답 속도 때문입니다.
* Servlet의 최초 요청 시 객체가 만들어져 메모리에 로딩되고, 이후 요청 시에는 기존의 객체를 재활용하게 됩니다. 따라서 동작 속도가 빠릅니다.
* Servlet의 라이프사이클을 살펴 봅니다.

Servlet 객체생성(최초 한번) -> Init()호출(최초 한번) -> service(), doGet(), doPost() 호출 (요청시 매번) -> destroy() 호출 (마지막 한번) 자원해제: Servelt 수정, 서버 재가동 등등...

1. servlet 프로젝트 생성 예제 확인

### Servlet 선처리, 후처리

* Servlet의 라이프 사이클 중 `init()`과 `destroy()`메소드와 관련하여 선처리(init()전)와 후처리(destroy()후) 작업이 가능 합니다.

@ : url 매핑 어노테이션 

Servlet 객체 생성 -> 선처리: @PostConstruct -> Init()호출 -> service(), doGet(), doPost() -> destroy() 호출 -> 후처리: @PreDestroy
