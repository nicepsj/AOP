package com.multi.erp.etc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.erp.board.BoardDTO;
import com.multi.erp.board.BoardService;

@Controller
@RequestMapping("/ajax")
public class AjaxTestController {
	BoardService service;
	@Autowired
	public AjaxTestController(BoardService service) {
		super();
		this.service = service;
	}
	//처리 후 뷰를 response하는 메소드
	@RequestMapping("/noajax")
	public String noajax(String id,Model model) {
		String msg = "";
		if(id.equals("jang")) {
			msg = "사용불가능 아이디";
		}else {
			msg = "사용가능 아이디";
		}
		model.addAttribute("msg", msg);
		return "etcview/ajax";
	}
	
	//처리 후 Response Body에 처리결과 문자열을 저장해서 보내기
	@RequestMapping(value = "/ajaxtest01",produces = "application/text;charset=utf-8")
	@ResponseBody
	public String ajaxtest(String id) {
		String msg = "";
		if(id.equals("jang")) {
			msg = "사용불가능 아이디";
		}else {
			msg = "사용가능 아이디";
		}
		return msg;
	}
	@RequestMapping(value = "/exam01"
			,produces = "application/text;charset=utf-8")
	@ResponseBody
	public  String ajaxexam(String boardno) {
		return service.getBoardInfo(boardno).toString();
	}
	
	@RequestMapping(value = "/exam02/getjsondata"
			,produces = "application/json;charset=utf-8")
	@ResponseBody
	public  BoardDTO ajax_json_exam(String boardno) {
		return service.getBoardInfo(boardno);
	}
}






























