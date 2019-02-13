package com.je.GameProject.member;

import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.je.GameProject.dao.MemberDao;
import com.je.GameProject.domain.MemberVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@WebAppConfiguration
@Slf4j
public class SelectAllMembersTest {
	
	@Autowired
	private MemberDao dao;
	
	@Test
	public void test() {
		
		log.info("SelectAllMembersTest");
		List<MemberVO> list = dao.selectAllMembers();
		
		for(MemberVO member : list ) {
			log.info(member.toString());
			            
			log.info("생일: "+new SimpleDateFormat("yyyy년 MM월 dd일")
	                .format(member.getMemberBirth()));
		}//for
	}//test
}//SelectAllMembersTest
