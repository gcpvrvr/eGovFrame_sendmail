package egovframework.example.sample.board.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.board.service.BoardService;
import egovframework.example.sample.board.service.BoardVO;
import egovframework.example.sample.board.service.impl.BoardMapper;

@Controller
public class BoardController {

	@RequestMapping(value = "/mgmt.do", method =RequestMethod.GET)
	public String mgmt(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	     Calendar c1 = Calendar.getInstance();
	     String strToday = sdf.format(c1.getTime());
	     System.out.println("Today" + strToday);

	//BoardVO boardVO = new BoardVO();
	     boardVO.setIndate(strToday);
	     boardVO.setWriter(request.getSession().getAttribute("userId").toString());
	     boardVO.setWriterNm(request.getSession().getAttribute("userName").toString());

	// 서버에서 가져오기
	if(request.getAttribute("idx") != null) {
	     boardVO = boardService.selectBoard(boardVO);
	     model.addAttribute("boardVO", boardVO);
	}

	// 서버에서 가져온값을 화면에 맵핑

	return "/board/mgmt";
	}
	
	@RequestMapping(value = "/mgmt.do", method=RequestMethod.POST)
	public String mgmt2(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {

	boardService.insertBoard(boardVO);
	return "redirect:/mainList.do";
	}

	@RequestMapping(value = "/view.do")
	public String view(ModelMap model) throws Exception {
		return "/board/view";
	}

	@RequestMapping(value = "/login.do")
	public String login(@RequestParam("user_id") String user_id,  
	@RequestParam("password") String password,  
	ModelMap model, HttpServletRequest request) throws Exception {
	// HttpServletRequest request
	// String aa = request.getParameter("user_id");  
	System.out.println("userid:"+user_id);  
	System.out.println("password:"+password);  

	BoardVO boardVO = new BoardVO();
	boardVO.setUserId(user_id);
	boardVO.setPassword(password);
	String user_name = boardService.selectLoginCheck(boardVO);

	if(user_name != null && !"".equals(user_name)) {
	 request.getSession().setAttribute("userId", user_id);
	 request.getSession().setAttribute("userName", user_name);
	 }else {
	 request.getSession().setAttribute("userId", "");
	 request.getSession().setAttribute("userName", "");
	 model.addAttribute("msg", "사용자 정보가 올바르지 않습니다.");
	 }
	 return "redirect:mainList.do";

	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(ModelMap model, HttpServletRequest request) throws Exception {
	request.getSession().invalidate();
	return "redirect:mainList.do";
	}

	@RequestMapping(value = "/mainList.do")
	public String list(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {

	List<?> list = boardService.selectBoardList(boardVO);
	//resultlist에 list를 넣음
	model.addAttribute("resultList", list);

	int totCnt = boardService.selectBoardListTotCnt(boardVO);

	return "/board/mainList";
	}

	@Resource(name = "boardService")
	private BoardService boardService;

	// TODO mybatis 사용
	@Resource(name="boardMapper")
	private BoardMapper boardDAO;


}



