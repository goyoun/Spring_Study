package com.icia.memberboard.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.repository.MemberRepository;

@Service
public class MemberService implements MemberServiceInterface {

	
	@Autowired
	private MemberRepository mr;
	@Autowired
	private HttpSession session;

	//회원가입 처리
	/*
	 * @Override public int insert(MemberDTO member) { // insert 메서드 호출 후 리턴값을 받아와서
	 * 리턴값을 출력해봅시다. int result = mr.insert(member); System.out.println(result);
	 * return result; }
	 */
	// 로그인 처리
	@Override
	public String login(MemberDTO member) {
		MemberDTO loginMember = mr.login(member); 
		if (loginMember != null) {
			// 로그인 성공 (로그인 정보(아이디)를 세션에 저장)
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", loginMember.getM_number());
			//로그인성공 
		return "redirect:/board/paging";
		} else {
			//로그인 실패
		return "/member/login";
	}
	}
	
	@Override
	public void saveFile(MemberDTO member) throws IllegalStateException, IOException{
		// dto에 담긴 파일을 가져옴 
		MultipartFile m_file = member.getM_file();
		// 파일 이름을 가져옴(파일이름을 DB에 저장하기 위해)
		String m_filename = m_file.getOriginalFilename();
		// 파일명 중복을 피하기 위해 파일이름앞에 현재 시간값을 붙임. 
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		System.out.println("m_filename: " + m_filename);
		// 파일 저장경로 세팅
		String savePath = "C:\\Development\\source\\spring_sts\\MemberBoard\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		// bfile이 비어있지 않다면(즉 파일이 있으면) savePath에 저장을 하겠다.
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		}
		// 여기까지의 내용은 파일을 저장하는 과정 
		
		//DB에 저장하기 위해 DTO에 파일 이름을 담는다.
		member.setM_filename(m_filename);
		// Repository로 호출
		// DB의 board 에 파일이름을 저장할 b_filename 이라는 컬럼 추가 (타입은 varchar(100))
		mr.saveFile(member);
		
	}
	// 마이페이지 출력
	@Override
	public MemberDTO mypage(long m_number) {
		MemberDTO member = mr.mypage(m_number);
		return member;
	}
	
	// 마이페이지 업데이트
	@Override
	public String update(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		System.out.println("m_filename: " + m_filename);
		String savePath = "C:\\Development\\source\\spring_sts\\MemberBoard\\src\\main\\webapp\\resources\\upload\\"+m_filename;
			if(!m_file.isEmpty()) {
				m_file.transferTo(new File(savePath));
				}
				member.setM_filename(m_filename);
				mr.update(member);
				return "redirect:/member/mypage?m_number=" + member.getM_number();
	}
	public List<MemberDTO> memberAll() {
		List<MemberDTO> mList = mr.memberAll();
//		for(MemberDTO m: mList) {
//			System.out.println(m);
//		}
		return mList;
	}
	
	// 상세조회
	public MemberDTO findById(long m_number) {
		MemberDTO member = mr.findById(m_number);
		return member;
	}
	// 아이디 중복체크
	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if (result == null) {
		return "ok"; //조회 결과가 없기 때문에 해당 아이디는 사용 가능
		} else {
		return "no"; // 조회 결과가 있기 때문에 해당 아이디는 사용 불가능
	}
	}
	
	public void delete(long m_number) {
		mr.delete(m_number);
		System.out.println("Delete() : " + m_number);
	}

}
	

