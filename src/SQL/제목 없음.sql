-- join 실습을 위한 테이블 생성
    create table dept05(
    deptno number(38) primary key, -- 부서번호
    dname varchar2(100) not null --부서명1
);
    
    insert into dept05 values(10, '관리부');
    insert into dept05 values(20, '영업부');
    insert into dept05 values(30, '연구부');
    
    select * from dept05 order by deptno asc;
    
    create table emp05(
    empno int primary key -- 부서명
    , ename varchar(20) -- 사원명
    , job varchar2(50) -- 직종
    , sal int -- 급여
    , comm int -- 보너스
    , deptno number(38) -- 부서번호
);
    insert into emp05 values(11,'홍길동', '관리사원', 1500, 0, 10);
    insert into emp05 values(12, '이순신', '영업사원', 1200, 120, 20);
    insert into emp05 values(13,'강감찬', '영업사원', 1300, 130, 20);
    insert into emp05 values(14,'신사임당', '연구원', 3000, 300, 30);
    
--문제) 사원 번호를 기준으로 오름차순 정렬되게 해서 숫자가 작은 사원번호 먼저 출력되게 해보시오
    select * from emp05 ORDER by empno asc; -- asc문 생략가능
    
-- cross join : 공통 컬럼 기준이 없다. 
    select * from dept05, emp05;
    
-- Equi 조인 검색을 위한 테이블 생성
-- room 테이블 생성
    create table room(
    roomno number(38) primary key, -- 강의실 호수
    roomname varchar2(50) not null --강의실 담당 쌤
);

    insert into room values(404, '홍길동 쌤');
    insert into room values(405, '이순신 쌤');
    
    select * from room order by roomno asc;
    
    commit;
    
-- 학생 테이블 생성
    create table st03(
    stno number(38) primary key, -- 학번
    stname varchar2(20), --학생 이름
    roomno number(38) --강의실 호수
);
    
    insert into st03 values(101, '유관순', 404);
    insert into st03 values(102, '을지문덕', 404);
    insert into st03 values(103, '신사임당', 405);
    commit;
    
    select * from st03 order by stno;
    
-- roomno 공통 컬럼을 기준으로 Equi 조인검색
    select * from room, st03 where room.roomno = st03.roomno;
    
-- 신사임당 학생의 Equi 조인검색
    select stno,stname,room.roomno,roomname from room,st03 where room.roomno = st03.roomno and stname = '신사임당';
    
--문제) like 검색 연산자를 사용해서 '덕' 학생이 포함된 Equi 조인검색을 해보자
   select * from room, st03 where room.roomno = st03.roomno and stname like '%덕%'; -- %와일드 카드 문자는 하나이상의 임의의 모르는 문자와 매핑 대응 

-- 신으로 시작하는 학생 Equi 조인검색: 테이블명 별칭 사용
  select stno, stname, r.roomno, roomname  from room r, st03 s where r.roomno = s.roomno and stname like '신%';  
    
-- Non Equi 조인검색을 실습을 위한 급여등급 테이블 salgrade 생성
    create table salgrade(
    grade number(38) primary key, -- 급여등급
    LOSAL number(38) not null, -- 최소급여
    HISAL number(38) not null --최대급여
);
    insert into salgrade values(1, 700, 1200);
    insert into salgrade values(2, 1201, 1400);
    insert into salgrade values(3, 1401, 3000);
    
    commit;
    
    select * from salgrade order by grade asc;
    select * from emp05 order by empno asc;
    
-- where 조건절에서 특정 범위내의 조인 조건으로 검색하는 기법인 Non Equi 조인문 
    select ename, sal, grade from emp05 , salgrade where sal between LOSAL and HISAL;
    select e.ename, e.sal, s.grade from emp05 e, salgrade s where e.sal >= s.LOSAL AND e.sal <= s.hisal;
    
-- 3개 테이블 조인 검색 -> Equi조인 + Non Equi 조인
    select  e.ename, e.sal, s.grade, d.deptno, d.dname from emp05 e, dept05 d, salgrade s where e.deptno = d.deptno and e.sal between s.LOSAL and s.HISAL;
    
-- 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    