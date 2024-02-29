# google_tasks_clone
---
해당 프로젝트는 애플리케이션 개발의 기초 구조와 Flutter 코딩 연습 및 Figma 디자인을 통한
Google사의 Tasks 의 클론 코딩 프로젝트입니다.

# 학습 기간
- 23.11 ~ 24.02

# 개발 환경
- Flutter
- Figma


# 학습 내용
[b] Flutter

- Tasks의 앱의 기초 UI 작성
- Tasks의 앱의 정렬 기능
- Tasks의 앱의 Task 생성 및 삭제
- Task의 즐겨찾기 토글 위젯

[b] Figma

- Tasks의 앱의 UI 분석
- 분석 결과를 토대로 아이콘 제작 및 기초 UI 작성


# 기능 구현



# 개인 메모
---
## GIT, GITHUB
- git: 코드 관리 툴
- github: git서버중 가장 잘 나가는 서버, MS것

깃으로 프로젝트를 관리하는 방법으로 크게 2가지가 있다.
1. gitflow
2. githubflow

### gitflow

- main,master: 안정 브랜치
- develop: 개발 브랜치
- feature/*: 기능별로 만들어지는 브랜치
- release/*: 릴리즈별로 만들어지는 브랜치
- hotfix/*: 핫픽스별로 만들어지는 브랜치

### develop 브랜치를 만드는 법
git switch main
git checkout -b develop main

### feature 브랜치를 만드는 법
git switch develop
git checkout -b feature/task-read develop


### 상태를 확인하기 위한 커맨드들
git log --oneline
git status
git branch

### 스테이징 작업대에 넣는 커맨드
git add .
git add {file_path}

### 작업대에서 내리는법
git reset

### 커밋하는 법

```
git commit
# vim 이나 vi 에디터에서 다음 커맨드를 활용
# i, :wq
```

### 다른 브랜치를 머지하는 법

git swich develop
git merge feture/task-read
git branch -d feature/task-read

### 로컬 작업을 remote로 올리는법
git push origin -u develop
git pull origin develop

git push origin -u feature/task-read

# 활성브래친가 develop인 상태에서
git switch develop
git checkout -b release/0.1.0
git switch develop
git merge release/0.1.0
git switch main
git merge release/0.1.0

sourcetree
- UI, release, main

### ssh

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=windows

git remote -vv
git remote set-url origin {ssh주소}

git fetch --prune
git commit --amend
git push -f origin main

### 결론

해당 프로젝트는 작업을 main 브랜치에다 할것


### 애플리케이션 계층

- repository
    - `TaskRepository`
- domain/model/entity
    - `TaskModel`
- controller
    - `TaskProvider`
- presentation/ui
    - `TaskCard`

TaskCard -> TaskProvider -> TaskModel
                         -> TaskRepostiory
            - get, change, save

TaskCard <- (Observerable pattern)
 provider reference
 reference.listen()

TaskProvider
 - notifierListeners();


 ### UI/UX 디자인

 - https://www.figma.com/file/hlEaJTacxmVu78J0MaFjnG/Google-Task-UI-Design?type=design&node-id=0%3A1&mode=design&t=CowAhwQ1bN5NuQCF-1
