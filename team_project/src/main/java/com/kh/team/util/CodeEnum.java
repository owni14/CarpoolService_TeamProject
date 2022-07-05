package com.kh.team.util;

public enum CodeEnum {
	// 상수("연관시킬 문자") <- 이땐 줄 끝에 세미콜론 (;) 붙이기.
	EVENTBEST("1001"), EVENTGENERAL("1002"), EVENTLOWEST("1003")
	,SYSTEMDRIVERPOINT("1004"),SYSTEMALL("1005"),GM("1001"),
	CS("1002"),CS2("1003"),CM("1004"),
	DRIVERVVIP("1001"),DRIVERVIP("1002"),
	DRIVERGOLD("1003"),DRIVERSILVER("1004"),DRIVERWHITE("1005");
	
	
	final private String code;
	private CodeEnum(String code) {
		this.code = code;
	}
	
	public String getCode() {
		return code;
	}
	
	
	
}

