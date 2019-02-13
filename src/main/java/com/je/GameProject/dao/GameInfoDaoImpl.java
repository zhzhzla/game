/**
 * 
 */
package com.je.GameProject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.je.GameProject.domain.GameClipInfoVO;
import com.je.GameProject.domain.GameInfoVO;
import com.je.GameProject.mapper.GameInfoMapper;

import lombok.extern.slf4j.Slf4j;

/**
 * @author a
 *
 */
@Repository
@Slf4j
public class GameInfoDaoImpl implements GameInfoDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGameInfo(GameInfoVO gameInfoVO) {
		
		log.info("insertGameInfo");
		try {
		sqlSession.getMapper(GameInfoMapper.class).insertGameInfo(gameInfoVO);
			} catch(Exception e) {
				log.error("error");
				e.printStackTrace();
			}
	}

	@Override
	public List<GameInfoVO> selectAllGameInfo() {

		log.info("selectAllGameInfo");
		return sqlSession.getMapper(GameInfoMapper.class).selectAllGameInfo();

	}

	@Override
	public GameInfoVO selectGameInfo(String gameName) {

		log.info("selectGameInfo");
		return sqlSession.getMapper(GameInfoMapper.class).selectGameInfo(gameName);
	}

	@Override
	public List<GameClipInfoVO> selectGameClipInfo(String gameName) {

		log.info("selectGameClipInfo");
		return sqlSession.getMapper(GameInfoMapper.class).selectClipGameInfo(gameName);
	}

	@Override
	public List<GameInfoVO> selectAllGamesByPage(int page, int rowsPerPage) {

		log.info("selectAllGamesByPage");
		return sqlSession.getMapper(GameInfoMapper.class).selectAllGamesByPage(page, rowsPerPage);
	}

	@Override
	public List<GameInfoVO> selectGamesBySearch(String searchKind, String searchWord, int page, int rowsPerPage) {

		log.info("selectGamesBySearch");
		log.info("############################ page:"+page);
		log.info("############################ rowsPerPage:"+rowsPerPage);
		if(searchKind.trim().equals("게임 출시일")) {
			
			searchWord = searchWord.split("-")[0];//게임출시연도만 출력
			log.info("################# searchWord:"+searchWord);
		}
		
		String searchKindFld=(searchKind.trim().equals("게임 이름")) ? "game_name" : 
			 				 (searchKind.trim().equals("게임 장르")) ? "game_genre" :
							 (searchKind.trim().equals("제작/배포 회사")) ? "game_company" :
							 (searchKind.trim().equals("게임 출시일")) ? "to_char(game_pub_date, 'yyyy')" : "game_name";	 
		searchWord=searchWord.trim().toUpperCase();
		
		return sqlSession.getMapper(GameInfoMapper.class).selectGamesBySearch(searchKindFld,searchKind, searchWord, page, rowsPerPage);
	}

	@Override
	public int selectGamesCountBySearch(String searchKind, String searchWord) {

		log.info("★★★★★★★★★★★★★ selectGamesCountBySearch");
		log.info("################# searchKind:"+searchKind);
		
		if(searchKind.trim().equals("게임 출시일")) {
					
				searchWord = searchWord.split("-")[0];//게임출시연도만 출력
				log.info("################# searchWord:"+searchWord);
		}

		String searchKindFld=(searchKind.trim().equals("게임 이름")) ? "game_name" : 
							 (searchKind.trim().equals("게임 장르")) ? "game_genre" :
							 (searchKind.trim().equals("제작/배포 회사")) ? "game_company" :
							 (searchKind.trim().equals("게임 출시일")) ? "to_char(game_pub_date, 'yyyy')" : "game_name";	 
		searchWord=searchWord.trim().toUpperCase();
		
		
		log.info("##################### searchKindFld:"+searchKindFld);
		int result= sqlSession.getMapper(GameInfoMapper.class).selectGamesCountBySearch(searchKindFld,searchWord);
		log.info("######################### result:"+result);
		return result;
	}
}
