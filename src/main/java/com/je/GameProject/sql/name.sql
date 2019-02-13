create or replace procedure name_update_gen_proc  
IS  
      TYPE first_name_array      IS VARRAY(20) OF CLOB;   
      TYPE middle_name_array      IS VARRAY(10) OF CLOB;   
      TYPE last_name_array      IS VARRAY(10) OF CLOB;   
      first_names   first_name_array;  
      middle_names   middle_name_array;  
      last_names   last_name_array;        
      v_firstName CLOB;  
      v_middleName CLOB;  
      v_lastName CLOB;  
      totalName CLOB;  
      temp_num number(2);  
begin  
      first_names := first_name_array('김','이','박','최','주','임','엄','성','남궁','독고','황','황보','송','오','유','류','윤','장','정','추');  
      middle_names := middle_name_array('숙','갑','영','순','선','원','우','이','운','성');  
      last_names := last_name_array('영','수','희','빈','민','정','순','주','연','영');  
        
      FOR i IN 1..100 LOOP  
         
        temp_num := round(DBMS_RANDOM.VALUE(1,20),0);  
        v_firstName :=  first_names(temp_num);   
        temp_num := round(DBMS_RANDOM.VALUE(1,10),0);  
        v_middleName :=  middle_names(temp_num);   
        temp_num := round(DBMS_RANDOM.VALUE(1,10),0);  
        v_lastName :=  last_names(temp_num);   
        totalName := v_firstName || v_middleName || v_lastName;  
                         
        update member_tbl set member_name = totalName  
        where member_email = 'game' || i ||'@abcd.com';    
  
    END LOOP;  
      
  end;  
/  
  
execute name_update_gen_proc;  

COMMIT;

