CREATE OR REPLACE PROCEDURE dummy_gen_proc
IS
BEGIN

    FOR i IN 1..100 LOOP
        INSERT INTO member_tbl VALUES 
        ('spring' || (1112+i),
         '#Spring1234', 
         'gamer' || (1112+i), 
         '김익명' || (i),
         'f', 
         round(DBMS_RANDOM.VALUE(6,80),0),
         'game' || i || '@abcd.com',
          '010-1234-' || (1112+i), 
          to_date(round(DBMS_RANDOM.VALUE(2019-80, TO_CHAR(sysdate, 'yyyy')), 0) || '-' || round(DBMS_RANDOM.VALUE(1,12),0) || '-' || round(DBMS_RANDOM.VALUE(1,31),0)),
          '12345', 
          '부천학교',  
          '서울 구로학원'
           );
     END LOOP;

    COMMIT;    
END;
/

EXECUTE dummy_gen_proc;
------------------------
/*UPDATE member_tbl SET MEMBER_BIRTH*/

--날짜 임의 생성
SELECT to_date(round(DBMS_RANDOM.VALUE(2019-80, TO_CHAR(sysdate, 'yyyy')), 0) || '-' ||  
               round(DBMS_RANDOM.VALUE(1,12),0) || '-' ||   
               round(DBMS_RANDOM.VALUE(1,31),0))  
FROM dual;  

----- 삭제
DELETE member_tbl;
-----------------------------------

CREATE OR REPLACE PROCEDURE dummy_role_gen_proc
IS
BEGIN

    FOR i IN 1..100 LOOP
        INSERT INTO member_role VALUES 
        ('spring' || (1112+i),
         'ROLE_USER'
           );
     END LOOP;

    COMMIT;    
END;
/

EXECUTE dummy_role_gen_proc;

--------------------------------
INSERT INTO member_role VALUES ('java1234','ROLE_ADMIN');

