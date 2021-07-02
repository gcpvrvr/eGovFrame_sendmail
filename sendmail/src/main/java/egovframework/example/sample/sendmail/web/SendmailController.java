package egovframework.example.sample.sendmail.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
