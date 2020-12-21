package com.musicstage.spring.common.email.service;

public interface MailService {

	public boolean send(String subject, String text, String from, String to);
}
