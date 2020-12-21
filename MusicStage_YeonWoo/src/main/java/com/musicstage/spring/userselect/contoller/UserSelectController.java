package com.musicstage.spring.userselect.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.musicstage.spring.friendselect.service.friendService;
import com.musicstage.spring.member.model.vo.Member;


@Controller
@EnableAsync
public class UserSelectController {
private Logger logger = LoggerFactory.getLogger(UserSelectController.class);
	
@Autowired
private UserSelectService fmailService;

@RequestMapping(value = "userpwd.xo", method = RequestMethod.GET)
@ResponseBody
public String sendSimpleMail(@RequestParam ("userEmail") String email ,@RequestParam("userid") String userid, HttpServletResponse response ) throws IOException {
	response.setContentType("application/json; charset=UTF-8");
	
	confirmNumber Number =  new confirmNumber();
	String bbb = Number.scretNumber();
	
	System.out.println(email);
    int result = fmailService.sendMail(email,bbb,"안녕");
    Member f = new Member();
    	String ePWD = Number.scretNumber();
    f.setPassword(ePWD);	
    f.setEmail(email);
    f.setUserId(userid);
    int m = fmailService.findPwd(f);
    String pwd = null;
    if(m >0) {
    	pwd =  ePWD;
    }
   
	JSONObject job = new JSONObject();
	job.put("Pwd",pwd );
	job.put("num", result);
	job.put("secret",bbb );
	
	return job.toJSONString();
}

}
