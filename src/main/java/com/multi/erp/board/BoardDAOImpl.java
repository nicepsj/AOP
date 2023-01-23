package com.multi.erp.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	//Mybatis의 핵심클래스를 이용해서 sql문을 실행
	SqlSession sqlSession;
	public BoardDAOImpl() {
		
	}
	@Autowired
	public BoardDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int insert(BoardDTO board) {
	//	System.out.println("====================dao=======================");
		return sqlSession.insert("com.multi.erp.board.write", board);
	}

	

	@Override
	public BoardDTO read(String board_no) {
		return sqlSession.selectOne("com.multi.erp.board.read", board_no);
	}

	@Override
	public int update(BoardDTO board) {
		return sqlSession.update("com.multi.erp.board.update", board);
	}

	@Override
	public int delete(String board_no) {
		return sqlSession.delete("com.multi.erp.board.delete",board_no);
	}
	@Override
	public List<BoardDTO> search(String data) {
		return sqlSession.selectList("com.multi.erp.board.search",data);
	}
	@Override
	public List<BoardDTO> search(String tag, String data) {
		//System.out.println(tag+",======================="+data);
		Map<String,String> map =new HashMap<String, String>();
		map.put("tag", tag);
		map.put("data", data);
		return sqlSession.selectList("com.multi.erp.board.dynamicSearch", map);
	}
	@Override
	public List<BoardDTO> findByCategory(String category) {
		return sqlSession.selectList("com.multi.erp.board.categorySelect",
				category);
	}
	@Override
	public List<BoardDTO> boardList() {
		//System.out.println("====================dao=======================");
		List<BoardDTO> list = sqlSession.selectList("com.multi.erp.board.selectall");
		
		//System.out.println("====================dao끝=======================");
		return  list;
	}
	@Override
	public int insertFile(List<BoardFileDTO> boardfiledtolist) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.multi.erp.board.fileinsert", boardfiledtolist);
	}
	@Override
	public List<BoardFileDTO> getFileList(String boardno) {
		return sqlSession.selectList("com.multi.erp.board.fileselect", boardno);
	}
	@Override
	public BoardFileDTO getFile(BoardFileDTO inputdata) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.multi.erp.board.getfileinfo", inputdata);
	}
}















