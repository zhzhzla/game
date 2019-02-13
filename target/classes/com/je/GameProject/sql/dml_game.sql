/*SELECT gi.id, gi.game_name, gi.game_genre,
	gi.game_company, gi.game_pub_date, gi.game_detail,
	gci.clip_path
FROM game_info gi, game_clip_info gci 
WHERE gi.id=gci.game_id AND gi.game_name='심즈4';

select * from
		game_clip_info
		where game_id = (SELECT id FROM game_info WHERE game_name = '심즈4');*/
	
	SELECT gi.id, gi.game_name, gi.game_genre,
	gi.game_company, gi.game_pub_date, gi.game_detail,
	gci.clip_path
FROM game_info gi, game_clip_info gci 
WHERE gi.id=gci.game_id AND gi.game_name='이스 오리진';

select * from
		game_clip_info
		where game_id = (SELECT id FROM game_info WHERE game_name = '이스 오리진');
	
----------------------------------------
SELECT *  
    FROM (SELECT ROWNUM,  
                 m.*,  
                 FLOOR((ROWNUM - 1)/10 + 1) page   
             FROM (  
                     SELECT * FROM game_info
                     WHERE GAME_GENRE LIKE '%RPG%'
                     ORDER BY id ASC   
                   ) m   
          )   
 WHERE page = 1; 
 
-----------------------------------------------------
SELECT *
		FROM (SELECT ROWNUM,
			m.*,
				FLOOR((ROWNUM - 1)/10 + 1)
					page
		FROM (
		SELECT * FROM game_info
		WHERE GAME_GENRE LIKE '%RPG%'
		ORDER BY id ASC
		) m
		)
		WHERE page = 1;
		
-----------------------------------------------

	