-- 오라클 한줄 주석문 기호

/*오라클 한줄 이상 주석문 기호 -- */

-- guestbook 테이블 생성
create table guest(
gno number(38) primary key -- 방명록 번호
,gnome varchar2(20) not null --글쓴이
,gitile varchar2(200) not null --글제목
,gcont varchar2(4000) not null --글내용
,gdate date --등록날짜
);

-- 생성된 guest테이블 컬럼 목록을 확인
select * from guest; -- *는 모든 컬럼목록을 확인 한다.


/*
1. number(38): 최대 자리수가 38자까지 정수숫자를 저장할 수 있는 정수 숫자형
2. varchar2: 가변문자형
3. data: 날짜 타입

제약조건: 테이블 컬럼에 저장되는 자료에 어떠한 제한을 가하는 것을 말한다.
제약조건 종류
1. primary key(기본키): 중복 자료 저장 금지, null 저장금지
2. not null: 중복 자료 저장은 허용. null 저장금지

각 컬럼에 저장된 한행의 자료 집합을 레코드라고 한다.

오라클 시퀀스 객체의 특징
 1. 번호 발생기 (시퀀스는 정수 숫자형으로 선언되고 기본키 제약조건으로 선언된 컬럼(필드)에 사용된다.
 2. 중복 자료가 없고, null없는 컬럼에 저장되는 정수 번호값으로 활용하면 된다.
 
*/
-- guno_seq 시퀀스 객체를 생성
create sequence guno_seq
start with 1 -- 1부터 시작하라는 옵션 
increment by 1 -- 1씩 증가하라는 옵션
nocache; -- 임시 메모리를 사용하지 않겠다는 옵션

-- 생성된 guno_seq 시퀀스 번호값 확인

select guno_seq.nextval as "시퀀스 번호값" from dual;

/*시퀀스 명.nextval로 다음 시퀀스 번호값을 확인
   as "시퀀스 번호값" 쿼라문은 검색되는 임시 컬럼 별칭명을 만들 때 사용한다. 실제 오라클에 해당 컬럼 별칭명이 생기는 것은 아니다.
   dual은 오라클 설치시 설치되는 임시 테이블로 오라클 연산, 함수, 시퀀스 등 값을 확인하는 용도로 사용된다.   
   
*/

/* DMS조작어 중에서 레코드 저장문인 INSERT 문법구조
   insert into 테이블명( 컬럼목록) values(값);
   
   insert문에서 컬럼 목록을 생략하면 테이블 생성시 (create table)생성되는 컬럼순번대로 자료가 저장되고, 전체 컬럼에 데이터가 저장된다.
   즉 전체 컬럼(필드)에 레코드 저장시에는 컬럼목록을 생략함.
    
*/

insert into guest values(guno_seq.nextval, '홍길동', '방명록제목01', '방명록내용01',sysdate);
-- 쿼리문(SQL)에서 문자열은 작은 따옴표'' 로 처리하고, SQL문은 JAVA언어 하고는 다르게 영문대소문자를 구분하지 않음

insert into guest values(guno_seq.nextval,'이순신', '방명록제목02', '방명록내용02', sysdate);

-- sysdate 는 오라클 날짜함수이다
-- 오라클 날짜함수 확인쿼리문은 select sysdate ad"오늘날짜" FROM DUAL;

select sysdate as "오늘날짜" as dual;


/* 레코드 검색문 문법형식
    select 컬럼목록 from 테이블명 where 조건식 order by 기준필드명 asc; 
    
    order by: 정렬문 asc문은 생략가능 하고 오름차순 정렬을 뜻한다.
    
    오름 차순 정렬규칙
    1. 숫자는 작은 숫자부터 먼저 정렬된다.
    2. 한글은 가나다순 으로 정렬된다.
    3. 영어는 알파벳 순으로 정렬된다.
    
    select * from 테이블명 order by 기준컬럼(필드명) 명 desc;
    *는 모든 컬럼을 뜻하고 desc문은 내림차순을 뜻한다.
    
    내림차순 정렬규칙
    1. 한글은 가나다 역순,영어는 알파벳 역순 으로 정렬됨
    2. 숫자는 큰숫자부터 먼저 정렬된다
    

*/ 

select * from guest order by gno desc; -- 큰숫자 부터 먼저 정렬됨.

/* 레코드 수정문 문법 형식
    update 테이블명 set 컬럼명 = 수정할 값, 필드명 = 변경할 값 ... where 조건식;


*/
ALTER TABLE guest RENAME COLUMN gnome TO gname;

update guest set gtitle = '수정제목', gcont = '수정내용' where gno = 5;

select gno, gname, gtitle, gcont from guest where gno = 5; -- 5번 레코드를 기준으로 번호, 글쓴이, 글제목, 글내용을 확인

/* 레코드 삭제문 형식문법
    delete from 테이블명;
    where 조건식이 없으면 전체 레코드행이 삭제된다. 주의
    
    delete from 테이블명 where 조건식;
    조건에 맞는 레코드만 삭제됨
*/
  -- 문제1) 시퀀스를 사용하지 않고 다음과 같은 레코드를 저장하시오.
   -- 21.'을지문덕', '제목21', '내용21', sysdate 
    insert into guest values(21,'을지문덕', '제목21', '내용21', sysdate);
    --문제2)
    --21번을 기준으로 전체 컬럼의 한 행의 레코드를 검색하는 쿼리문을 만들어보자.
    select * from guest where gno = 21;
    --문제3)
    --21번을 기준으로 이름을 '강감찬', 제목을 '수정제목21', 내용 '수정내용21' 레코드로 변경해보자 
    update guest set gname = '강감찬', gtitle ='수정제목21', gcont = '수정내용21' where  gno = 21;







