package com.musicstage.spring.member.model.vo;

public enum AuthorityType {
	AMATEUR_ROLL(1), PRO_ROLL(2), ADMIN_ROLL(99);

	private final int authority;

	AuthorityType(int authority) {
		this.authority = authority;
	}
	
	public int getValue() {
		return this.authority;
	}
	
	public static AuthorityType valueOf(int value) {
		switch(value) {
			case 1: return AuthorityType.AMATEUR_ROLL;
			case 2: return AuthorityType.PRO_ROLL;
			case 3: return AuthorityType.ADMIN_ROLL;
			default: throw new AssertionError("Unknown : authority" + value);
		}
	}
}
