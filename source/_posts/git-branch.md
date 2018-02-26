---
title: git-branch
date: 2018-02-20 13:07:07
categories: git
tags:
    - git
    - branch
thumbnail:
---

# branch

## branch 명령어

* `git branch --decorate`하면 현재 어떤 브랜치를 사용중인지 확인 가능
* `git checkout branch명`하면 워킹디렉토리 파일 내용도 변경
* `git log --oneline --decorate --graph --all`
  * oneline : 한줄로 보여주기
  * decorate : 현재 사용중인 브랜치 보여주기
  * graph : 그래프 보여주기
  * all : 모든 브랜치 log 보여주기

### branch merge

```git
git checkout master
git merge hotfix

Fast-forward
master 에서 hotfix 브랜치를 만들었다
master - c2
hotfix - c2였다가 커밋후 c3로 변경
따라서 c2->c3순서이므로 별도의 Merge과정 없이 최신커밋으로 이동
이것이 바로 Fast-forward
```

* hotfix 브랜치를 master 브랜치랑 merge
* `git branch -d hotfix` merge 후 필요 없으니 브랜치 삭제

```git
C2<-C4(matser)
C2<-C3<-C5(issue53)
```

```git
git checkout master
git merge issue53

Fast-forward 메시지가 안뜬다.
이 경우는 3-way Merge를 한다.
C2(공통조상), C4(master), C5(issue53)
3개라서 3wayMerge인가..
```

* Fast-forward 처럼 최신 커밋으로 이동하는게 아니라 합친 결과를 새로운 커밋으로 만들고 브랜치가 그 커밋으로 이동한다.

```git
C4<-C6(master)
C5<-C6(issue53)
```

* 마무리는 `git branch -d issue53`

### branch merge conflict

* master 브랜치, issue53 브랜치에서 같은 파일을 수정한 경우 충돌

```text
<<<<<<< HEAD
yahoyahoyahoyahoyahoyahoyah:
=======
112312312112312312112312312
>>>>>>> issue53
```

* ======= 위쪽은 HEAD 버전(master)
* 아래쪽은 issue53
* 해결방법은 새로 작성, 위쪽(HEAD), 아래쪽(issue53) 중 선택해야 한다.
* 수정 후 <<< ==== >>> 이런 부분들은 삭제
* 해결 후 `git add`
* Merge 한 것을 커밋 `git commit` 하면 아래 메시지 나온다.

```git
Merge branch 'issue53'

Confilcts:
  test.rb

//...
```

* commit message 를 상세히 기록한다.

### manage branch

* `git branch` : 브랜치의 목록 보여줌
* `git branch -v` : 마지맛 커밋 메시지도 함께 보여줌
* `git branch --merged` : 머지 된 브랜치 보여줌

```git
git branch --merged
  issue53
* master
```

* `*`기호가 붙어 있지 않은 브랜치는 `git branch -d`로 삭제해도 되는 브랜치다. 그 이유는 이미 다른 브랜치와 Merge 했기 때문
* `git branch --no-merged` : 머지 되지 않은 브랜치 보여줌

```git
git branch --merged
  testing
```

* `testing`브랜치는 아직 Merge 하지 않은 커밋을 담고 있기 때문에 `git branch -d`로 삭제되지 않는다.

### Colaborator

* Collaborator 가 아니면 fork 떠서 자기스페이스로 복사한 후 push -> 원래 저장소로 보내기 이것이 바로 Pull request 라고 한다.
* Collaborator 면 해당 repo 에서 바로 push 가능
