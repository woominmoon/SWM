create table tbl_board(
	c_board_num number(6) primary key,
	c_board_author varchar2(15) not null,
	c_board_title varchar2(90) not null,
	c_board_content varchar2(1000) not null,
	c_board_writeday date default sysdate,
	c_board_readcnt number(6) default 0,
	c_board_repRoot number(4),
	c_board_repStep number(4),
	c_board_repIndent number(4),
	c_board_recom number(4),
	c_board_decom number(4)
)
drop table tbl_board

CREATE TABLE tbl_member(
c_member_id varchar2(6) PRIMARY KEY,
c_member_password varchar2(12) not null,
c_member_name varchar2(12) not null,
c_member_birth date default sysdate,
c_member_gender varchar2(1) not null,
c_member_admin number(1) default 1,
CONSTRAINT tbl_member_gender_MorF_CK CHECK (c_member_gender IN('M', 'F', 'm', 'f'))
)

select c_board_num, c_board_author, c_board_title, to_char(c_board_writeday, 'yyyy/mm/dd') writeday, c_board_readcnt, c_board_recom, c_board_decom from (select c_board_num, c_board_author, c_board_title, c_board_writeday, c_board_readcnt, c_board_recom, c_board_decom from tbl_board order by c_board_recom desc) where rownum <= 6

select c_board_num, c_board_author, c_board_title, to_char(c_board_writeday, 'yyyy/mm/dd') writeday, c_board_readcnt, c_board_recom, c_board_decom from (select c_board_num, c_board_author, c_board_title, c_board_writeday, c_board_readcnt, c_board_recom, c_board_decom from tbl_board order by c_board_readcnt desc) where rownum <= 6



CREATE TABLE tbl_recom(
c_recom_memberid varchar2(6) not null,
c_recom_boardnum number(6)
)


alter table tbl_member modify(c_member_id varchar2(12))






