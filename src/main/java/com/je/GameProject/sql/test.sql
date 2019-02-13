SELECT count(*) 
		FROM (SELECT ROWNUM,
			m.* 
		FROM (
				SELECT * FROM game_info 
				WHERE GAME_PUB_DATE LIKE TO_DATE ('1994','yyyy')
				ORDER BY id ASC 
				)
				m
				);
			
--------------------------------------			
SELECT game_name 
FROM game_info
WHERE to_char(game_pub_date, 'yyyy') LIKE '%1994%';

--------------------------------------------
SELECT * FROM (SELECT ROWNUM, m.*, FLOOR((ROWNUM - 1)/10 + 1) page 
FROM ( SELECT * FROM game_info WHERE to_char(game_pub_date, 'yyyy') LIKE '%1994%' ORDER BY id ASC ) m ) WHERE page = 1;