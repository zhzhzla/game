/**
 * 
 */
package com.je.GameProject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.je.GameProject.dao.GameInfoDao;
import com.je.GameProject.domain.GameInfoVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @author a
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
      })
@WebAppConfiguration
@Slf4j
public class InsertTest {
	
	@Autowired private GameInfoDao dao;
	
	@Test
	public void test() {
		
		log.info("InsertTest");
		GameInfoVO gameInfoVO = new GameInfoVO();
		gameInfoVO.setGameName("로스트아크");
		gameInfoVO.setGameGenre("MMORPG");
		gameInfoVO.setGameCompany("블리자드");
		gameInfoVO.setGameDetail("얼마 전 출시");
		dao.insertGameInfo(gameInfoVO);
		
		
	}

}
