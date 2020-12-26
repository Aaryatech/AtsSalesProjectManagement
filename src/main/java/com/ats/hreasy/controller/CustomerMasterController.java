package com.ats.hreasy.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.CustomerMst;
import com.ats.hreasy.model.Info;
import com.sun.org.apache.bcel.internal.Const;

@Controller
@Scope("session")
public class CustomerMasterController {
	
	
	@RequestMapping(value="/showCustMasterList",method=RequestMethod.GET)
	public ModelAndView getCustomerMasterList() {
		ModelAndView model=new ModelAndView("customerMstList");
		List<CustomerMst> custMstList=new ArrayList<>();
		
		try {
			
		CustomerMst[] custArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllCustomerList", CustomerMst[].class);
		custMstList=new ArrayList<>(Arrays.asList(custArr));
		System.err.println("list-->"+custMstList);
		model.addObject("custList",custMstList);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /showCustMasterList ");
			e.printStackTrace();
		}
		
		
		
		return model;
	}
	
	
	
	@RequestMapping(value="/addCustMaster",method=RequestMethod.GET)
	public ModelAndView addCustomerMaster(HttpServletRequest request,HttpServletResponse response) {
		CustomerMst cust=new CustomerMst();
		int flag=0;
		
		cust.setCustId(0);
		ModelAndView model=new ModelAndView("addCustomerMst");
		model.addObject("cust", cust);
		model.addObject("flag", flag);
		//System.err.println(cust);
		
		
		return model;
	}
	
	
	@RequestMapping(value="/submitCustmstForm",method=RequestMethod.POST)
	public ModelAndView submitAddCustMst(HttpServletRequest request,HttpServletResponse response) {
		CustomerMst cust=new CustomerMst();
		HttpSession session=request.getSession();
		ModelAndView model=new ModelAndView("redirect:/showCustMasterList");
		try {
			int custId= Integer.parseInt(request.getParameter("custId"));
			String custName=request.getParameter("custName");
			String custEmail=request.getParameter("custEmail");
			String cpName=request.getParameter("cpName");
			String cpEmail=request.getParameter("cpEmail");
			String cpMob=request.getParameter("cpMob");
			String cpMob2=request.getParameter("cpMob2");
			
			if(custId>0) {
				cust.setCustId(custId);
			}
			
			
			cust.setCustomerName(custName);
			cust.setCustomerEmail(custEmail);
			cust.setCpName(cpName);
			cust.setCpEmail(cpEmail);
			cust.setCpMobile(cpMob);
			cust.setCpMobile2(cpMob2);
			cust.setIsActive(1);
			cust.setDelStatus(1);
			
			
			System.err.println("Cust Obj--->"+cust);
			CustomerMst custResp=Constants.getRestTemplate().postForObject(Constants.url+"saveCustMst", cust, CustomerMst.class);
			if(custResp.getCustId()==0) {
				session.setAttribute("errorMsg", "Unable To Save Customer");
			}else {
				session.setAttribute("successMsg", "Customer Saved Successfully!!!");
			}
			
			
			if(custResp.getCustId()==0 && custId==0) {
				session.setAttribute("errorMsg", "Unable To Update Customer");
			}else {
				session.setAttribute("successMsg", "Customer Updated Successfully!!!");
			}
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /submitCustmstForm");
			e.printStackTrace();
		}
		
		
		
		return model;
		
		
	}
	
	
	
	
	@RequestMapping(value="/deleteCustMst",method=RequestMethod.GET)
	public ModelAndView deleteCustMst(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model=new ModelAndView("redirect:/showCustMasterList");
		Info info=new Info();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		HttpSession session=request.getSession();
		
		try {
			int custId=Integer.parseInt(request.getParameter("custId"));
			map.add("custId", custId);
			info=Constants.getRestTemplate().postForObject(Constants.url+"deleteCustMst", map, Info.class);
			if(info.isError()) {
				session.setAttribute("errorMsg", "Unable To Delete Customer");	
				
			}else {
				session.setAttribute("successMsg", "Customer Deleted Successfully!!!");
			}
				
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Unable To Delete Customer Exception Occuered");	
			System.err.println("Exception Occuered In /deleteCustMst");
			e.printStackTrace();
		}
		
		
		return model;
	}
	
	
	@RequestMapping(value="/editCustMst",method=RequestMethod.GET)
	public ModelAndView editCustMst(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model=new ModelAndView("addCustomerMst");
		int flag=1;
		Info info=new Info();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		HttpSession session=request.getSession();
		model.addObject("flag", flag);
		try {
			int custId=Integer.parseInt(request.getParameter("custId"));
			map.add("custId", custId);
			CustomerMst cust=Constants.getRestTemplate().postForObject(Constants.url+"getCustById", map, CustomerMst.class);
			model.addObject("cust", cust);
			
			System.err.println(cust);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /editCustMst");
			e.printStackTrace();
		}
		
		return model;
		
	}
	
	
	
	

}
