-- 회원가입 
create table member(
    id varchar2(50) primary key, 
    pw varchar2(50) not null, 
    name varchar2(20) not null, 
    gender varchar2(20), 
    email varchar2(50),
    reg date default sysdate
); 
desc member;
select * from member; 

-- 게시판 
create table board(
    num number primary key, 
    writer varchar2(50) not null, 
    subject varchar2(100) not null,
    email varchar2(100), 
    content varchar2(4000), 
    pw varchar2(100), 
    reg date default sysdate, 
    readcount number default 0
); 
-- 게시글 고유 번호로 적용할 시퀀스 생성 
create sequence board_seq nocache;

desc board;
select * from board; 
delete from board; 
commit;
select count(*) from board;

select * from board order by reg desc;

select * from board ;
where num >= 1
and num <= 10
order by reg desc; 

select B.* from
    (select rownum r, A.* from 
        (select * from board order by reg desc) A 
    ) B
where r >= 11 
and r <= 20; 


-- 댓글 테이블 
create table replyBoard(
    replyNum number primary key, 
    reply varchar2(600) not null, 
    replyer varchar2(100), 
    replyReg date default sysdate,
    boardNum number not null, 
    replyGrp number,
    replyLevel number,
    replyStep number
);
-- 댓글 고유번호로 사용할 시퀀스 생성 
create sequence reply_seq nocache;
select * from replyBoard;
desc replyBoard;


select B.* from 
(select rownum r, A.* from 
(select * from replyBoard 
where boardNum = 16 
order by replyGrp asc, replyStep asc) A 
order by replyGrp asc, replyStep asc) B
where r >= 1 and r <= 10; 

select count(*) from replyBoard where boardNum=16;
















