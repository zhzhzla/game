CREATE TABLE member_tbl (
	member_id varchar2(20) PRIMARY KEY,
	member_password varchar2(30) NOT NULL,
	member_nickname varchar2(50) NOT NULL,
	member_name  varchar2(50) NOT NULL,
	member_gender char(1) NOT NULL,
	member_age NUMBER(3) NOT NULL,
	member_email varchar2(50) NOT NULL,
	member_phone varchar2(13) NOT NULL,
	member_birth DATE,
	member_zip varchar2(6) NOT NULL,
	member_address_basic varchar2(200) NOT NULL,
	member_address_detail varchar2(100) NOT NULL
);

DROP TABLE member_tbl;
INSERT INTO MEMBER_TBL VALUES ('abcd1234','abcd1234','게임회원','엄서란','f',22,'abcd@abcd.com','010-1234-5678',
								'1997-12-24','12345','서울특별시 관악구 신사로12길','1층');
								
SELECT * FROM Member_tbl;
SELECT * FROM Member_tbl WHERE member_id = 'abcd1234';

CREATE TABLE Member_role(
	member_id varchar2(20) PRIMARY KEY,
	member_role Varchar2(20)
);

