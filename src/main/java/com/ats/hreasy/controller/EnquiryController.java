package com.ats.hreasy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.AccountType;
import com.ats.hreasy.model.Channel;
import com.ats.hreasy.model.City;
import com.ats.hreasy.model.Designation;
import com.ats.hreasy.model.DomainType;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.InquiryDetail;
import com.ats.hreasy.model.InquiryHeader;
import com.ats.hreasy.model.InquiryHeaderWithNames;
import com.ats.hreasy.model.LmsHeaderWithNames;
import com.ats.hreasy.model.States;
import com.ats.hreasy.model.Tags;
import com.ats.hreasy.model.TaskDetails;
import com.ats.hreasy.model.TaskStatus;
import com.ats.hreasy.model.UserLoginData;

@Controller
@Scope("session")
public class EnquiryController {

	
	
	List<InquiryDetail> inqDetailList=new ArrayList<InquiryDetail>();
	
	@RequestMapping(value = "/addEnquiry", method = RequestMethod.GET)
	public String addEnquiry(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.err.println("In Add Enquiry");
		String mav = "addEnquiry";
		LmsHeaderWithNames lmsResp=new LmsHeaderWithNames();
		MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
		
	
		try {
			/*********For Add Inquiry From Customerlist Or Collabrator List***********/
			try {
				String	cid=request.getParameter("Cid");
			
				if(cid!=null) {
					map.add("lmsId", Integer.parseInt(cid));
			lmsResp=Constants.getRestTemplate().postForObject(Constants.url+"getLmsHeader", map, LmsHeaderWithNames.class);
			//System.out.println("LmsResp========"+lmsResp);	
			model.addAttribute("cid", Integer.parseInt(cid));
			model.addAttribute("lmsResp", lmsResp);
				}else {
					//System.err.println(cid+"Cidddddddddddddddddddddddddddd");
					model.addAttribute("cid", 0);
				}
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				model.addAttribute("cid", 0);
			}
			/*******************************************************/
			inqDetailList=new ArrayList<InquiryDetail>();
			
			Channel[] channel = Constants.getRestTemplate().getForObject(Constants.url + "getAllChannelList",
					Channel[].class);
			List<Channel> chanalList = new ArrayList<>(Arrays.asList(channel));
			model.addAttribute("chanalList", chanalList);
			
			
			DomainType[] domainType = Constants.getRestTemplate().getForObject(Constants.url + "getAllDomainTypelist",
					DomainType[].class);
			List<DomainType> domainList = new ArrayList<DomainType>(Arrays.asList(domainType));

			model.addAttribute("domainList", domainList);
			
			Tags[] tags = Constants.getRestTemplate().postForObject(Constants.url + "getAllTagsWithAccountTypeName",
					null, Tags[].class);
			List<Tags> tagList = new ArrayList<Tags>(Arrays.asList(tags));

			model.addAttribute("tagList", tagList);
			
			Designation[] designation = Constants.getRestTemplate().getForObject(Constants.url + "getAllDesignation",
					Designation[].class);
			List<Designation> designationList = new ArrayList<Designation>(Arrays.asList(designation));

			model.addAttribute("designationList", designationList);
			
			

			States[] states = Constants.getRestTemplate().getForObject(Constants.url + "getAllStates", States[].class);
			List<States> stateList = new ArrayList<States>(Arrays.asList(states));

			model.addAttribute("stateList", stateList);
			
			AccountType[] accTypeArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllAccouctTypeList", AccountType[].class);
			List<AccountType> accTypeList=new ArrayList<AccountType>(Arrays.asList(accTypeArr));
			model.addAttribute("accTypeList",accTypeList);
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	
	@RequestMapping(value="/addContactPersonInquiry",method=RequestMethod.POST)
	@ResponseBody
	public Info addContactPersonInquiry(HttpServletRequest request,HttpServletResponse response) {
		//System.err.println("In Add CP Fron Inquiry Form");
		Info info=new Info();
		
		try {
			
			String cpName = request.getParameter("cpName");
			int designation = Integer.parseInt(request.getParameter("designation"));
			String cpMobile1 = request.getParameter("cpMobile1");
			String cpMobile2 = request.getParameter("cpMobile2");
			String email = request.getParameter("email");
			
			
			InquiryDetail inquiryDetail=new InquiryDetail();
			inquiryDetail.setCpName(cpName);
			inquiryDetail.setCpDesignationId(designation);
			inquiryDetail.setCpMobile(cpMobile1);
			inquiryDetail.setCpMobile2(cpMobile2);
			inquiryDetail.setCpEmail(email);
			inquiryDetail.setDelStatus(1);
			//System.err.println("Cp  iS ="+inquiryDetail);
			if (inqDetailList.size() == 0) {
				inquiryDetail.setCpPrimary(1);
			} else {
				int find = 0;
				for (int i = 0; i < inqDetailList.size(); i++) {
					if (inqDetailList.get(i).getDelStatus() == 1) {
						find = 1;
						break;
					}
				}
				if (find == 0) {
					inquiryDetail.setCpPrimary(1);
				}
			}
			inqDetailList.add(inquiryDetail);
			info.setError(false);
			info.setMsg("CP Sucessfully Added!!!");
			//System.err.println(inqDetailList+"Inq List");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			info.setError(true);
			info.setMsg("failed Added");
		}
		
	return info;
		
	}
	
	
	
	@RequestMapping(value = "/showEnquiryList", method = RequestMethod.GET)
	public String showEnquiryList(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "showEnquiryList";
		List<InquiryHeaderWithNames> inqHeaderWithNameList=new ArrayList<>();
		try {
			InquiryHeaderWithNames[] inqHeaderArray=Constants.getRestTemplate().getForObject(Constants.url+"getAllInquiryHeaderWithName", InquiryHeaderWithNames[].class);
			inqHeaderWithNameList=new ArrayList<InquiryHeaderWithNames>(Arrays.asList(inqHeaderArray));
			model.addAttribute("inqHeadList", inqHeaderWithNameList);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	@RequestMapping(value="/getCpListInquiry",method=RequestMethod.POST)
	@ResponseBody
	public List<InquiryDetail> getCpListInquiry(HttpServletRequest request,HttpServletResponse response) {
		//System.err.println("getCpListInquiry");
		return inqDetailList;
	}
	
	
	@RequestMapping(value="/deleteContactPersonInquiry", method=RequestMethod.POST)
	@ResponseBody
	public Info  deleteContactPersonInquiry(HttpServletRequest request,HttpServletResponse response) {
		Info info=new Info();
		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			inqDetailList.remove(id);
			info.setError(false);
			info.setMsg("Successfully Deleted");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			info.setError(true);
			info.setMsg("failed Deleted");
		}
		
		return info;
	}
	
	
	
	@RequestMapping(value="/submitAddEnquiryForm",method=RequestMethod.POST)
	public String submitAddEnquiryForm(HttpServletRequest request,HttpServletResponse response) {
		System.err.println("In /submitAddEnquiryForm ");
		HttpSession session = request.getSession();
		try {
			
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
			Date dt = new Date();
			
			
			int channelId=Integer.parseInt(request.getParameter("channel"));
			String domainName=request.getParameter("domainName");
			int domaiId=Integer.parseInt(request.getParameter("dId"));
			String[] accTag=request.getParameterValues("accTag");
			String webSite=request.getParameter("website");
			String turnOver=request.getParameter("turnover");
			String contactNo = request.getParameter("contactNo");
			String scaleDesc = request.getParameter("scaleDesc");
			String remark = request.getParameter("Remark");
			//System.out.println("Remark Is "+remark);
			String empCnt=request.getParameter("empCount");
			int cid=Integer.parseInt(request.getParameter("cid"));
			String inqTittle=request.getParameter("inqTittle");
			int stateId=Integer.parseInt(request.getParameter("stateID"));
			int cityId=Integer.parseInt(request.getParameter("cityId"));
			//int accType=Integer.parseInt(request.getParameter("accType"));
			
			String tags = "";

			for (int i = 0; i < accTag.length; i++) {
				tags = tags + "," + accTag[i];
			}
			tags = tags.substring(1);
			
			String cmpName=request.getParameter("cmpName");
		
	
			String rating = request.getParameter("rating");
//System.err.println(channelId+"\t"+domainName+"\t"+domaiId+"\t"+webSite+"\t"+turnOver+"\t"+contactNo+"\t"+scaleDesc+"\t"+remark+"\t"+empCnt+"\t"+tags+"\t"+cmpName+"\t"+rating);
			
			//System.err.println(inqDetailList+"\t"+userDetail.getEmpId()+"\t"+sf.format(dt));
		
			
			
			
			
			  InquiryHeader inqHeader=new InquiryHeader();
			  
			 
			  inqHeader.setChannelId(channelId); 
			  inqHeader.setInqDomainOther(domainName);
			  inqHeader.setInqDomainId(domaiId);
			  inqHeader.setInqTags(tags);
			  inqHeader.setInqCompany(cmpName); 
			  inqHeader.setInqWebsite(webSite);
			  inqHeader.setInqTurnover(turnOver);
			  inqHeader.setInqCompanyLandline(contactNo);
			  inqHeader.setInqScaleDesc(scaleDesc);
			  inqHeader.setInqRemark(remark);
			  inqHeader.setInqEmpCount(empCnt);
			  inqHeader.setInqDetailList(inqDetailList);
			  inqHeader.setDelStatus(1); 
			  inqHeader.setIsActive(1);
			  inqHeader.setMakerUserId(userDetail.getEmpId());
			  inqHeader.setMakerDatetime(sf.format(dt)); 
			  inqHeader.setInqAtsRating(rating);
			  inqHeader.setMdAccTypeId(2);
			  inqHeader.setInqRefCode(cid);
			  inqHeader.setInquiryTittle(inqTittle);
			  inqHeader.setmStateId(stateId);
			  inqHeader.setmCityId(cityId);
			 
			 
			  System.err.println(inqHeader);
			 
			 
			 
			
			
			  System.err.println("Object Of Inquiry Header ="+inqHeader);
			  
			  
			
			  InquiryHeader res=Constants.getRestTemplate().postForObject(Constants.url+
			  "addNewInquiryHeader", inqHeader, InquiryHeader.class);
			  if (res == null) {
			  session.setAttribute("errorMsg", "Failed To Generated Enquiry."); 
			  }
			  MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			  map.add("mdAccTypeId", 2); 
			  map.add("statusSequence", 0); 
			  TaskStatus[] sts =
			  Constants.getRestTemplate() .postForObject(Constants.url +
			  "getTaskStatusByAccTypeIdAndSequnce", map, TaskStatus[].class);
			  
			  TaskDetails taskDetails = new TaskDetails();
			  taskDetails.setMdAccTypeId(2);
			  taskDetails.setPriKey(res.getInqId());
			  taskDetails.setTaskTittle(sts[0].getmTaskStatusName());
			  taskDetails.setTaskFinalStatus(sts[0].getmTaskStatusId());
			  taskDetails.setTaskPriority(1);
			  taskDetails.setTaskPts(sts[0].getmTaskPts());
			  taskDetails.setMakerUserId(userDetail.getEmpId());
			  taskDetails.setMakerDatetime(sf.format(dt)); 
			  taskDetails.setDelStatus(1);
			  taskDetails.setIsActive(1);
			  taskDetails.setTaskAllotedTo("0");
			  taskDetails.setTaskAllotmentInstructions("-");
			  taskDetails.setTaskScheDate(yy.format(dt));
			  taskDetails.setTaskScheTime(sf.format(dt));
			  
			  System.err.println("Task Details To Be Saved Is ="+taskDetails); TaskDetails
			  newTask = Constants.getRestTemplate().postForObject(Constants.url +
			  "addNewTask", taskDetails, TaskDetails.class);
			  session.setAttribute("successMsg", "Enquiry Generated Successfully.");
			 
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Failed To Generated Enquiry.");
			e.printStackTrace();
			e.printStackTrace();
		}
		
		return "redirect:/showEnquiryList";
	}
	
	//deleteInquiryHeaderByInqId
	@RequestMapping(value="/deleteInqHeader",method=RequestMethod.GET)
	public String deleteInqHeader(@RequestParam int inqId,HttpServletRequest request) {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("inqId", inqId);
		
		
		Info info = new Info();
		String mav = "";
		HttpSession session = request.getSession();
		try {
			
			info = Constants.getRestTemplate().postForObject(Constants.url + "deleteInquiryHeaderByInqId", map, Info.class);
			if (info.isError()) {
				session.setAttribute("errorMsg", "Unable To Delete Tag");
				mav = "redirect:/";
			}
			session.setAttribute("successMsg", "Tag Successfully Deleted");
			mav="redirect:/showEnquiryList";
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occurs In Catch Block Of /deleteInqHeader Mapping ");
			e.printStackTrace();
			mav = "redirect:/";
		}
		
		
		
		
		
		//System.err.println("Inq Id ="+inqId);
		return mav;
	}
	
	
	InquiryHeaderWithNames editInqHeader=new InquiryHeaderWithNames();
	@RequestMapping(value="/editEnquiry",method=RequestMethod.GET)
	public String editEnquiry(HttpServletRequest request,@RequestParam int inqId,Model model) {
		
		HttpSession session = request.getSession();
		String mv = "editEnq";
		
		
		try {
			inqDetailList=new ArrayList<InquiryDetail>();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("inqId", inqId);
			
			editInqHeader=Constants.getRestTemplate().postForObject(Constants.url+"getInqHeaderWithNameById",
																	map, InquiryHeaderWithNames.class);
			System.err.println("editInqHeader Is="+editInqHeader);
		model.addAttribute("editEnqHeader", editInqHeader);
		
		
		Channel[] channel = Constants.getRestTemplate().getForObject(Constants.url + "getAllChannelList",
				Channel[].class);
		List<Channel> chanalList = new ArrayList<>(Arrays.asList(channel));
		model.addAttribute("chanalList", chanalList);

		Tags[] tags = Constants.getRestTemplate().postForObject(Constants.url + "getAllTagsWithAccountTypeName",
				null, Tags[].class);
		List<Tags> tagList = new ArrayList<Tags>(Arrays.asList(tags));

		model.addAttribute("tagList", tagList);

		DomainType[] domainType = Constants.getRestTemplate().getForObject(Constants.url + "getAllDomainTypelist",
				DomainType[].class);
		List<DomainType> domainList = new ArrayList<DomainType>(Arrays.asList(domainType));

		model.addAttribute("domainList", domainList);

		Designation[] designation = Constants.getRestTemplate().getForObject(Constants.url + "getAllDesignation",
				Designation[].class);
		List<Designation> designationList = new ArrayList<Designation>(Arrays.asList(designation));

		model.addAttribute("designationList", designationList);
		

		States[] states = Constants.getRestTemplate().getForObject(Constants.url + "getAllStates", States[].class);
		List<States> stateList = new ArrayList<States>(Arrays.asList(states));

		model.addAttribute("stateList", stateList);
		
		
			/*
			 * AccountType[]
			 * accTypeArr=Constants.getRestTemplate().getForObject(Constants.url+
			 * "getAllAccouctTypeList", AccountType[].class); List<AccountType>
			 * accTypeList=new ArrayList<AccountType>(Arrays.asList(accTypeArr));
			 * model.addAttribute("accTypeList",accTypeList);
			 */
		
	
		
		
		String[] selectedTags=editInqHeader.getInqTags().split(",");
		
		System.err.println("Selected Tags Are="+"\t"+selectedTags);
		model.addAttribute("selectedTags", selectedTags);
		inqDetailList=editInqHeader.getInqDetailList();
		System.err.println("InqDetail List From Edit inquiry"+editInqHeader.getInqDetailList());
		
			
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Failed To Update Inquiry!!!");
			e.printStackTrace();
		}
			return mv;
	}
	
	
	
	
	
	
	
	//To  Update/Edit Enquiry
	@RequestMapping(value="/submitEditEnquiryForm",method=RequestMethod.POST)
	public String submitEditEnquiryForm(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		
		try {
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date dt = new Date();
				
			
			//int inqId=Integer.parseInt(request.getParameter("inqId"));
			int channelId=Integer.parseInt(request.getParameter("channel"));
			String domainName=request.getParameter("domainName");
			int domaiId=Integer.parseInt(request.getParameter("dId"));
			String[] accTag=request.getParameterValues("accTag");
			String webSite=request.getParameter("website");
			String turnOver=request.getParameter("turnover");
			String contactNo = request.getParameter("contactNo");
			String scaleDesc = request.getParameter("scaleDesc");
			String remark = request.getParameter("Remark");
			String empCnt=request.getParameter("empCount");
			String inqTittle=request.getParameter("inqTittle");
			int stateId=Integer.parseInt(request.getParameter("stateID"));
			int cityId=Integer.parseInt(request.getParameter("cityId"));
			//int accType=Integer.parseInt(request.getParameter("accType"));
			
			String tags = "";

			for (int i = 0; i < accTag.length; i++) {
				tags = tags + "," + accTag[i];
			}
			tags = tags.substring(1);
			
			String cmpName=request.getParameter("cmpName");
		
	
			String rating = request.getParameter("rating");
			
			
			

			 // InquiryHeader inqHeader=new InquiryHeader();
			  
			 
			//editInqHeader.setInqId(inqId);
			editInqHeader.setChannelId(channelId); 
			editInqHeader.setInqDomainOther(domainName);
			editInqHeader.setInqDomainId(domaiId);
			editInqHeader.setInqTags(tags);
			editInqHeader.setInqCompany(cmpName); 
			editInqHeader.setInqWebsite(webSite);
			editInqHeader.setInqTurnover(turnOver);
			editInqHeader.setInqCompanyLandline(contactNo);
			editInqHeader.setInqScaleDesc(scaleDesc);
			editInqHeader.setInqRemark(remark);
			editInqHeader.setInqEmpCount(empCnt);
			editInqHeader.setInqDetailList(inqDetailList);
			  //inqHeader.setDelStatus(1); 
			  //inqHeader.setIsActive(1);
			 // inqHeader.setMakerUserId(userDetail.getEmpId());
			  //inqHeader.setMakerDatetime(sf.format(dt)); 
			editInqHeader.setInqRemark(remark);
			editInqHeader.setMdAccTypeId(2);
			editInqHeader.setInquiryTittle(inqTittle);
			editInqHeader.setmStateId(stateId);
			editInqHeader.setmCityId(cityId);
			
			
			InquiryHeader editEnqHeader=new InquiryHeader();
			editEnqHeader.setInqId(editInqHeader.getInqId());
			editEnqHeader.setChannelId(editInqHeader.getChannelId());
			editEnqHeader.setInqDomainOther(editInqHeader.getInqDomainOther());
			editEnqHeader.setInqTags(editInqHeader.getInqTags());
			editEnqHeader.setInqCompany(editInqHeader.getInqCompany());
			editEnqHeader.setInqWebsite(editInqHeader.getInqWebsite());
			editEnqHeader.setInqTurnover(editInqHeader.getInqTurnover());
			editEnqHeader.setInqCompanyLandline(editInqHeader.getInqCompanyLandline());
			editEnqHeader.setInqScaleDesc(editInqHeader.getInqScaleDesc());
			editEnqHeader.setInqRemark(editInqHeader.getInqRemark());
			editEnqHeader.setInqEmpCount(editInqHeader.getInqEmpCount());
			editEnqHeader.setInqDetailList(editInqHeader.getInqDetailList());
			editEnqHeader.setDelStatus(editInqHeader.getDelStatus());
			editEnqHeader.setIsActive(editInqHeader.getIsActive());
			editEnqHeader.setMakerUserId(editInqHeader.getMakerUserId());
			editEnqHeader.setMakerDatetime(editInqHeader.getMakerDatetime());
			editEnqHeader.setMdAccTypeId(2);
			editEnqHeader.setInquiryTittle(editInqHeader.getInquiryTittle());
			editEnqHeader.setmStateId(editInqHeader.getmStateId());
			editEnqHeader.setmCityId(editInqHeader.getmCityId());
			
			
			
			editEnqHeader.setInqId(editInqHeader.getInqId());
			editEnqHeader.setChannelId(channelId); 
			editEnqHeader.setInqDomainOther(domainName);
			editEnqHeader.setInqDomainId(domaiId);
			editEnqHeader.setInqTags(tags);
			editEnqHeader.setInqCompany(cmpName); 
			editEnqHeader.setInqWebsite(webSite);
			editEnqHeader.setInqTurnover(turnOver);
			editEnqHeader.setInqCompanyLandline(contactNo);
			editEnqHeader.setInqScaleDesc(scaleDesc);
			editEnqHeader.setInqRemark(remark);
			editEnqHeader.setInqEmpCount(empCnt);
			editEnqHeader.setInqDetailList(inqDetailList);
			editEnqHeader.setDelStatus(editInqHeader.getDelStatus()); 
			editEnqHeader.setIsActive(editInqHeader.getIsActive());
			editEnqHeader.setMakerUserId(editInqHeader.getMakerUserId());
			editEnqHeader.setMakerDatetime(editInqHeader.getMakerDatetime()); 
			editEnqHeader.setInqAtsRating(rating);
			editEnqHeader.setMdAccTypeId(2);
			
			
			
			  System.err.println("inqHeader From edit inq"+editInqHeader);
			  
			  
			  InquiryHeader res=Constants.getRestTemplate().postForObject(Constants.url+
					  "addNewInquiryHeader", editEnqHeader, InquiryHeader.class);
					  if (res == null) {
					  session.setAttribute("errorMsg", "Failed To Update Enquiry."); 
					  }else {
						  session.setAttribute("successMsg", "Enquiry Updated."); 
					}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Failed To Update Enquiry."); 
			e.printStackTrace();
		}
		
		
		return "redirect:/showEnquiryList";
	}
	
	
	@RequestMapping(value="/deleteCpInquiry",method=RequestMethod.POST)
	@ResponseBody
	public Info deleteCP(HttpServletRequest request) {
		Info info=new Info();
	//	int id = Integer.parseInt(request.getParameter("id"));
		System.err.println("In /deleteCp \n"+"\t");
		
		  try {
		  
		  int id = Integer.parseInt(request.getParameter("id"));
		  System.err.println("Id In deleteCP is="+id);
		  
		  if (inqDetailList.get(id).getInqDetailId() == 0) { 
			  			inqDetailList.remove(id);
		  } else { 
			  inqDetailList.get(id).setDelStatus(0); 
			  }
		  
		  info.setError(false); info.setMsg("Successfully Deleted"); } catch (Exception
		  e) { e.printStackTrace(); info.setError(true); info.setMsg("failed Deleted");
		  }
		 
		
		
		return info;
	}
	
	
	
	@RequestMapping(value = "/getCityListinq", method = RequestMethod.POST)
	@ResponseBody
	public List<City> getCityListinq(HttpServletRequest request, HttpServletResponse response) {
		List<City> cityList = new ArrayList<City>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			int stId = Integer.parseInt(request.getParameter("stateId"));

			map.add("stateId", stId);
			City[] cityArr = Constants.getRestTemplate().postForObject(Constants.url + "getCitiesByStateId", map,
					City[].class);
			cityList = new ArrayList<City>(Arrays.asList(cityArr));

		} catch (Exception e) {
			// TODO: handle exception
			cityList = new ArrayList<City>();
			System.err.println("Exception Occured!!! In /getCityListinq ");
			e.printStackTrace();
		}
		return cityList;
	}
	
	
	
	
	
	
}
