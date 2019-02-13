package com.je.GameProject.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.je.GameProject.domain.MemberVO;
import com.je.GameProject.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@WebAppConfiguration
@Slf4j
public class SearchTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		
		log.info("searchTest");
		List<MemberVO> list = sqlSession.getMapper(MemberMapper.class)
										.selectMembersBySearch("member_name","이름", "임영주", 1, 10);
		
		for(MemberVO member:list) {
			
			log.info("member:"+member.toString());
		}
		
	}
	
}
