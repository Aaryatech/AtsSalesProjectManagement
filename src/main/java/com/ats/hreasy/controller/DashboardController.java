package com.ats.hreasy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Scope("session")
public class DashboardController {

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "welcome2";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "home";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/welcome1", method = RequestMethod.GET)
	public String welcome1(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "welcome1";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/tagList", method = RequestMethod.GET)
	public String tagList(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "tagList";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/addNewTag", method = RequestMethod.GET)
	public String addNewTag(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "addNewTag";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/addLead", method = RequestMethod.GET)
	public String addLead(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "addLead";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/showLeadList", method = RequestMethod.GET)
	public String showLeadList(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "showLeadList";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/addEnquiry", method = RequestMethod.GET)
	public String addEnquiry(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "addEnquiry";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/showEnquiryList", method = RequestMethod.GET)
	public String showEnquiryList(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "showEnquiryList";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}
