package com.icia.memberboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.repository.CommentRepository;



@Service
public class CommentService implements CommentServiceInterface {

	@Autowired
	private CommentRepository cr;
	
	@Override
	public void save(CommentDTO comment) {
		cr.save(comment);
		
	}
	
	@Override
	public List<CommentDTO> findAll(long b_number){
		return cr.findAll(b_number);
	
}
}