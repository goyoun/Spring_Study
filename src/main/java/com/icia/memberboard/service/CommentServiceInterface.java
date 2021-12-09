package com.icia.memberboard.service;

import java.util.List;

import com.icia.memberboard.dto.CommentDTO;

public interface CommentServiceInterface {

	void save(CommentDTO comment);

	List<CommentDTO> findAll(long b_number);

}
