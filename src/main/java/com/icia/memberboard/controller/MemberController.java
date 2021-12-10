package com.icia.memberboard.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.service.MemberServiceInterface;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {

	@Autowired
	private MemberServiceInterface ms;
	
	// 회원가입 페이지 출력
	@RequestMapping (value="insert", method=RequestMethod.GET)
		public String insertform() {
		return "/member/insert";
	}
	
	// 회원가입 처리
	/*
	 * @RequestMapping (value="insert", method=RequestMethod.POST) public String
	 * MemberJoin(@ModelAttribute MemberDTO member) { int insert =
	 * ms.insert(member); if(insert>0) { return "index"; } else { return "insert"; }
	 * }
	 */
	// 로그인 페이지 출력
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginform() {
		return "/member/login";
	}
	
	// 로그인처리
	@RequestMapping (value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member) {
		String result = ms.login(member);
		return result;
	}
	// 회원가입 및 파일첨부
	@RequestMapping(value="savefile", method=RequestMethod.POST)
	public String saveFile (@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
			ms.saveFile(member);
			return "/member/login";
	}
	
	// 마이페이지 화면요청
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypageform(Model model,@RequestParam("m_number") long m_number) 
			throws IllegalStateException, IOException{
		MemberDTO member = ms.mypage(m_number);
		model.addAttribute("mypage", member);
		return "member/mypage";
	}
	
	//수정후 detail.jsp 출력
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO member)
			throws IllegalStateException, IOException {	
		String result = ms.update(member);
		return result;
//		model.addAttribute("member",member);
//		System.out.println("받아지냐?");
//		return "redirect:/member/mypage?m_number=" + member.getM_number();	
}
	
	//회원전체정보 출력
	@RequestMapping (value="memberAll", method=RequestMethod.GET)
	public String memberAll(Model model) {
		List<MemberDTO> mList = ms.memberAll();
		model.addAttribute("mList", mList);
		return "member/memberAll";
	}
	
	// 상세 조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String findById(@RequestParam("m_number") long m_number, Model model) {
		System.out.println("findById: " + m_number);
//		호출
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member", member);
		return "/member/detail";
}
	// 상세조회 ajax 출력
	@RequestMapping(value="/detailAjax", method=RequestMethod.POST)
	public @ResponseBody MemberDTO detailAjax(@RequestParam("m_number") long m_number) {
		MemberDTO member = ms.findById(m_number);
		return member;
	}
	
	// 아이디 중복체크
	@RequestMapping(value="/idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		System.out.println("MemberController.idDuplicate(): " + m_id);
		String result = ms.idDuplicate(m_id);
		return result; //"ok" or "no" 라는 값이 들어있음.
	}
	//삭제 처리
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		ms.delete(m_number);
		return "redirect:/member/memberAll";
	}
}

	
	
	
	
	

