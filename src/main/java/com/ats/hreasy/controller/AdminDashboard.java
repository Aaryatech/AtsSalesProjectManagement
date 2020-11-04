package com.ats.hreasy.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.hreasy.common.AcessController;
import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.AccessRightModule;
import com.ats.hreasy.model.Info;

@Controller
@Scope("session")
public class AdminDashboard {

	@RequestMapping(value = "/adminDashboard", method = RequestMethod.GET)
	public String addRightsRole(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {

			mav = "dashboard/adminDashboard";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/moduleWiseDashboard", method = RequestMethod.GET)
	public String moduleWiseDashboard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {

			mav = "dashboard/moduleWiseDashboard";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/lmsDashBoard", method = RequestMethod.GET)
	public String lmsDashBoard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {

			mav = "dashboard/lmsDashBoard";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}
