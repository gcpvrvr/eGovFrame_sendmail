package egovframework.example.sample.sendmail.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.sendmail.service.SendmailService;
import egovframework.example.sample.sendmail.service.SendmailVO;

@Controller
public class SendmailController {

	@RequestMapping(value = "/main.do")
	public String main() throws Exception {
		return "/sendmail/main";
	}
	

	@RequestMapping(value = "/mailtable.do")
	public String mailtable() throws Exception {
		return "/sendmail/mailtable";
	}
	

	@RequestMapping(value = "/login.do")
	public String login() throws Exception {
		return "/sendmail/login";
	}
	
	
	@RequestMapping(value = "/mail.do")
	public String mail() throws Exception {
		return "/sendmail/mail";
	}
	
	
	
	
	
	@Resource(name = "sendmailService")
	private SendmailService sendmailService;
	
	@RequestMapping(value = "/main.do")
	public String list(@ModelAttribute("SendmailVO") SendmailVO boardVO, ModelMap model, SendmailVO sendmailVO) throws Exception {

	List<?> list = sendmailService.selectSendmailList(sendmailVO);
	model.addAttribute("resultList", list);

	int totCnt = sendmailService.selectSendmailListTotCnt(sendmailVO);

	return "/sendmail/main";
	}


}
