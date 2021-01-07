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
- **API** : Swipper, Kakao Map, Kakao Login, SMTP, 학과 정보
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
<br>
<a href="https://www.erdcloud.com/d/FEwvHLJTa9j6xwYT2" target="_blank">MusicStage ERD(정리)</a>
<br>
<a href="https://www.erdcloud.com/d/bioA6Ecp33mEh8qZP" target="_blank">MusicStage ERD(설명)</a>


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

 ### 로그인 후 메인 페이지

![MusicStage_MemberMainPage](https://user-images.githubusercontent.com/64412357/103880221-2d8bc180-511c-11eb-8d3d-0ce7ced72511.png)

- 로그인 후에는 소셜 게시판(Feed 보기) 페이지로 이동한다.
- 왼쪽 상단에 사이드바 메뉴 버튼을 통해 Home, 소식, 팔로우, 보관함으로 이동할 수 있고, 로그인 회원이 팔로우한 회원 목록이 나탄나다.
- 상단 네비게이션바 가운데 검색바를 이용해 게시글 또는 회원을 검색할 수 있다.
- 상단 네비게이션바 우측의 아이콘을 클릭해 게시글 작성, 채팅, 알림 메세지, My Menu 기능을 이용할 수 있다.
- 게시글 목록 상단에는 회원가입 시 설정했던 관심사가 나와 같거나 비슷한 회원들의 프로필을 띄워준다.

<br>

### 전문가 등록

![MusicStage_RegisterPro](https://user-images.githubusercontent.com/64412357/103884673-3f706300-5122-11eb-9fc2-05acae848f38.png)

<br>

- 전문가 등록 요청 후 관리자의 승인을 통해 전문가 회원이 되면 보다 더 많은 서비스를 이용할 수 있다.
- 학과 정보 API를 이용하여 학력 조회 및 작성을 보다 편리하게 할 수 있다.
- 학력, 경력, 자격증 등을 증빙할 수 있는 파일을 업로드 할 수 있다.

<br>

### Stage
| MyStage | YouStage |
|:--------:|:--------:|
|![MusicStage_MyStagePage](https://user-images.githubusercontent.com/64412357/103860670-5fdaf600-50ff-11eb-8f29-e568cc751ee0.png)|![MusicStage_YouStagePage](https://user-images.githubusercontent.com/64412357/103860673-61a4b980-50ff-11eb-9a8a-807b9bac0984.png)|

- MyStage와 YouStage는 회원이 올린 게시글을 모아볼 수 있는 공간이다.
- 상단에 닉네임, 게시물 개수, 팔로워·팔로잉 수, 자기소개 글이 표시된다.
- 전문가 여부에 따라 닉네임 옆에 전문가를 상징하는 로고가 나타나고, 자기소개 글 상단에 전문가 등록시 작성했던 프로필이 나타난다.
- MyStage의 경우 계정관리, 팔로워/팔로우 목록 조회를 할 수 있고, YouStage의 경우 메세지 보내기, 팔로우 요청·취소할 수 있다.
- 네 가지 카테고리별 게시글을 조회할 수 있다.

<br>

### 커뮤니티
| Feed 보기 | Board 보기 |
|:--------:|:--------:|
|![MusicStage_Feed](https://user-images.githubusercontent.com/64412357/103871159-0e873280-5110-11eb-8f31-074698f37cc9.png)|![MusicStage_Board](https://user-images.githubusercontent.com/64412357/103871164-0fb85f80-5110-11eb-99cd-e3ba4d8810b1.png)|

<br>

- 게시판은 소셜, 찾아요, 컬럼, 리뷰 네개로 구성되어 있고, 버튼을 클릭하여 게시판별 게시글을 조회할 수 있다.
- 게시글 보기는 Feed 보기, Board 보기, Modal 보기, 상세 보기로 나뉘어져 있으며, 우측의 Filter를 클릭하여 Feed 보기, Board 보기를 선택할 수 있다.

<br>

**Modal 보기**

![MusicStage_Modal](https://user-images.githubusercontent.com/64412357/103873457-2ad89e80-5113-11eb-907c-495130126ab8.png)

<br>

- Feed 보기에서 게시글 클릭 시 Modal 보기로 넘어가며, Modal 보기에서 상세보기 클릭 시 상세보기 페이지로 넘어간다.
- Feed 보기, Modal 보기에서 좋아요, 댓글, 대댓글, 메세지 보내기, 게시물 저장 기능을 이용할 수 있고, 슬라이드 기능을 통해 해당 게시글의 이미지, 비디오, 오디오 파일들을 보거나 재생시킬 수 있다.

<br>

| 상세보기 상단 | 상세보기 하단 |
|:------------:|:------------:|
|![MusicStage_DetailTop](https://user-images.githubusercontent.com/64412357/103873462-2c09cb80-5113-11eb-897d-01d4ecea58ba.png)|![MusicStage_DetailBottom](https://user-images.githubusercontent.com/64412357/103873463-2ca26200-5113-11eb-8151-0872af702de4.png)|

<br>

- 상세보기 페이지에서는 Feed 보기와 Modal 보기에서 표시되지 않는 게시글의 모든 내용을 확인할 수 있다.

<br>

**검색 필터**
| 뷰 | 찾아요 | 칼럼 | 리뷰 |
|:---:|:----:|:----:|:----:|
|![MusicStage_FilterView](https://user-images.githubusercontent.com/64412357/103874823-fcf45980-5114-11eb-932a-6e227faafe00.png)|![MusicStage_FilterSearch](https://user-images.githubusercontent.com/64412357/103874822-fc5bc300-5114-11eb-9e13-e44ee2482388.png)|![MusicStage_FilterColumn](https://user-images.githubusercontent.com/64412357/103874817-fbc32c80-5114-11eb-8991-f5ccf34ff64a.png)|![MusicStage_FilterReview](https://user-images.githubusercontent.com/64412357/103874343-62941600-5114-11eb-90ce-b7eee5fff730.png)|

<br>

- 게시판별 검색 필터를 이용하여 원하는 게시물을 검색할 수 있다.

<br>

### 게시글 작성
| 제목·내용·썸네일 | 이미지 파일 |
|:--------------:|:-----------:|
|![MusicStage_BoardWrite1](https://user-images.githubusercontent.com/64412357/103882753-9cb6e500-511f-11eb-8c30-429c1de822ce.png)|![MusicStage_BoardWrite2](https://user-images.githubusercontent.com/64412357/103882748-9aed2180-511f-11eb-9c85-9229661e8e5f.png)|

| 오디오·비디오 파일 | 선택 사항 |
|:----------------:|:---------:|
|![MusicStage_BoardWrite3](https://user-images.githubusercontent.com/64412357/103882755-9cb6e500-511f-11eb-8be7-ed1d68396837.png)|![MusicStage_BoardWrite4](https://user-images.githubusercontent.com/64412357/103882757-9d4f7b80-511f-11eb-99ec-a84ec09f9c36.png)|

- 제목, 카테고리 설정 아래부분에 첨부한 썸네일과 내용 등 작성된 글의 미리보기가 실시간으로 제공된다.
- 이미지, 오디오, 비디오 파일을 여러개 첨부할 수 있다. 
- 선택사항으로 커리큘럼, 장소, 제공형식 등을 추가로 입력할 수 있다.
- 장소 입력시 카카오 맵 API를 이용하여 원하는 장소를 검색, 표시할 수 있다.

<br>

### 알림
| 시스템 알림 | 게시물 알림 | 알림 상세보기 |
|:----------:|:----------:|:------------:|
|![MusicStage_SystemAlarm](https://user-images.githubusercontent.com/64412357/103868829-c9adcc80-510c-11eb-848a-a00b49eeb66e.png)|![MusicStage_SocialAlarm](https://user-images.githubusercontent.com/64412357/103868826-c9adcc80-510c-11eb-8283-db6a3d72a9b6.png)|![MusicStage_AlarmDetail](https://user-images.githubusercontent.com/64412357/103868822-c7e40900-510c-11eb-99d7-7b20aa17cd18.png)|

**푸쉬 알림** <br>
![MusicStage_PushAlarm](https://user-images.githubusercontent.com/64412357/103868825-c9153600-510c-11eb-91b3-29f0e9b06009.png) <br>

- 네비게이션 바의 알림 아이콘을 클릭하면 시스템 알림과 소셜 알림을 확인할 수 있다. 
- 알림 아이콘 옆에는 확인하지 않은 알림의 숫자가 표시된다. 
- 온라인 시 알림이 발생하면 브라우저 푸쉬 알림을 받을 수 있다.
- 알림 클릭 시 시스템 알림의 경우 알림 상세보기 페이지로, 게시물 알림의 경우 게시글 또는 회원의 Stage로 이동한다.

### 채팅
![MusicStage_Chatting](https://user-images.githubusercontent.com/64412357/103868824-c87c9f80-510c-11eb-9e64-fdda97ec0b01.png)

- 웹소켓을 통해 실시간으로 채팅이 가능하고, 채팅 메세지는 메세지 전송 성공 시 실시간으로 DB에 저장된다.
- 채팅창의 왼쪽은 상대방의 메시지가, 오른쪽에는 사용자의 메시지가 표시된다. 
- 채팅 목록에는 가장 마지막으로 받은 혹은 보낸 메시지의 내용과 시간이 표시되고, 읽지 않은 메시지의 개수가 표시된다.

<br>

### 관리자
![MusicStage_Admin](https://user-images.githubusercontent.com/64412357/103885170-f240c100-5122-11eb-8a94-63646114978a.png)

- 관리자는 관리자의 권한으로 관리자 페이지에서 공지사항 등록, 계정·게시글 신고 처리, 전문가·게시글 등록 요청 처리를 할 수 있다.
- 관리자는 신고 내용을 확인하고 합당한 신고 여부에 따라서 신고 요청을 수락, 거절 할 수 있으며, 수락 시에 회원이나 게시글에 신고 횟수를 더하여 일정 개수 초과시 게시글이나 회원에 대한 패널티를 부과할 수 있다.
- 공지사항 작성시 접속중인 모든 회원에게, 요청 처리 완료시 해당 회원에게 실시간 푸쉬 알림이 발생한다.

<br>

