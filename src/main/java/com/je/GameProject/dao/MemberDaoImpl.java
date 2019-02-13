package com.je.GameProject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.je.GameProject.domain.MemberVO;
import com.je.GameProject.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMember(MemberVO memberVO) {

		log.info("insertMember");
		sqlSession.getMapper(MemberMapper.class).insertMember(memberVO);
	}

	@Override
	public List<MemberVO> selectAllMembers() {
		log.info("selectAllMembers");
		return sqlSession.getMapper(MemberMapper.class).selectAllMembers();
	}

	@Override
	public MemberVO selectMember(String memberId) {
		log.info("selectMember");
		return sqlSession.getMapper(MemberMapper.class).selectMember(memberId);
	}
	
	@Override
	public void updateMember(MemberVO memberVO) {

		log.info("updateMember");
		sqlSession.getMapper(MemberMapper.class).updateMember(memberVO);
	}

	@Override
	public List<MemberVO> selectAllMembersByPage(int page, int rowsPerPage) {

		log.info("selectAllMembersByPage");
		return sqlSession.getMapper(MemberMapper.class).selectAllMembersByPage(page,rowsPerPage);
	}

	@Override
	public List<MemberVO> selectMembersBySearch(String searchKind, String searchWord, int page, int rowsPerPage) {
		log.info("selectMembersBySearch");
		String searchKindFld = "";
		switch (searchKind) {
		case "아이디": 
			searchKindFld = "member_id";
			break;
		
		case "이름": 
			searchKindFld = "member_name";
			break;

		case "별명": 
			searchKindFld = "member_nickname";
			break;
			
		case "주소": 
			searchKindFld = "member_address_basic";
			break;
			
		case "이메일": 
			searchKindFld = "member_email";
			break;
		
		default:
			break;
		}
		
		return sqlSession.getMapper(MemberMapper.class).selectMembersBySearch(searchKindFld, searchKind, searchWord, page, rowsPerPage);
	}

	@Override
	public int selectMembersCountBySearch(String searchKind, String searchWord) {
		
		log.info("selectMembersCountBySearch");
		
		String searchKindFld="";
		
		switch (searchKind) {
		case "아이디": 
			searchKindFld = "member_id";
			break;
		
		case "이름": 
			searchKindFld = "member_name";
			break;

		case "별명": 
			searchKindFld = "member_nickname";
			break;
			
		case "주소": 
			searchKindFld = "member_address_basic";
			break;
			
		case "이메일": 
			searchKindFld = "member_email";
			break;
		
		default:
			break;
		}
		
		return sqlSession.getMapper(MemberMapper.class).selectMembersCountBySearch(searchKindFld, searchKind, searchWord);
	}

}
