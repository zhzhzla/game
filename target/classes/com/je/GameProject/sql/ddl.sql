--게임정보테이블
--아이디, 성별, 게임이름, 게임 회사,게임장르, 게임 설명
--game_id,game_gender,game_name,game_company,	game_genre,game_choice

CREATE TABLE game_info (
	id number(6) PRIMARY KEY,
	game_name  varchar2(50) NOT NULL,
	game_genre varchar2(20) NOT NULL,
	game_company varchar2(50) NOT NULL,
	game_pub_date DATE,
	game_detail varchar2(4000) NOT NULL
);
		
	CREATE SEQUENCE game_info_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 999
	NOCYCLE;

DROP TABLE game_info;
DROP SEQUENCE game_info_seq;

DELETE GAME_INFO;

/*INSERT INTO GAME_INFO VALUES (game_info_seq.nextval, '오버워치', 'FPS','블리자드','1997-08-01','최근출시')
INSERT INTO GAME_INFO VALUES (game_info_seq.nextval, '스타', 'FPS', 'ea', '최근출시')
INSERT INTO GAME_INFO VALUES (game_info_seq.nextval, '서든어택', 'FPS', '넥슨', '최근출시')*/

--영상정보 테이블 
--정지영상, 동영상(유튜브 링크, 파일 업로드 동영상)

CREATE TABLE game_clip_info(
	id number(6) PRIMARY KEY,
	game_id number(6) NOT NULL,
	clip_kind varchar2(20),
	clip_path varchar2(200)
);

DROP TABLE GAME_CLIP_INFO;
DELETE GAME_CLIP_INFO;

CREATE SEQUENCE game_clip_info_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 999
	NOCYCLE;

--이스 오리진
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval,1,'youtube',
	'https://www.youtube.com/embed/Fo8w0NmLWGI'
); 

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval,1,'pic',
	'ys_pic1.jpg'
);

--로스트아크
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval,21,'youtube',
	'https://www.youtube.com/embed/lV0wWzDAwJU'
); 

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval,21,'pic',
	'lost_pic1.jpg'
);

--리니지
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 61,'youtube',
	'https://www.youtube.com/embed/MIGs861Pff4'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 61,'pic',
	'lineage_pic1.jpeg'
);

--WOW
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 62,'youtube',
	'https://www.youtube.com/embed/7Gkx7NBDnXQ'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 62,'pic',
	'wow_pic1.jpg'
);

--오버워치
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 63,'youtube',
	'https://www.youtube.com/embed/UEYp1RTvllM'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 63,'pic',
	'ow_pic1.jpg'
);

--배틀 그라운드
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 81,'youtube',
	'https://www.youtube.com/embed/d2rhk7MJM-s'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 81,'pic',
	'pubg_pic1.png'
);

--리그 오브 레전드
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 82,'youtube',
	'https://www.youtube.com/embed/SZIYkyxxbg8'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 82,'pic',
	'lol_pic1.jpg'
);

--스타 크래프트
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 83,'youtube',
	'https://www.youtube.com/embed/TdFRdriyxOA'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 83,'pic',
	'star_pic1.jpg'
);

--심즈4
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 84,'youtube',
	'https://www.youtube.com/embed/-mTR0n2KDSs'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 84,'pic',
	'sims4_pic1.jpg'
);


--피파온라인4
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 85,'youtube',
	'https://www.youtube.com/embed/XVbid3DkHQg'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 85,'pic',
	'fifa_pic1.jpg'
);

--하스스톤
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 86,'youtube',
	'https://www.youtube.com/embed/vBIUhk-FqEI'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 86,'pic',
	'hs_pic1.jpg'
);

--검은 사막
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 87,'youtube',
	'https://www.youtube.com/embed/WQjiCuPoeqo'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 87,'pic',
	'bd_pic1.jpg'
);

--블레이드 앤 소울
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 88,'youtube',
	'https://www.youtube.com/embed/lWPk327LS6o'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 88,'pic',
	'bs_pic1.jpg'
);

--DOOM
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 89,'youtube',
	'https://www.youtube.com/embed/RO90omga8D4'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 89,'pic',
	'doom_pic1.jpg'
);

--퀘이크
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 90,'youtube',
	'https://www.youtube.com/embed/sa-6fQyNkZo'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 90,'pic',
	'quake_pic1.jpg'
);

--울펜슈타인 3D
INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 91,'youtube',
	'https://www.youtube.com/embed/64vBUt_K7PI'
);

INSERT INTO game_clip_info VALUES(
	game_clip_info_seq.nextval, 91,'pic',
	'wolf_pic1.jpg'
);
