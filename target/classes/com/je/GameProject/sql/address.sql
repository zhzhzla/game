create or replace procedure address_update_gen_proc  
IS  
      TYPE basic_address_array      IS VARRAY(10) OF CLOB;   
      TYPE detail_address_array      IS VARRAY(10) OF CLOB;   
      basic_addresss   basic_address_array;  
      detail_addresss   detail_address_array;  
      v_basicAddress CLOB;  
      v_detailAddress CLOB;  
      temp_num number(2);  
begin  
      basic_addresss := basic_address_array('인천시 계양구 장제로','인천시 계양구 계양문화로','인천시 계양구 가현2길','인천시 남동구 인주대로','인천시 남동구 간석로','경기도 부천시 경인로117번길','경기도 부천시 범안로','경기도 부천시 성주로','서울특별시 구로구 가마산로','서울특별시 관악구 과천대로');  
      detail_addresss := detail_address_array('21-9','12','456','삼일빌딩','구로아파트','미래아파트','1층','156-8','124-8','구로빌라');  
        
      FOR i IN 1..100 LOOP  
         
        temp_num := round(DBMS_RANDOM.VALUE(1,10),0);  
        v_basicAddress :=  basic_addresss(temp_num);   
        temp_num := round(DBMS_RANDOM.VALUE(1,10),0);  
        v_detailAddress :=  detail_addresss(temp_num);   
                         
        update member_tbl set member_address_basic = v_basicAddress , member_address_detail = v_detailAddress
        where member_email = 'game' || i ||'@abcd.com';    
  
    END LOOP;  
      
  end;  
/  
  
execute address_update_gen_proc;  

COMMIT;

