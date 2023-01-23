package com.multi.erp.etc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.erp.board.BoardDTO;
import com.multi.erp.board.BoardService;

//@RestController
@Controller
@ResponseBody
@RequestMapping("/json")
public class JSONTestController {
	BoardService service;
	@Autowired
	public JSONTestController(BoardService service) {
		super();
		this.service = service;
	}
	@RequestMapping("/index")
	public String indexPage() {
		return "index";
	}
	//@ResponseBody는 웹페이지를 응답하지 않고 response body에 스트링을 추가해서 response하겠다는 의미
	//=> 더 이상 뷰를 응답하지 않는다.
	@RequestMapping("/getString")
	public String responseString() {
		return "json";
	}
	@RequestMapping("/getJsonObj")
	public  BoardDTO responseObj() {
		return service.getBoardInfo("10");
	}
	@RequestMapping("/getJsonArr")
	public List<BoardDTO> responseJsonArr() {
		return service.findByCategory("all");
	}
	
}















