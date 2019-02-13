package com.je.GameProject.member;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.je.GameProject.domain.MemberVO;
import com.je.GameProject.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@WebAppConfiguration
@Slf4j
public class SelectMemberTest {
	
	@Autowired
	private MemberService svc;
	
	@Test
	public void test() {
		
		log.info("SelectMemberTest");
		List<MemberVO> list = svc.selectAllMembers();
		
		for(MemberVO member : list) {
			log.info(member.toString());
		}
		
	}

}
