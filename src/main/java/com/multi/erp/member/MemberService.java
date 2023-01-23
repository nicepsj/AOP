package com.multi.erp.member;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface MemberService {
	List<MemberDTO> getTreeEmpList(String deptno);
	int insert(MemberDTO user,MultipartFile file,String realpath,String filename);
	public boolean idCheck(String id);
	List<MemberDTO> getMemberList();
	int delete(String id);
	MemberDTO read(String id);
	List<MemberDTO> search(String column, String search
					,String pass);
	int update(MemberDTO user);
	MemberDTO login(MemberDTO loginUser);
}
