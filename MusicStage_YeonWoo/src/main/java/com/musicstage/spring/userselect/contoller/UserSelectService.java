package com.musicstage.spring.userselect.contoller;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.musicstage.spring.friendselect.dao.friendDAO;
import com.musicstage.spring.member.model.vo.Member;

@Service("fmailService")
public class UserSelectService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Inject 
	private JavaMailSender mailSender;
	
	public int sendMail(String string, String string2, String string3) {
		System.out.println(string);
		System.out.println(string2);
		System.out.println(string3);
		
		int result = 0;
		MimeMessage message = mailSender.createMimeMessage();
		String htmlStr = "안녕하세요";
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			
			messageHelper.setCc(string);
			messageHelper.setFrom("abhuy031@gmail.com");
			
			messageHelper.setSubject("안녕하세요 스테이지 입니다.");
			messageHelper.setTo("abhuy031@gmail.com");
			messageHelper.setText(string2);
			mailSender.send(message);
			System.out.println("bbb");
			result = 1;
		} catch (MessagingException e) {
			result = -1;
			e.printStackTrace();
		}
		return result;
		
	}
	public int findPwd(Member f) {
		friendDAO ff = new friendDAO();
		System.out.println("ggg");
		return ff.findPwd(sqlSession,f);
	}
}
