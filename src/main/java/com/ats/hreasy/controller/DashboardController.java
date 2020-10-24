package com.ats.hreasy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.AccountType;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.Tags;
import com.ats.hreasy.model.UserLoginData;

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
		List<Tags> tagListResp=new ArrayList<Tags>();
		String mav = "";

		
		try {
			
	
		Tags[]	tags=Constants.getRestTemplate().postForObject(Constants.url+"getAllTagsWithAccountTypeName", null, Tags[].class);
		tagListResp=new ArrayList<Tags>(Arrays.asList(tags));
		System.err.println(tagListResp);
		mav="tagList";
		model.addAttribute("tagList", tagListResp);
		} catch (Exception e) {
			System.err.println("Exception Occur In Catch Block Of / tagList Mapping");
			tagListResp=new ArrayList<Tags>();
			mav ="tagList";
			e.printStackTrace();
			
			
		}
		return mav;
	}

	@RequestMapping(value = "/addNewTag", method = RequestMethod.GET)
	public String addNewTag(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<AccountType> accTypeResponse=new ArrayList<AccountType>();
		String mav = "addNewTag";
		Tags newTag=new Tags();
		try {
			AccountType [] accType=Constants.getRestTemplate().postForObject(Constants.url+"getAllAccouctTypeList", null, AccountType[].class);
			accTypeResponse=new ArrayList<>(Arrays.asList(accType));
			//System.err.println(accTypeResponse+"Accounttype Response");
			model.addAttribute("AccountTypeList", accTypeResponse);
			model.addAttribute("tagResponse", newTag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/editTag", method = RequestMethod.GET)
	public String editTag(HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam int tagId ) {
		System.err.println("In Edit Tag ");
		List<AccountType> accTypeResponse=new ArrayList<AccountType>();
		String mav = "addNewTag";
		Tags tagResp=new Tags();
		MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("tagId", tagId);
		
		try {
			System.err.println("In Try Before Resttemplate");
			AccountType [] accType=Constants.getRestTemplate().postForObject(Constants.url+"getAllAccouctTypeList", null, AccountType[].class);
			accTypeResponse=new ArrayList<>(Arrays.asList(accType));
		tagResp=Constants.getRestTemplate().postForObject(Constants.url+"getSingTagByIdAndDelStatus", map, Tags.class);
			//System.err.println(accTypeResponse+"Accounttype Response");
			model.addAttribute("AccountTypeList", accTypeResponse);
			model.addAttribute("tagResponse", tagResp);
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
	
	@RequestMapping(value="/submitTagForm",method=RequestMethod.POST)
	public String addNewTAg(HttpServletRequest request, HttpServletResponse response, Model model) {
		Tags tag=new Tags();
		Info info =new Info();
		HttpSession session = request.getSession();
		SimpleDateFormat simpleDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();
		String mav="";
		
		
		UserLoginData currentUser=(UserLoginData)session.getAttribute("userObj");
		
		
		try {
			tag.setmTagId(Integer.parseInt(request.getParameter("tagId")));
			tag.setmAccTypeId(Integer.parseInt(request.getParameter("accountType")));
			tag.setmTagName(request.getParameter("tagName"));
			tag.setDelStatus(true);
			tag.setActive(true);
			tag.setMakerUserId(currentUser.getEmpId());
			tag.setMakerDatetime(simpleDate.format(date));
			if(tag.getmTagId()==0) {
				
				Tags t1=Constants.getRestTemplate().postForObject(Constants.url+"addNewTag", tag, Tags.class);	
				System.err.println("Saved Tag Is="+"\t"+t1);
				if(t1!=null) {
					session.setAttribute("successMsg", "New Tag SuccessFully  Added");
				}else {
					session.setAttribute("errorMsg", "Unable To Add New Tag");
				}
			}else {
				System.err.println("Exiisting Tag For Edit Is:"+"\t"+tag);
				info=Constants.getRestTemplate().postForObject(Constants.url+"editTag", tag, Info.class);
				if(!info.isError()) {
					session.setAttribute("successMsg", "Tag SucessFully Updated");
					
				}else {
					session.setAttribute("errorMsg", "Unable To Update  Tag");
				}
			}
		
			
			mav= "redirect:/tagList";
		
		} catch (Exception e) {
			// TODO: handle exception
			
			System.err.println("Something Went Wrong Cat Block Of  /submitTagForm  mapping");
			e.printStackTrace();
			mav= "redirect:/addNewTag";
		}
		
		
			
		
		return mav;
		
		
	}
	
	
	@RequestMapping(value="/deleteTag",method=RequestMethod.GET)
	public String deleteTagById(@RequestParam int tagId ,HttpServletRequest request) {
		MultiValueMap<String, Object> map =new LinkedMultiValueMap<String, Object>();
		map.add("tagId", tagId);
	
		Info info=new Info();
		String mav="";
		HttpSession session = request.getSession();
		try {
			info=Constants.getRestTemplate().postForObject(Constants.url+"deleteTagByDelStatus", map, Info.class);
			if(info.isError()) {
				session.setAttribute("errorMsg", "Unable To Delete Tag");
				mav="redirect:/";
			}
			session.setAttribute("successMsg","Tag Successfully Deleted");
			mav="redirect:/tagList";
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occurs In Catch Block Of /deleteTag Mapping ");
			e.printStackTrace();
			mav="redirect:/";
		}
		
		//System.err.println(tagId+"\t"+"Tag Id");
		return mav;
	}
	
	
	
	
	
	

}
