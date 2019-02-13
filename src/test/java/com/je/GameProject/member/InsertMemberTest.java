package com.je.GameProject.member;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.je.GameProject.InsertTest;
import com.je.GameProject.dao.MemberDao;
import com.je.GameProject.domain.MemberVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
      })
@WebAppConfiguration
@Slf4j
public class InsertMemberTest {
	
	@Autowired private MemberDao dao;
	
	@Test
	public void test() {
		
		log.info("InsertMemberTest");
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId("java1234");
		memberVO.setMemberPassword("java1234");
		memberVO.setMemberNickname("java");
		memberVO.setMemberName("주찬미");
		memberVO.setMemberGender("f");
		memberVO.setMemberAge(22);
		memberVO.setMemberEmail("java@java.com");
		memberVO.setMemberPhone("010-1234-1234");
		memberVO.setMemberBirth(Date.valueOf("1998-08-28"));
		memberVO.setMemberZip("12356");
		memberVO.setMemberAddressBasic("서울특별시 구로구 구로동");
		memberVO.setMemberAddressDetail("234번지 1층");
		
		dao.insertMember(memberVO);
		
	}

}
