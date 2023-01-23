package com.multi.erp.board;

import java.util.List;
//dao의 메소드를 호출
public interface BoardService {
	//게시글등록  - tbboard테이블과 board_file테이블에 저장
	int insert(BoardDTO board,List<BoardFileDTO> boardfiledtolist);
	//게시글목록보기
	List<BoardDTO> boardList();
	//게시글상세조회
	BoardDTO getBoardInfo(String board_no);
	//게시글수정
	int update(BoardDTO board);
	//게시글삭제
	int delete(String board_no);
	//제목으로 검색
	List<BoardDTO> search(String data);
	//제목,작성자, 본문, 작성일별로 검색
	List<BoardDTO> search(String tag,String data);
	List<BoardDTO> findByCategory(String category);
	
	//게시글을 상세보기한 경우 보여질 업로드한 파일의 목록 조회
	List<BoardFileDTO> getFileList(String boardno);
	BoardFileDTO getFile(BoardFileDTO inputdata);
}
