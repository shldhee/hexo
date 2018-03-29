---
title: HTTP의 이해
date: 2018-03-30 00:16:54
categories: http
tags:
  - http
  - requrest
  - response
---

- 인터넷(Internet) : TCP/IP 기반의 네트워크가 전세계적으로 확대되어 하나로 연결된 네트워크들의 네트워크 (네트워크의 결합체)

## HTTP(Hypertext Transfer Protocol)란?

- HTTP는 서버와 클라이언트가 인터넷상에서 데이터를 주고 받기 위한 프로토콜(protocol)입니다.
- HTTP는 계속 발전하여 HTTP/2까지 등장

## HTTP 작동방식

- HTTP는 서버/클라이언트 모델을 따릅니다. 클라이언트가 요청하면 서버가 응답한다.
- 장점
	- 불특정 다수를 대상으로 하는 서비스에 적합
	- 클라이언트와 서버가 계속 연결된 형태가 아니므로 클라이언트와 서버간의 최대 연결수보다 훨씬 많은 요청와 응답을 처리할 수 있다.
- 단점
	- 연결을 끊어버리기 때문에, 클라이언트의 이전 상황을 알 수 없다.
	- 이러한 특징을 무상태(Stateless)라고 한다.
	- 이러한 특징 때문에 정보를 유지하기 위해서 Cookie와 같은 기술이 등장했다.

## URL

- URL(Uniform Resource Locator)
	- 인터넷 상의 자원의 위치
	- 특정 웹 서버의 특정파일에 접근하기 위한 경로 혹은 주소
``` html
http://www.suny.co.kr/docs/index.html
접근프로토콜://IP 주소 또는 도메인 이름/문서의 경로/문서 이름
```
- 하나의 물리적컴퓨터에는 여러개 소프트웨어 서버 작동 가능(각각 포트가 달라야 한다.)
###### ip는 집 주소 하나의 컴퓨터는 하나의 ip, 포트는 각각의 하나의 방 각 서버는 하나의 방을 차지

## HTTP 동작 순서

1. 클라이언트와 웹서버 연결(connect)
2. 클라이언트 요청(request)
        * HTTP 요청 메시지(요청 헤더, 요청 바디)
        * GET 방식은 요청 바디가 없다. 관련 자료들이 URI와 같이 넘겨진다.
3. 서버 응답(response)
        * HTTP 응답 메시지(응답 헤더, 응답 바디)
4. 연결 끊김(close)

![enter image description here](https://lh3.googleusercontent.com/P0nLbMawFwlLE2qXdIBbSnxWYEaE9M3ARDmKVB1puAEFIIOVyzIWtafQVcbo8VHFfcn5Fnn8r0-Y)


참조 : [부스트코스](http://www.edwith.org/boost-course/intro)
