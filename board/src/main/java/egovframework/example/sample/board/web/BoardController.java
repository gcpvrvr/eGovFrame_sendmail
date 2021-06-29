package egovframework.example.sample.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping(value = "/mainList.do")
	public String list(ModelMap model) throws Exception {
	return "/board/mainList";
	}
}
