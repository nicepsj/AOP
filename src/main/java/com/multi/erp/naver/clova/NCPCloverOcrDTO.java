package com.multi.erp.naver.clova;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NCPCloverOcrDTO {
	private String id;//요청한 사람의 아이디
	private String dept;//요청한 사람의 부서아이디
	private String state;//영수증처리유무
	
	private MultipartFile file;//영수증이미지
	public NCPCloverOcrDTO() {
		
	}
	public NCPCloverOcrDTO(String id, String dept, String state, Date regDate, MultipartFile file) {
		super();
		this.id = id;
		this.dept = dept;
		this.state = state;

		this.file = file;
	}
	public NCPCloverOcrDTO(String id, String dept, Date regDate, MultipartFile file) {
		super();
		this.id = id;
		this.dept = dept;

		this.file = file;
	}
	
	@Override
	public String toString() {
		return "NCPCloverOcrDTO [id=" + id + ", dept=" + dept + ", state=" + state +  ", file="
				+ file + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
