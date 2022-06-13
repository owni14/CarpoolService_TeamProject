package com.kh.team.vo;

public class CarInfoVo {
	private String ci_code;
	private String ci_name;
	private String ci_brand;
	private String ci_brand_img;
	private String ci_car_img;
	private int ci_max_people;
	
	public CarInfoVo() {
		super();
	}
	
	public CarInfoVo(String ci_name, String ci_brand, String ci_brand_img, String ci_car_img, int ci_max_people) {
		super();
		this.ci_name = ci_name;
		this.ci_brand = ci_brand;
		this.ci_brand_img = ci_brand_img;
		this.ci_car_img = ci_car_img;
		this.ci_max_people = ci_max_people;
	}

	public CarInfoVo(String ci_code, String ci_name, String ci_brand, String ci_brand_img, String ci_car_img,
			int ci_people_count) {
		super();
		this.ci_code = ci_code;
		this.ci_name = ci_name;
		this.ci_brand = ci_brand;
		this.ci_brand_img = ci_brand_img;
		this.ci_car_img = ci_car_img;
		this.ci_max_people = ci_people_count;
	}

	public String getCi_code() {
		return ci_code;
	}

	public void setCi_code(String ci_code) {
		this.ci_code = ci_code;
	}

	public String getCi_name() {
		return ci_name;
	}

	public void setCi_name(String ci_name) {
		this.ci_name = ci_name;
	}

	public String getCi_brand() {
		return ci_brand;
	}

	public void setCi_brand(String ci_brand) {
		this.ci_brand = ci_brand;
	}

	public String getCi_brand_img() {
		return ci_brand_img;
	}

	public void setCi_brand_img(String ci_brand_img) {
		this.ci_brand_img = ci_brand_img;
	}

	public String getCi_car_img() {
		return ci_car_img;
	}

	public void setCi_car_img(String ci_car_img) {
		this.ci_car_img = ci_car_img;
	}

	public int getCi_max_people() {
		return ci_max_people;
	}

	public void setCi_max_people(int ci_max_people) {
		this.ci_max_people = ci_max_people;
	}

	@Override
	public String toString() {
		return "CarInfoVo [ci_code=" + ci_code + ", ci_name=" + ci_name + ", ci_brand=" + ci_brand + ", ci_brand_img="
				+ ci_brand_img + ", ci_car_img=" + ci_car_img + ", ci_max_people=" + ci_max_people + "]";
	}
	
}
