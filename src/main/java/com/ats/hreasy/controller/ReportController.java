package com.ats.hreasy.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.AccountType;
import com.ats.hreasy.model.Channel;
import com.ats.hreasy.model.Designation;
import com.ats.hreasy.model.DomainType;
import com.ats.hreasy.model.InquiryDetail;
import com.ats.hreasy.model.LmsHeaderWithNames;
import com.ats.hreasy.model.States;
import com.ats.hreasy.model.Tags;

@Controller
@Scope("session")
public class ReportController {

	@RequestMapping(value = "/reportDash", method = RequestMethod.GET)
	public String reportDash(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "repDash";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
