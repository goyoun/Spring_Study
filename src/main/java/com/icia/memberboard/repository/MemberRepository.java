package com.icia.memberboard.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.memberboard.dto.MemberDTO;

@Repository

public class MemberRepository {

	@Autowired
	private SqlSessionTemplate sql;

	/*
	 * // 회원가입 public int insert(MemberDTO member) { return
	 * sql.insert("Member.membersave", member); }
	 */	// 로그인
	public MemberDTO login(MemberDTO member) {
		System.out.println(member);
		return sql.selectOne("Member.login", member);
	}
	
	public void saveFile(MemberDTO member) {
		sql.insert("Member.membersave", member);
		
	}
	public MemberDTO mypage(long m_number) {
		return sql.selectOne("Member.mypage", m_number);
			
	}

	public int update(MemberDTO member) {
		return sql.update("Member.update", member);
	}

	public List<MemberDTO> memberAll() {
		return sql.selectList("Member.memberAll");
	}
	
	// 상세조회 
	public MemberDTO findById(long m_number) {
		return sql.selectOne("Member.findById", m_number);
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate", m_id);
	}

	public void delete(long m_number) {
		sql.delete("Member.delete", m_number);
		
	}

}
