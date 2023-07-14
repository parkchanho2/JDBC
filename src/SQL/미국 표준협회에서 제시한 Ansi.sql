-- Ansi cross join, inner join 실습을 위한 테이블 생성
-- depart11 테이블 생성
    
    create table depar11(
    dept_code varchar2(20) primary key, --강의실 호수
    dept_name varchar2(50) not null --강의실 담당 선생님
);
    insert into depar11 values('401', '홍길동 쌤');
    insert into depar11 values('402', '이순신 쌤');
    
    select * from depar11 order by dept_code asc;
    
    create table studen11(
    st_no number(38) primary key,
    st_name varchar2(30) not null,
    st_gender varchar2(10),
    dept_code varchar2(20)
    );
    
    insert into studen11 values(11, '신사임당', '여', '401');
    insert into studen11 values(12, '홍길순', '여', '402');
    insert into studen11 values(13, '강감찬', '남', '402');
    
    select * from studen11 order by st_no asc;
    
-- Ansi cross join
    select * from depar11 cross join studen11;

-- on 조건절을 사영한 Ansi inner join
    select * from depar11 inner join studen11 on depar11.dept_code = studen11.dept_code;
    
--문제) dept_code 공통컬럼을 기준으로 한 on 조건절을 사용해서 강감찬  학생의 정보를 inner join 문으로 조인 검색 해 보자.
    select * from  depar11 d inner join studen11 s on d.dept_code = s.dept_code where s.st_name = '강감찬'; -- where 에 and도 가능
    
-- using 절문을 사용한 join문
    select st_no, st_name, st_gender, dept_code, dept_name from depar11 inner join studen11 using(dept_code);
    
-- Natural join
    select st_no, st_name, st_gender, dept_code, dept_name from depar11 natural join studen11;
 
-- outer join 실습을 위한 테이블 생성 
    create table dept21(
    deptno number(38) PRIMARY key, --부서번호
    dname varchar2(50) --부서명
    );
    
    insert into dept21 values(10,'ACCOUNTING');
    insert into dept21 values(20,'RESEARCH');
    
    select  * from dept21 order by deptno asc;
    
    commit;
    
    create table dept22 (
    deptno number(38) primary key, 
    dname varchar2(50)
    );

    insert into dept22 values(10,'ACCOUNTING');
    insert into dept22 values(30,'SALES');

    select * from dept22 order by deptno asc;
    
-- dept21 테이블에는 해당 자료가 있지만 dept22 테이블에는 20번 부서번호가 없다. 이런 경우 자료가 출력되지 않는 문제점을 해결하기 위해서 오른쪽에 기술된 dept22 테이블에 해당 자료가 없을때
-- 를 기준으로 ASNI left outer join 기법을 사용한다.
    select * from dept21 left outer join dept22 on dept21.deptno = dept22.deptno;
    
-- right outer join  공통컬림이 있다면 on 조건절 대신 using절문을 사용할 수 있다. 이런 경우 테이블명.컬럼명 형태가 아닌 컬럼명만 명시한다. 즉 테이블명이나 테이블명 별칭은 올 수가 없다.
    select * from dept21 right outer join dept22 using(deptno);
    
    
-- full outer join = left outer join + right outer join
    select * from dept21 full outer join dept22 using(deptno);
    

    


























