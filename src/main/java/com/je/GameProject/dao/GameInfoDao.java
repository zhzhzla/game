package com.je.GameProject.dao;

import java.util.List;

import com.je.GameProject.domain.GameClipInfoVO;
import com.je.GameProject.domain.GameInfoVO;
import com.je.GameProject.domain.MemberVO;

public interface GameInfoDao {

	public void insertGameInfo(GameInfoVO gameInfoVO);
	public List <GameInfoVO> selectAllGameInfo();
	public GameInfoVO selectGameInfo(String gameName);
	public List <GameClipInfoVO> selectGameClipInfo(String gameName);
	public List <GameInfoVO> selectAllGamesByPage(int page, int rowsPerPage); 
	public List <GameInfoVO> selectGamesBySearch(String searchKind, String searchWord,
											int page, int rowsPerPage);
	public int selectGamesCountBySearch(String searchKind, String searchWord);
	
}
