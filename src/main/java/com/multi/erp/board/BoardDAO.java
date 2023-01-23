package com.multi.erp.board;
import java.util.List;

import org.springframework.stereotype.Repository;
//mybatis의 SqlSession을 이용해서 작업
public interface BoardDAO {
	//게시글등록 - db에 처리
	int insert(BoardDTO board);
	//게시글목록보기 - db에 처리
	List<BoardDTO> boardList();
	//게시글상세조회 - db에 처리
	BoardDTO read(String board_no);
	//게시글수정 - db에 처리
	int update(BoardDTO board);
	//게시글삭제 - db에 처리
	int delete(String board_no);
	//제목으로 검색
	List<BoardDTO> search(String data);
	//제목,작성자, 본문, 작성일별로 검색
	List<BoardDTO> search(String tag,String data);
	List<BoardDTO> findByCategory(String category);
	
	//=================첨부파일을 조회하기 위한 기능=========================
	
	//첨부파일을 저장하기 위한 메소드	
	int insertFile(List<BoardFileDTO> boardfiledtolist);
	//게시글을 상세보기한 경우 보여질 업로드한 파일의 목록 조회
	List<BoardFileDTO> getFileList(String boardno);
	BoardFileDTO getFile(BoardFileDTO inputdata);
}




