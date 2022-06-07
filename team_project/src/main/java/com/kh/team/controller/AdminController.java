
package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value="/home", method= RequestMethod.GET)
	public String homeAdmin() {
		System.out.println("asdasd");
		return "admin/home_admin";
	}



	@RequestMapping(value="/event", method= RequestMethod.GET)
	public String eventList() {
		return "admin/eventManagement";
	}
	

}

