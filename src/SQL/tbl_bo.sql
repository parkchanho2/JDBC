-- tbl_board10테이블 생성
    create table tbl_board10(
    bno number(38) primary key, -- 게시판 번호,
    bname varchar2(50) not null , -- 글쓴이
    btitle varchar2(200) not null, -- 글제목
    bcont varchar2(4000) not null,
    bhit number(38) default 0 -- ㄷdefault 0 제약조건을 설정하면 해당 컬럼에 굳이 레코드를 저장하지 않아도 기본값 0이 저장됨.
    );
    
    select * from tbl_board10 order by bno desc;  --bno 번호를 기준으로 내림차순 정렬해서 큰숫자 번호값 부터 먼저 정렬한다.
    
    -- bno_seq10 번호 발생기 시원스 생성
    create sequence bno_seq10
    start with 1 -- 1부터 시작
    increment by 1 -- 1씩 증가
    nocache; -- 임시 메모리를 사용하지 않는다는 코드
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    