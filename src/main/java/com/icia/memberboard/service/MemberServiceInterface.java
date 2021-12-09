package com.icia.memberboard.service;

import java.io.IOException;
import java.util.List;

import com.icia.memberboard.dto.MemberDTO;

public interface MemberServiceInterface {
	
//	public int insert(MemberDTO member);

	public String login(MemberDTO member);

	public void saveFile(MemberDTO board) throws IllegalStateException, IOException;

	public MemberDTO mypage(long m_number);

	public String update(MemberDTO member) throws IllegalStateException, IOException;

	public List<MemberDTO> memberAll();

	public MemberDTO findById(long m_number);

	public String idDuplicate(String m_id);

	public void delete(long m_number);


	

}
