/**
 * 
 */
package com.je.GameProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.je.GameProject.domain.GameClipInfoVO;
import com.je.GameProject.domain.GameInfoVO;

/**
 * @author a
 *
 */
public interface GameInfoMapper {

	public void insertGameInfo(GameInfoVO gameInfoVO);
	public List <GameInfoVO> selectAllGameInfo();
	public GameInfoVO selectGameInfo(String gameName);
	public List <GameClipInfoVO> selectClipGameInfo(String gameName);
	public List <GameInfoVO> selectAllGamesByPage(@Param("page") int page, @Param("rowsPerPage") int rowsPerPage); 
	public List <GameInfoVO> selectGamesBySearch(@Param("searchKindFld") String searchKindFld, 
												 @Param("searchKind") String searchKind,
												 @Param("searchWord") String searchWord, 
												 @Param("page") int page,
												 @Param("rowsPerPage") int rowsPerPage);
	public int selectGamesCountBySearch(@Param("searchKindFld") String searchKindFld, 
										@Param("searchWord") String searchWord);

}
