package com.kh.team.util;

public enum BenefitCode {
	
	DRIVER_VVIP("1001","700"),DRIVER_VIP("1002","400"),DRIVER_GOLD("1003","300"),DRIVER_SILVER("1004","100"),
	DRIVER_WHITE("1005","0"),
	
	PASSENGER_VVIP("1006","500"),PASSENGER_VIP("1007","250"),PASSENGER_GOLD("1008","150"),PASSENGER_SILVER("1009","100"),
	PASSENGER_WHITE("1010","0");
	final private String code;
	final private String point;
	private BenefitCode(String code,String point) {
		this.code= code;
		this.point=point;
	}
	public String getPoint() {
		return point;
	}
	public String getCode() {
		return code;
	}

}
