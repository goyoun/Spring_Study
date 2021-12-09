package com.icia.memberboard.service;

import java.io.IOException;
import java.util.List;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.PageDTO;

public interface BoardServiceInterface {

	void save(BoardDTO board);

	List<BoardDTO> findAll();

	List<BoardDTO> pagingList(int page);

	PageDTO paging(int page);

	List<BoardDTO> search(String searchtype, String keyword);

	void saveFile(BoardDTO board) throws IllegalStateException, IOException;

	BoardDTO findById(long b_number);

	void delete(long b_number);

	BoardDTO updateShow(long b_number);

	void update(BoardDTO board) throws IllegalStateException, IOException;

}
