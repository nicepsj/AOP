package com.multi.erp.resourcemanager.mongo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResouceManagerController {
	@RequestMapping("/resmgr/main")
	public String resMain(Model model) {
		return "res/main";
	}
}
