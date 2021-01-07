# :musical_note: MusicStage (음악 통합 커뮤니티) 
코로나 19로 인하여 뮤지션의 무대가 줄어들고, 온라인에서 활동할 수 있는 공간이 필요해졌다. 기존의 커뮤니티 사이트의 단점을 보완하여 소셜 기반의 게시판과 메신저를 이용한 자유로운 소통, 관심 분야에 따른 친구 매칭 서비스, 친숙한 SNS UI를 차용한 감각 있는 디자인을 통해 이용자들에게 편의성과 실용성을 모두 만족시킬 수 있는 사이트를 만들고자 하였다.

### 개발 환경
___
- **Operating System** : Window OS, MAC OS
- **Server** : Apache Tomcat 9.0
- **Database** : Oracle Database 18c
- **Development Tool** : Eclipse, Spring Tools Suite 4, Visual Studio Code, sqlDeveloper version 19.2.1.247, Apache Maven
- **Development Language** :  Java, JavaScript, jQuery, HTML5, CSS3, SQL, JSTL
- **Framework** : Spring, Mybatis
- **Team Coop** : Github, ERDCloud, kakaoOven
- **API** : Swipper, Kakao Map, Kakao Login, SMTP
- **Technologies used** : WebSocket, jQuery, Ajax, Push Notification


### 구현 기능
___
- **회원** : 회원가입(일반 회원가입, 카카오 회원가입 api, 카카오 맵 api), 회원정보 보기, 회원정보 수정(프로필 사진 등록/수정/삭제), 회원탈퇴, 로그인(일반 로그인, 카카오 로그인 api), 로그아웃, 계정 찾기(이름, 이메일 이용, Gmail api), 선호하는 관심사, 팔로잉, 스테이지(회원 상세 페이지 - 회원의 게시물 모아보기)

- **게시판** : 게시글 리스트 조회 및 검색(카테고리, 필터 별 검색), 게시글 피드형식/보드형식 조회, 게시글 등록/수정/삭제, 댓글과 대댓글 등록/수정/삭제, 이미지/동영상/오디오 파일 업로드

- **실시간 채팅** : 회원 간 실시간 채팅 및 브라우저 알림, 채팅 내용 DB 저장

- **푸쉬 알림** : 댓글, 팔로잉, 좋아요, 전문가 등록요청, 게시글 등록요청, 회원/게시글 신고 처리에 대한 실시간 푸쉬 알림 및 알림 메세지 DB 저장

- **관리자** : 공지사항 등록, 전문가 등록 요청 승인/거부, 게시글 등록 요청 승인/거부, 회원/게시글 신고 승인/거부 및 패널티 처리

- **메인페이지** : 네비게이션 바, 검색 바, 카테고리 퀵 메뉴, 배너 인기서비스 목록(슬라이드 이미지)

### DB 설계
___
![MusicStage ERD](https://user-images.githubusercontent.com/64412357/103772776-6325a180-506d-11eb-8407-85ec57c1eab0.png)
https://www.erdcloud.com/d/FEwvHLJTa9j6xwYT2
https://www.erdcloud.com/d/bioA6Ecp33mEh8qZP

 - **게시판 관련 테이블** : 네 가지의 게시판을 ‘게시판 카테고리’ 컬럼으로 구분하여 하나의 테이블로 구성하였다. 모든 카테고리에서 사용하는 컬럼은 ‘NOT NULL’ 제약조건을 걸어 필수적으로 입력 값을 받도록 하였고, 게시판에 따라서 선택적으로 사용 가능한 컬럼들은 ‘Nullable’로 처리하였다. 이 외에 다른 목적으로 사용되는 게시판과 첨부파일은 ‘게시판 테이블’, ‘첨부파일 테이블’을 한 쌍으로 하여 각각 테이블을 따로 만들어 관리하였다.
 - **첨부파일 테이블** : 첨부파일의 확장자에 따라서 파일 종류를 ‘IMAGE’, ‘AUDIO’, ‘VIDEO’로 구분하여 관리하였고, ‘FILE_THUMBNAIL’ 컬럼을 두어 썸네일 파일을 구분하였다.
 - **알림 관련 테이블** : 푸쉬 알림을 DB에 기록하기 위해 알림이 발생하는 모든 테이블의 기본키를 외래키로 설정하여 제약조건을 설정하였고, ‘ALARM_TYPE’ 컬럼으로 알림이 발생한 테이블과 알림 클릭 시의 액션을 구분하였다. 
 - **채팅 관련 테이블** : ‘CHATTING_ROOM’ 테이블을 이용하여 채팅방을 생성하고, ‘JOIN_ROOM’ 테이블을 통해서 채팅방을 구분하여 관리한다. 1대1 채팅 시스템이기 때문에 채팅방 생성 시 ‘JOIN_ROOM’ 테이블에는 채팅에 참여하는 ‘본인’과 ‘상대방’의 정보가 동일한 ‘CHATROOM_ID’로 입력되어 두 개의 행이 생성된다.


## 페이지
 ### 메인 페이지

![MusicStage_MainPage](https://user-images.githubusercontent.com/64412357/103777831-ca931f80-5074-11eb-98d7-3b8abf08290c.png)

- 로그인 전 메인페이지에서는 4개의 퀵메뉴를 클릭하여 각각의 게시판으로 이동할 수 있고, 키워드 검색을 통해 찾고자 하는 게시물을 검색할 수 있다.
- 하단의 STAGE 인기 서비스에 사이트에서 제공하는 서비스들이 나열되어 있고 클릭 시에 해당 서비스에 대한 내용을 자세히 볼 수 있다.
- 화면 우측 상단에는 로그인과 회원가입 버튼이 있고, 사용자는 로그인을 통해 보다 다양한 서비스를 이용할 수 있다.

<br>

 ### 로그인

![MusicStage_LoginPage](https://user-images.githubusercontent.com/64412357/103778820-2316ec80-5076-11eb-9159-1197ef9edb5b.png)
 
- 로그인, 일반 회원가입, 카카오 회원가입이 가능하다.
- 회원 이름과 이메일을 통해 아이디를 찾을 수 있고, 아이디와 이메일을 통해 임시 비밀번호를 부여받을 수 있다.

<br>

 ### 회원가입

| 약관 동의 | 회원 가입 | 관심사 선택 |
|:--------:|:--------:|:-----------:|
|<img src="https://user-images.githubusercontent.com/64412357/103780263-1b584780-5078-11eb-8cef-7e3cca5caa3a.png" width="350px" height="450px" alt="MusicStage_InsertMember1">|<img src="https://user-images.githubusercontent.com/64412357/103780268-1c897480-5078-11eb-8e0f-663ccc643183.png" width="350px" height="450px" alt="MusicStage_InsertMember2">|!<img src="https://user-images.githubusercontent.com/64412357/103783861-94599e00-507c-11eb-870b-6b2905b049c9.png" width="200px" height="200px" alt="MusicStage_Interests">|

1. 일반 회원가입, 카카오 회원가입 시 모두 약관 동의 후 회원가입이 진행된다.
2. 아이디, 비밀번호, 이메일, 휴대폰 등의 정보를 정해진 정규표현식에 맞게 작성해야하고, 아이디는 중복확인을 해야한다.
3. 일반 회원가입의 경우 이메일 인증을 해야 하고, 카카오 회원가입의 경우 이메일 인증 과정은 생략한다.
4. 마지막으로 4가지의 관심사를 설정하면 회원가입이 완료된다.

<br>

### Stage
MyStage YouStage

### 커뮤니티
Feed형식 Board형식

### 알림



### 채팅




