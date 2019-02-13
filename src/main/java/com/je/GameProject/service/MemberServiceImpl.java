package com.je.GameProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.je.GameProject.dao.MemberDao;
import com.je.GameProject.domain.MemberVO;
import com.je.GameProject.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

	@Autowired private MemberDao dao;
	
	@Override
	public void insertMember(MemberVO memberVO) {

		log.info("svc insertMember");
		dao.insertMember(memberVO);
	}

	@Override
	public List<MemberVO> selectAllMembers() {
		
		log.info("svc selectAllMembers");
		return dao.selectAllMembers();
	}

	@Override
	public MemberVO selectMember(String memberId) {

		log.info("svc selectMember");
		return dao.selectMember(memberId);
	}
	
	@Override
	public void updateMember(MemberVO memberVO) {

		log.info("updateMember");
		dao.updateMember(memberVO);
	}

	@Override
	public List<MemberVO> selectAllMembersByPage(int page, int rowsPerPage) {
		
		log.info("service selectAllMembersByPage");
		return dao.selectAllMembersByPage(page,rowsPerPage);
	}

	@Override
	public List<MemberVO> selectMembersBySearch(String searchKind, String searchWord, int page, int rowsPerPage) {

		log.info("service selectMembersBySearch");
		return dao.selectMembersBySearch(searchKind, searchWord, page, rowsPerPage);
	}

	@Override
	public int selectMembersCountBySearch(String searchKind, String searchWord) {
		
		log.info("service selectMembersCountBySearch");
		return dao.selectMembersCountBySearch(searchKind, searchWord);
	}

}
