package com.icia.memberboard.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	
	private long m_number;
	private String m_id; 
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_phone;
	
	private MultipartFile m_file; // jsp에서 컨트롤러로 넘어 올 때 파일 자체를 담는 필드
	//DB에 파일을 담는 것이 아니라 파일 이름을 담는것. 파일은 별도의 경로에 저장
	
	private String m_filename; // 
}
