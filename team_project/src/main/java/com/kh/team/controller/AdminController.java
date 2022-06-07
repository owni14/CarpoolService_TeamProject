
package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value="/home", method= RequestMethod.GET)
	public String homeAdmin() {

		return "admin/home_admin";
	}



	@RequestMapping(value="/event", method= RequestMethod.GET)
	public String eventList() {
		return "admin/eventManagement";
	}
	
	@RequestMapping(value = "/member_management", method = RequestMethod.GET)
	public String memberManagement() {
		return "admin/memberManagement";
	}
	
	

}

