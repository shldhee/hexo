---
title: JSP-2강 환경 설정
date: 2017-11-08 22:09:19
categories: java
tags: java, jsp, servlet, tomcat, apache, jdk
thumbnail: /images/jsp.png

---

# JSP

## 2강

### JDK 설치

1. http://java.sun.com 접속
2. 최신 버전 다운로드 및 설치
3. PATH 세팅(환경변수설정)

### 이클립스 설치

1. http://www.eclipse.org 접속
2. 최신 버전 다운로드 및 설치


### Tomcat 설치

1. http://tomcat.apache.org 접속
2. Tomcat 7.0 zip 다운
3. 압축 해제 설치 필요할 필요 업삳.

### Tomcat 설정

1. 이클립스 열기
2. window-Show view-Server Tab open
3. Click
4. Apache Tomcat v7.0
5. Tomcat 압축 해제한 경로 연결

### 서버 설정

1. 더블 클릭
2. 서버 위치 Server Locations - 2번째(Use Tomcat installation)
3. 서버 옵션 Publish module contexts to separate XML files 체크
4. 포트 Port 8080 -> 8181 (나중에 오라클에서 8080 사용하기 때문)

### 서버 구동

1. 서버 실행 Start the Server
2. http://localhost:8181/
3. 서버 스탑 Stop the Server
