create or replace procedure nickname_update_gen_proc  
IS  
      TYPE first_name_array      IS VARRAY(10) OF CLOB;   
      TYPE middle_name_array      IS VARRAY(10) OF CLOB;   
      first_names   first_name_array;  
      middle_names   middle_name_array;  
      v_firstName CLOB;  
      v_middleName CLOB;  
      totalName CLOB;  
      temp_num number(2);  
begin  
      first_names := first_name_array('game','게임','오버워치','sims','피파','로아','배그','gamer','심즈','로스트아크');  
      middle_names := middle_name_array('왕','여왕','킹','달인','도사','덕후','매니아','중독','사마','짱');  
        
      FOR i IN 1..100 LOOP  
         
        temp_num := round(DBMS_RANDOM.VALUE(1,10),0);  
        v_firstName :=  first_names(temp_num);   
        temp_num := round(DBMS_RANDOM.VALUE(1,10),0);  
        v_middleName :=  middle_names(temp_num);   
        totalName := v_firstName || v_middleName;  
                         
        update member_tbl set member_nickname = totalName  
        where member_email = 'game' || i ||'@abcd.com';    
  
    END LOOP;  
      
  end;  
/  
  
execute nickname_update_gen_proc;  

COMMIT;

