package com.je.GameProject.service;

import java.util.List;

import com.je.GameProject.domain.GameClipInfoVO;
import com.je.GameProject.domain.GameInfoVO;
import com.je.GameProject.domain.MemberVO;

public interface GameInfoService {

	public boolean insertGameInfo(GameInfoVO game);
	public List<GameInfoVO> getAllGameInfo();
	public GameInfoVO getGameInfo(String gameName);
	public List<GameClipInfoVO> getGameClipInfo(String gameName);
	public List <GameInfoVO> selectAllGamesByPage(int page, int rowsPerPage);
	public List <GameInfoVO> selectGamesBySearch(String searchKind, String searchWord, 
			int page, int rowsPerPage);
	public int selectGamesCountBySearch(String searchKind, String searchWord);

}
