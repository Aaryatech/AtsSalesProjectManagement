package com.ats.hreasy.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.LmsheaderWithCustDetail;

@Controller
@Scope("session")
public class CustomerComtroller {
	
	List<LmsheaderWithCustDetail> custList=new ArrayList<LmsheaderWithCustDetail>();
	
	

	@RequestMapping(value="/getCustomerList",method=RequestMethod.GET)
	public ModelAndView getCustomerList() {
	ModelAndView mav=new ModelAndView("customerList");
	LmsheaderWithCustDetail[] resp;
	try {
		resp =Constants.getRestTemplate().getForObject(Constants.url+"getCustList", LmsheaderWithCustDetail[].class);
		custList=new ArrayList<LmsheaderWithCustDetail>(Arrays.asList(resp));
		////System.err.println("Cust List In Mvc Is "+custList);
		mav.addObject("custList", custList);
	} catch (Exception e) {
		// TODO: handle exception
		custList=new ArrayList<LmsheaderWithCustDetail>();
		//System.err.println("Exception Occurerd!!! In Catch Block Of /getCustomerList Mapping");
		e.printStackTrace();
	}
	
	return mav;
	
	}
	
	
	
	
	@RequestMapping(value="/getCollaboratorList",method=RequestMethod.GET)
	public ModelAndView getCollaboratorList() {
		List<LmsheaderWithCustDetail> collabratorList=new ArrayList<LmsheaderWithCustDetail>();
	ModelAndView mav=new ModelAndView("CollabratorList");
	LmsheaderWithCustDetail[] resp;
	try {
		resp =Constants.getRestTemplate().getForObject(Constants.url+"getCollabratorList", LmsheaderWithCustDetail[].class);
		collabratorList=new ArrayList<LmsheaderWithCustDetail>(Arrays.asList(resp));
		//System.err.println("Collabrator List In Mvc Is "+collabratorList);
		mav.addObject("collabratorList", collabratorList);
	} catch (Exception e) {
		// TODO: handle exception
		collabratorList=new ArrayList<LmsheaderWithCustDetail>();
		//System.err.println("Exception Occurerd!!! In Catch Block Of /getCustomerList Mapping");
		e.printStackTrace();
	}
	
	return mav;
	
	}
	
	
}
