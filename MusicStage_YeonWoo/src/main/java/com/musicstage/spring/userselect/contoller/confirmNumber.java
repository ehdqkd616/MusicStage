package com.musicstage.spring.userselect.contoller;

public class confirmNumber {

	private String Number;

	public confirmNumber() {
	}
	
	
	public  String scretNumber() {
		StringBuffer sb = new StringBuffer();
		int num = 0;
		for(int i = 0; i<6; i++) {
			int vv = (int)(Math.random()*200)+1;
					if(vv>96 &&  vv < 123) {
						char c = (char)vv;
						sb.append(c);
						num += vv;
					}else {
						i--;
						num += vv;
					}
		}
		
		sb.append(num);
		
		String NNum =	sb.toString();
		return NNum;
		
	}

	

	@Override
	public String toString() {
		return "confirmNumber [Number=" + Number + "]";
	}

}
