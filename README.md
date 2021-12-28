# 카페

## 🔧실행 환경

- Spring Tool Suite 4.12.1.
- Apache Tomcat v8.5
- Oracle

## ⚙ 기본 설정

### Oracle에 사용자 및 시퀀스 추가

1. System 계정으로 접속하여 'BOARD'라는 이름의 사용자를 추가한다.

2. 'BOARD' 사용자로 데이터베이스에 접속한다.

3. [파일] > [열기] 에서 다운 받은 'boardSchema.ddl'을 클릭한다.

4. F5키를 클릭하여 스크립트를 실행한다.
   
    <img width="400" alt="테이블" src="https://user-images.githubusercontent.com/53552121/147574380-a39d2154-678f-4cf6-8691-7ef126bd7dde.PNG">
   
5. 게시물 시퀀스와 댓글 시퀀스를 생성한다.
    ```sql
    CREATE SEQUENCE  "BOARD"."POST_SEQ" 
    MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1
    START WITH 1 NOCACHE NOORDER  NOCYCLE;

    CREATE SEQUENCE  "BOARD"."COMMENTS_SEQ"
    MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1
    START WITH 1 NOCACHE NOORDER  NOCYCLE;

    COMMIT;
    ```

### Oracle 및 MyBatis 설정 추가

1. pom.xml 파일 하단에 아래 소스를 추가
    ```xml
    <!-- JDBC Template -->
      <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-jdbc</artifactId>
      <version>4.1.4.RELEASE</version>
      </dependency>
      
      <!-- MyBatis -->  
      <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis</artifactId>
        <version>3.2.8</version>
      </dependency>
      <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis-spring</artifactId>
        <version>1.2.2</version>
      </dependency>
    ```
2. servlet-context.xml
    ```xml
    <!-- JDBC Template -->
    <beans:bean name="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
      <beans:property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>
      <beans:property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
      <beans:property name="username" value="BOARD"/>
      <beans:property name="password" value="1234"/>
    </beans:bean>
    
    <beans:bean name="template" class="org.springframework.jdbc.core.JdbcTemplate">
      <beans:property name="dataSource" ref="dataSource"/>
    </beans:bean>
    
    <!-- MyBatis-->
    <beans:bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
      <beans:property name="dataSource" ref="dataSource"></beans:property>
      <beans:property name="mapperLocations" value="classpath:com/project/spring_board/dao/mapper/*.xml"></beans:property>
    </beans:bean>
    
    <beans:bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
      <beans:constructor-arg index="0" ref="sqlSessionFactory"></beans:constructor-arg>
    </beans:bean>
    ```

### 한글 처리(UTF-8 설정)

1. web.xml에 인코딩 필터 추가
    ```xml
    <!-- UTF-8 한글 설정 -->
    <filter>
      <filter-name>encodingFilter</filter-name>
      <filter-class>
        org.springframework.web.filter.CharacterEncodingFilter
      </filter-class>
      <init-param>
        <param-name>encoding</param-name>
        <param-value>UTF-8</param-value>
      </init-param>
      <init-param>
        <param-name>forceEncoding</param-name>
        <param-value>true</param-value>
      </init-param>
    </filter>
    <filter-mapping>
      <filter-name>encodingFilter</filter-name>
      <url-pattern>/*</url-pattern>
    </filter-mapping>
    ```

2. Apache Tomcat의 server.xml에 URIEncoding 속성 추가
    ```xml
    <Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8181" protocol="HTTP/1.1" redirectPort="8443"/>
    ```

3. Windows > Preferences > 'enco' 검색 > Worksapce, CSS, HTML, JSP, XML files 인코딩 변경
   
## ✔ 기능 설명

### 회원 관리

1. 세션 처리

    - `HttpSession`을 이용하여 세션 설정

2. 회원가입 시 아이디 중복 확인
   
    - pom.xml에 AJAX 설정
      ```xml
      <!-- jackson-databind -->
      <dependency>
        <groupId>com.fasterxml.jackson.core</groupId>
        <artifactId>jackson-databind</artifactId>
        <version>2.9.8</version>
      </dependency>

      <!-- ajax -->
      <dependency>
        <groupId>org.codehaus.jackson</groupId>
        <artifactId>jackson-mapper-asl</artifactId>
        <version>1.9.13</version>
      </dependency>
      ```

    - 뷰 페이지가 아닌 응답값을 그대로 반환하기 위해 `@ResponseBody` 어노테이션 사용

