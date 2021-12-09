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

import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.dto.PageDTO;
import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.service.BoardServiceInterface;
import com.icia.memberboard.service.CommentServiceInterface;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	@Autowired
	private BoardServiceInterface bs;
	@Autowired
	private CommentServiceInterface cs;
	
	// 글쓰기 화면이동
	@RequestMapping(value="save", method=RequestMethod.GET)
	public String saveForm() {
		// views/board 폴더에 있는 save.jsp를 출력
		return "board/save";
	}
	
	// 글쓰기처리
	@RequestMapping(value="save", method=RequestMethod.POST)
	public String boardWriting (@ModelAttribute BoardDTO board) {
		bs.save(board);
		return "redirect:/board/findAll";
	}
	
	// 저장처리
	@RequestMapping(value="savefile", method=RequestMethod.POST)
	public String saveFile (@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
			bs.saveFile(board);
			return "redirect:/board/paging";
	}
	//글목록보기
		@RequestMapping (value="findAll", method=RequestMethod.GET)
		public String findAll(Model model) {
			List<BoardDTO> bList = bs.findAll();
			model.addAttribute("bList", bList);
			System.out.println(bList);
			return "/board/paging";
		}
	
	//디테일 출력
		@RequestMapping (value="detail", method=RequestMethod.GET)
		public String findById(@RequestParam("b_number") long b_number,Model model,
				   @RequestParam(value="page", required=false, defaultValue="1")int page) {
			BoardDTO board = bs.findById(b_number);
			model.addAttribute("board", board);
			model.addAttribute("page",page); // detail.jsp로 갈때 page값을 가지고 감.
			List<CommentDTO> commentList = cs.findAll(b_number); // 리스트 가져온 메소드
			model.addAttribute("commentList", commentList); // 가져가는 메소드
			return "board/detail";
}
		
		// 삭제요청
		@RequestMapping (value="delete", method=RequestMethod.GET)
		public String delete(@RequestParam("b_number") long b_number, Model model) {
			bs.delete(b_number);
			return "redirect:/board/paging";
		}
		//페이징처리
		@RequestMapping(value="paging", method=RequestMethod.GET)
		// value: 파라미터 이름, required: 필수여부, defaultValue: 기본값(page 요청값이 없으면 1로 세팅)
		public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
			List<BoardDTO> bList = bs.pagingList(page);
			PageDTO paging = bs.paging(page);
			model.addAttribute("bList", bList);
			model.addAttribute("paging", paging);
			return "board/findAll";
		}
		
		// 업데이트처리
		@RequestMapping (value="update", method=RequestMethod.GET)
		public String updateform(@RequestParam("b_number") long b_number, Model model,
			@RequestParam(value="page", required=false, defaultValue="1")int page) 
					throws IllegalStateException, IOException {
			BoardDTO board = bs.updateShow(b_number);
			model.addAttribute("board", board);
			model.addAttribute("page", page);
			return "board/update";
		}
		
		//수정후 detail.jsp 출력
		@RequestMapping(value="/board/update", method=RequestMethod.POST)
		public String update(@ModelAttribute BoardDTO board, Model model,
				@RequestParam(value="page", required=false, defaultValue="1")int page) throws IllegalStateException, IOException {	
			bs.update(board);
			return "redirect:/board/detail?b_number=" + board.getB_number() + "&page=" + page;	
		}
		
		// 검색기능
		@RequestMapping(value="search", method=RequestMethod.GET)
		public String search(@RequestParam("searchtype")String searchtype, @RequestParam("keyword") String keyword, Model model) {
			List<BoardDTO> bList = bs.search(searchtype, keyword);
			model.addAttribute("bList",bList);
			return "board/findAll";
		}

}
