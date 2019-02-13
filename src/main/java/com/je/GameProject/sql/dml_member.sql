SELECT * FROM member_tbl WHERE member_id='java1234';   

DELETE member_tbl WHERE member_id='java1234';

UPDATE member_tbl SET
    MEMBER_PASSWORD='#Java1234',
    member_email='oj@naver.com',
    MEMBER_PHONE='010-2323-5454',
    member_zip='08381',
    MEMBER_ADDRESS_BASIC= '서울특별시 구로구 디지털로 271(구로동)*아이티런 교육센터',
    MEMBER_ADDRESS_DETAIL='12'
WHERE member_id='java1234';

---------------------------------
SELECT *  
    FROM (SELECT ROWNUM,  
                 m.*,  
                 FLOOR((ROWNUM - 1)/10 + 1) page   
             FROM (  
                     SELECT * FROM member_tbl   
                     ORDER BY MEMBER_ID ASC   
                   ) m   
          )   
 WHERE page = 11; 
 
------------------------------------
SELECT *  
    FROM (SELECT ROWNUM,  
                 m.*,  
                 FLOOR((ROWNUM - 1)/10 + 1) page   
             FROM (  
                     SELECT * FROM member_tbl
                     WHERE MEMBER_ADDRESS_BASIC LIKE '%구로구%'
                     ORDER BY MEMBER_ID ASC   
                   ) m   
          )   
 WHERE page = 1; 
 
-------------------------------------------
SELECT count(*)  
    FROM (SELECT ROWNUM,  
                 m.* 
             FROM (  
                     SELECT * FROM member_tbl
                     WHERE MEMBER_ADDRESS_BASIC LIKE '%구로구%'
                     ORDER BY MEMBER_ID ASC   
                   ) m   
          );
