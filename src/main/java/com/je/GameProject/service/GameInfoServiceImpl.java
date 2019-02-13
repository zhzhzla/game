package com.je.GameProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.je.GameProject.dao.GameInfoDao;
import com.je.GameProject.domain.GameClipInfoVO;
import com.je.GameProject.domain.GameInfoVO;

import lombok.extern.slf4j.Slf4j;




@Service
@Slf4j
public class GameInfoServiceImpl implements GameInfoService {

	@Autowired
	private GameInfoDao dao;


	@Override
	public boolean insertGameInfo(GameInfoVO game) {

		log.info("InsertGameInfo");
		boolean flag = false;

		try {

			dao.insertGameInfo(game);

		}catch(Exception e) {

			e.printStackTrace();
			flag = false;
		}

		return false;
	}

	@Override
	public List<GameInfoVO> getAllGameInfo() {
		log.info("getAllGameInfo");
		return dao.selectAllGameInfo();
	}

	@Override
	public GameInfoVO getGameInfo(String gameName) {

		log.info("getGameInfo");
		return dao.selectGameInfo(gameName);
	}

	@Override
	public List <GameClipInfoVO> getGameClipInfo(String gameName) {
		log.info("getGameClipInfo");
		return dao.selectGameClipInfo(gameName);
	}

	@Override
	public List<GameInfoVO> selectAllGamesByPage(int page, int rowsPerPage) {
		
		log.info("selectAllGamesByPage");
		return dao.selectAllGamesByPage(page, rowsPerPage);
	}

	@Override
	public List<GameInfoVO> selectGamesBySearch(String searchKind, String searchWord, int page, int rowsPerPage) {
		
		log.info("selectGamesBySearch");
		return dao.selectGamesBySearch(searchKind, searchWord, page, rowsPerPage);
	}

	@Override
	public int selectGamesCountBySearch(String searchKind, String searchWord) {
		
		log.info("selectGamesCountBySearch");
		return dao.selectGamesCountBySearch(searchKind, searchWord);
	}

}