### 게시글

1. 파일 업로드 및 다운로드
    - 설정
        1. pom.xml에 commons-fileupload API 이용을 위한 파일 업로드 설정
            ```xml
              <!-- Commons File Upload  -->
              <dependency>
                <groupId>commons-fileupload</groupId>
                <artifactId>commons-fileupload</artifactId>
                <version>1.3.2</version>
              </dependency>

              <!-- MultipartHttpServletRequest -->
              <dependency>
                <groupId>commons-io</groupId>
                <artifactId>commons-io</artifactId>
                <version>2.5</version>
              </dependency>
            ```
        2. servlet-context.xml에 Commons Multipart Resolver 설정
            ```xml
            <!-- Commons Multipart Resolver 설정 -->
            <beans:bean id="multipartResolver"  class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
              <!-- 최대 업로드 가능한 바이트 크기 -->
                <beans:property name="maxUploadSize" value="52428800" />
                <!-- 디스크에 임시 파일을 생성하기 전에 메모리에 보관할 수 있는 최대 바이트 크기 -->
                <beans:property name="maxInMemorySize" value="1000000" />
                <!-- 요청을 파싱할 때 사용할 캐릭터 인코딩 -->
                <beans:property name="defaultEncoding" value="utf-8" />
            </beans:bean>
            ```

    - 파일 업로드
        1. jsp 파일 `<form>` 태그에 enctype 속성값을 'multipart/form-data'로 지정
        2. 중복 방지를 위한 UUID 적용
        3. 날짜별 디렉토리 생성
  
    - 파일 다운로드
        1. `FileUtils.readFileToByteArray()` 메소드로 실제 저장된 파일을 읽어 byte 배열로 변환
        2. `HttpServletResponse` 객체로 HTTP 응답 객체를 가져온다.

2. 페이징 처리 및 검색

3. 댓글
    - 기능: 댓글 조회, 작성, 수정, 삭제, 신고

		
## ▶ 실행

- 실행: `http://localhost:[포트번호]/spring_board/post/post_list`
  
    ![board_project](https://user-images.githubusercontent.com/53552121/147574456-56d2182b-3a50-4e7e-bb77-cd748c481482.gif)

## 📂 폴더 구조

```
spring_board
 ┣ src/main/java
 ┃ ┣ com.project.spring_board.controller
 ┃ ┃ ┃ ┗ MemberController.java
 ┃ ┃ ┗ PostController.java
 ┃ ┣ com.project.spring_board.dao
 ┃ ┃ ┗ CommentsDao.java
 ┃ ┃ ┗ MemberDao.java
 ┃ ┃ ┗ PostDao.java
 ┃ ┣ com.project.spring_board.dao.mapper
 ┃ ┃ ┗ CommentsDao.xml
 ┃ ┃ ┗ MemberDao.xml
 ┃ ┃ ┗ PostDao.xml
 ┃ ┣ com.project.spring_board.dto
 ┃ ┃ ┗ CommentsDto.java
 ┃ ┃ ┗ Criteria.java
 ┃ ┃ ┗ MemberDto.java
 ┃ ┃ ┗ PageMaker.java
 ┃ ┃ ┗ PostDto.java
 ┃ ┃ ┗ SearchCriteria.java
 ┃ ┣ com.project.spring_board.service
 ┃ ┃ ┗ CommentsService.java
 ┃ ┃ ┗ CommentsServiceImpl.java
 ┃ ┃ ┗ MemberService.java
 ┃ ┃ ┗ MemberServiceImpl.java
 ┃ ┃ ┗ PostService.java
 ┃ ┃ ┗ PostServiceImpl.java
 ┣ src
 ┃ ┣ main
 ┃ ┃ ┗ webapp
 ┃ ┃ ┃ ┗ WEB-INF
 ┃ ┃ ┃ ┃ ┗ spring
 ┃ ┃ ┃ ┃ ┃ ┗ appServlet
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ servlet-context.xml
 ┃ ┃ ┃ ┃ ┗ views
 ┃ ┃ ┃ ┃ ┃ ┗ comment
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ received_comm.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ member
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ login_view.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ member_main.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ register_view.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ update_view.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ post
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ post_content.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ post_list.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ post_update_view.jsp
 ┃ ┗ ┗ ┗ ┗ ┗ ┗ post_write_view.jsp
 ┗ pom.xml
```