package egovframework.example.sendmail.web;

import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.sendmail.service.AddressVO;
import egovframework.example.sendmail.service.MailService;
import egovframework.example.sendmail.service.MailVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/*
< 컨트롤러 수정해도 서버에서 자동 빌드가 안되고 웹페이지는 Not Found 뜰떄... >
	프로젝트 우클릭 > 빌드Path > missing인 부분 remove(이번엔 test 폴더를 지웠는데 여기에 빌드path가 잡혀 있어서 안됬던거임)
	잘 안될때 결과창 아래에 Problems 꼭 보기!!!
*/

@Controller  
public class MailController {
	
	final static String portNumber = "25";

	
	/** MailService */
	@Resource(name = "mailService")
	private MailService mailService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	// PropertyService는 resources > spring의 여러 .xml파일들의 값들을 가지고 올 수 있게 한다.
	
	@RequestMapping(value = "/main.do")
	public String main(ModelMap model) throws Exception {
//		System.out.println("sendmail의 main 호출");
		return "sendmail/main"; 
	}
	
	@RequestMapping(value = "/loginPage.do")
	public String loginPage(ModelMap model) throws Exception {
//		System.out.println("sendmail의 login 호출");  
		return "sendmail/login";        
	}

	@RequestMapping(value = "/login.do")
	public String login(@RequestParam("user_id") String user_id,
			          	@RequestParam("password") String password, 
			          	HttpServletRequest request,
			          	RedirectAttributes r, ModelMap model) throws Exception {
		
		System.out.println("컨트롤러 /login.do");
		MailVO mailVO = new MailVO();
		mailVO.setUserId(user_id);
		mailVO.setPassword(password);
		String user_name = mailService.selectLoginCheck(mailVO);
//		System.out.println("user_name:" + user_name);
		
		if ( user_name != null && !"".equals(user_name)) {
			request.getSession().setAttribute("userId", user_id);
			request.getSession().setAttribute("userName", user_name);  // Mail_SQL에서 name 가져오게끔 설정.
			user_name = URLEncoder.encode(user_name, "UTF-8");	// ★ 한글을 파라미터로 보낼시 ??? 인코딩 애러처리
			
			return "sendmail/main";
//			return "redirect:/inbox.do?userName=" + user_name;  // 로그인한 사용자의 수신함을 출력하기 위해서 파라미터 사용.
			// 이때 MailVO에서 userName을 변수로 선언하고 getter와 setter를 만들어줘야 정상작동한다. 파라미터로 가는데도 VO가 필요한듯?
		} else {
			request.getSession().setAttribute("userId", "");
			request.getSession().setAttribute("userName", "");
			model.addAttribute("msg", "사용자 정보가 올바르지 않습니다.");
//			r.addFlashAttribute("msg", "사용자 정보가 올바르지 않습니다.");
			System.out.println("여기는 오나??");
			return "sendmail/login";
		}
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(ModelMap model, HttpServletRequest request) throws Exception {
		request.getSession().invalidate();
//		return "board/list";
		return "redirect:/loginPage.do";
	}
	
	@RequestMapping(value = "/wholebox.do")
	public String wholebox(@ModelAttribute("mailVO") MailVO mailVO, 
							ModelMap model) throws Exception {
		List<?> list = mailService.selectMailList(mailVO);
		model.addAttribute("resultList", list);
		return "sendmail/wholebox";        
	}
	
	
	// inbox받은메일함 + mailbox메일함의 셀렉트박스 (boxName 보이도록)
	@RequestMapping(value = "/inbox.do")
	public String inbox(@ModelAttribute("mailVO") MailVO mailVO, 
						HttpServletRequest request, ModelMap model) throws Exception {
		
		String userId = request.getSession().getAttribute("userId").toString();   //mailbox메일함의 셀렉트박스
		mailVO.setUserId(userId);										
		List<?> list2 = mailService.selectMboxAdd(mailVO);				
		model.addAttribute("resultList2", list2);						

		List<?> list = mailService.selectInboxList(mailVO);
		model.addAttribute("resultList", list); 
		return "sendmail/inbox";        
	}
	
	@RequestMapping(value = "/outbox.do")
	public String outbox(@ModelAttribute("mailVO") MailVO mailVO,
							ModelMap model) throws Exception {
		List<?> list = mailService.selectOutboxList(mailVO);
		model.addAttribute("resultList", list);
		return "sendmail/outbox";        
	}
	
	
//	wholebox 상세 페이지
	@RequestMapping(value = "/detailwholebox.do")
	public String detailwholebox(@ModelAttribute("mailVO") MailVO mailVO, 
								HttpServletRequest request, 
								ModelMap model) throws Exception {
		mailVO = mailService.detailwholebox(mailVO); 
		model.addAttribute("mailVO", mailVO);   
		System.out.println("전체메일함 상세");
		return "sendmail/detailwholebox";
	}
	
		
	@RequestMapping(value = "/writePage.do")
	public String writePage(@ModelAttribute("mailVO") MailVO mailVO, 
							ModelMap model) throws Exception {
		return "sendmail/write";       
	}
	
	
	@RequestMapping(value = "/write.do")
	public String write(
						HttpServletRequest request, HttpServletResponse response,
						@RequestParam("receiverAddress") String receiverAddress,
			          	@RequestParam("title") String title, 
			          	@RequestParam("contents") String contents, 
						ModelMap model) throws Exception {
		String userId = request.getSession().getAttribute("userId").toString();
		String senderAddress = userId + "@durianict.co.kr";
		String userName = request.getSession().getAttribute("userName").toString();
		
		MailVO mailVO = new MailVO();
		mailVO.setTitle(title);
		mailVO.setContents(contents);
		mailVO.setSender(userName);
		mailVO.setReceiver(receiverAddress);
	    connectSMTP();
	    createMail(senderAddress, receiverAddress, title, contents);
	    
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    if (sendMail()) {
	    	mailService.insertMail(mailVO);
			out.println("<script>alert('메일 발송 성공!'); </script>");
			out.flush();		
			return "sendmail/outbox";
	    } else {
	    	out.println("<script>alert('메일 발송 실패..'); </script>");
			out.flush();		
	    	return "sendmail/outbox";
	    }
	    
	}
	
	
	// 메일쓰기
	
	public static void connectSMTP() throws UnknownHostException{
		
		InetAddress inetAddress = InetAddress.getLocalHost();
		String ipAddress = inetAddress.getHostAddress();

	    Properties prop = new Properties();

	    //사내 메일 망일 경우 smtp host 만 설정해도 됨 (특정 포트가 아닐경우)
	    prop.put("mail.smtp.host", ipAddress);
	    prop.put("mail.smtp.starttls.enable","true");
	    prop.put("mail.smtp.port", portNumber);

	    Session session = Session.getDefaultInstance(prop, null);
	    try{
	     message = new MimeMessage(session);
	    } catch (Exception e) {
	     e.printStackTrace();
	    }
	}
	
	public static Message message = null;
	
	public static void createMail(String senderAddress, String receiverAddress, String title, String contents){
	   
	    MimeBodyPart mbp = new MimeBodyPart();

	    try{
	    	
		     // 보내는 메일 주소
		     message.setFrom(new InternetAddress(senderAddress));
		     
		     // 받는 사람 메일주소
		     InternetAddress[] receive_address = {new InternetAddress(receiverAddress)};
		     message.setRecipients(RecipientType.TO, receive_address);

		     // 메일 제목 넣기
		     message.setSubject(title);
		     
		     // 메일 본문을 넣기
		     message.setContent(contents, "text/html;charset=utf-8"); // charset 안넣으면 ????로 내용 전달됨.

		     // 보내는 날짜
		     message.setSentDate(new Date());
		     
	   } catch (Exception e){
		    	e.printStackTrace();
	   }
	}
	
	
	public static boolean sendMail(){

	    try {
	     Transport.send(message);
	     System.out.println("메일전송 성공 !!");
	     return true;

	    } catch (MessagingException e) {
	     System.out.println("메일전송 실패 !!");
	     e.printStackTrace();
	     return false;
	    }
	}
	
	
	
		
//	메일함 입력 
	@RequestMapping(value = "/insertMailbox.do")
	public String insertMailbox(@ModelAttribute("mailVO") MailVO mailVO, 			
								HttpServletRequest request) throws Exception {
		
		String userName = request.getSession().getAttribute("userName").toString();	
		String userId = request.getSession().getAttribute("userId").toString();
		mailVO.setUserName(userName);
		mailVO.setUserId(userId);
		System.out.println("userName : " + userName);
		System.out.println("userId : " + userId);
		userName = URLEncoder.encode(userName, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		userId = URLEncoder.encode(userId, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		
		mailService.insertMailbox(mailVO);
		System.out.println("메일함 입력");
		return "redirect:/mboxaddlist.do?userName=" + userName;
	}

	
	
//		메일함추가하는 목록 조회 페이지	
	@RequestMapping(value = "/mboxaddlist.do")
	public String mboxaddlist(@ModelAttribute("mailVO") MailVO mailVO,
						HttpServletRequest request, ModelMap model) throws Exception {
		

		String userId = request.getSession().getAttribute("userId").toString();
		mailVO.setUserId(userId);
		userId = URLEncoder.encode(userId, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		
		List<?> list = mailService.mboxaddlist(mailVO);
		System.out.println("값들 : " + list);  
		model.addAttribute("resultList", list);   // list를 addresslist.jsp로 보낼때 "resultList"에 담아 model.addAttribute를 씀
		return "sendmail/mboxaddlist";       	  // 즉, 컨트롤러에서 작업한 내용을 jsp파일로 전달할때 ModelMap을 쓴다.	
	}
	
	
	//	메일함 상세 (수정페이지)
	@RequestMapping(value = "/detailmailbox.do")
	public String detailmailbox(@ModelAttribute("mailVO") MailVO mailVO, 
								HttpServletRequest request, 
								ModelMap model) throws Exception {
		mailVO = mailService.detailmailbox(mailVO); 
		model.addAttribute("mailVO", mailVO);   
		System.out.println("메일함 수정페이지");
		return "sendmail/detailmailbox";
	}
	
	
	
	//	메일함 수정 
	@RequestMapping(value = "/updateMailbox.do")
	public String updateMailbox(@ModelAttribute("mailVO") MailVO mailVO,
								HttpServletRequest request) throws Exception { 
		
		String userName = request.getSession().getAttribute("userName").toString();		
		mailVO.setUserName(userName);
		System.out.println("userName : " + userName);
		userName = URLEncoder.encode(userName, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		
		mailService.updateMailbox(mailVO);
		System.out.println("메일함 수정");
		return "redirect:/mboxaddlist.do?userName=" + userName;
			
	}
	
	
	//	메일함 삭제	
	@RequestMapping(value = "/deleteMailbox.do")   
	public String deleteMailbox(@ModelAttribute("mailVO") MailVO mailVO,
								HttpServletRequest request) throws Exception {
		
		String userName = request.getSession().getAttribute("userName").toString();		
		mailVO.setUserName(userName);
		System.out.println("userName : " + userName);
		userName = URLEncoder.encode(userName, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		
		mailService.deleteMailbox(mailVO);
		System.out.println("메일함 삭제");
		return "redirect:/mboxaddlist.do?userName=" + userName;

	}	
	
	//	메일 검색조회 페이지
	@RequestMapping(value = "/searchmail.do")
	public String searchmail(@ModelAttribute("mailVO") MailVO mailVO,
						HttpServletRequest request, ModelMap model) throws Exception {
		
		String userId = request.getSession().getAttribute("userId").toString();
		mailVO.setUserId(userId);
//		userId = URLEncoder.encode(userId, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.				
		List<?> list2 = mailService.selectMboxAdd(mailVO);
//		System.out.println("값들 : " + list);  
		model.addAttribute("resultList2", list2);  
	
		List<?> list = mailService.searchmail(mailVO);
//		System.out.println("값들 : " + list);  
		model.addAttribute("resultList", list);   // list를 addresslist.jsp로 보낼때 "resultList"에 담아 model.addAttribute를 씀
		return "sendmail/searchmail";       	  // 즉, 컨트롤러에서 작업한 내용을 jsp파일로 전달할때 ModelMap을 쓴다.	
	}
	 	
	
	
	//주소록
// 		주소록 목록 페이지	
	@RequestMapping(value = "/addresslist.do")
	public String addresslist(@ModelAttribute("addressVO") AddressVO addressVO,
							ModelMap model) throws Exception {
		
		List<?> list = mailService.addresslist(addressVO);     
//			System.out.println("값들 : " + list);  
		model.addAttribute("resultList", list);   // list를 addresslist.jsp로 보낼때 "resultList"에 담아 model.addAttribute를 씀
		return "sendmail/addresslist";       	  // 즉, 컨트롤러에서 작업한 내용을 jsp파일로 전달할때 ModelMap을 쓴다.	
	}
	
// 		주소록 등록 페이지
	@RequestMapping(value = "/addressbook.do")
	public String addressbook(ModelMap model) throws Exception {
		return "sendmail/addressbook"; 
	}
			
	
// 		주소록 입력 
	@RequestMapping(value = "/insertAddress.do")
	public String insertAddress(@ModelAttribute("addressVO") AddressVO addressVO, 			
								HttpServletRequest request) throws Exception {
		
		String userName = request.getSession().getAttribute("userName").toString();		
		addressVO.setUserName(userName);
		System.out.println("userName : " + userName);
		userName = URLEncoder.encode(userName, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		
		mailService.insertAddress(addressVO);
		System.out.println("주소록입력");
		return "redirect:/addresslist.do?userName=" + userName;
	}

	
	
//		주소록 상세 (수정페이지)
	@RequestMapping(value = "/detailaddress.do")
	public String detailAddress(@ModelAttribute("addressVO") AddressVO addressVO, 
								HttpServletRequest request, 
								ModelMap model) throws Exception {
		addressVO = mailService.detailAddress(addressVO); 
		model.addAttribute("addressVO", addressVO);   
		System.out.println("주소록 수정페이지");
		return "sendmail/detailaddress";
	}
		
	
//		주소록 수정 
	@RequestMapping(value = "/updateAddress.do")
	public String updateAddress(@ModelAttribute("addressVO") AddressVO addressVO,
								HttpServletRequest request) throws Exception { 
		
		String userName = request.getSession().getAttribute("userName").toString();		
		addressVO.setUserName(userName);
		System.out.println("userName : " + userName);
		userName = URLEncoder.encode(userName, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		
		mailService.updateAddress(addressVO);
		System.out.println("주소록수정");
		return "redirect:/addresslist.do?userName=" + userName;
			
	}
	
	
//		주소록 삭제	
	@RequestMapping(value = "/deleteAddress.do")   
	public String deleteAddress(@ModelAttribute("addressVO") AddressVO addressVO,
								HttpServletRequest request) throws Exception {
		
		String userName = request.getSession().getAttribute("userName").toString();		
		addressVO.setUserName(userName);
		System.out.println("userName : " + userName);
		userName = URLEncoder.encode(userName, "UTF-8");  //이거 필수! 없으면 값 ???로 옴.
		
		mailService.deleteAddress(addressVO);
		System.out.println("주소록삭제");
		return "redirect:/addresslist.do?userName=" + userName;
		

	}	
	
	
	

	
	 
}





	







