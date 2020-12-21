package com.musicstage.spring.member.model.exception;

public class MemberException extends RuntimeException {

	public MemberException() {}
	public MemberException(String msg) {
		super(msg);
	}
}
