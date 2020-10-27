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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.AccessRightModule;
import com.ats.hreasy.model.AccountType;
import com.ats.hreasy.model.Channel;
import com.ats.hreasy.model.Designation;
import com.ats.hreasy.model.DomainType;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.LmsDetail;
import com.ats.hreasy.model.LmsHeader;
import com.ats.hreasy.model.LmsHeaderWithNames;
import com.ats.hreasy.model.Tags;
import com.ats.hreasy.model.TaskDetailsEmpName;
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

	@RequestMapping(value = "/getPendingTaskList", method = RequestMethod.POST)
	@ResponseBody
	public List<TaskDetailsEmpName> getPendingTaskList(HttpServletRequest request, HttpServletResponse response) {

		List<TaskDetailsEmpName> list = new ArrayList<>();
		try {
			HttpSession session = request.getSession();
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("empId", userDetail.getEmpId());
			TaskDetailsEmpName[] tags = Constants.getRestTemplate()
					.postForObject(Constants.url + "getTaskDetailWithEmpNameByEmpid", map, TaskDetailsEmpName[].class);
			list = new ArrayList<>(Arrays.asList(tags));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
		List<Tags> tagListResp = new ArrayList<Tags>();
		String mav = "";

		try {

			Tags[] tags = Constants.getRestTemplate().postForObject(Constants.url + "getAllTagsWithAccountTypeName",
					null, Tags[].class);
			tagListResp = new ArrayList<Tags>(Arrays.asList(tags));
			System.err.println(tagListResp);
			mav = "tagList";
			model.addAttribute("tagList", tagListResp);
		} catch (Exception e) {
			System.err.println("Exception Occur In Catch Block Of / tagList Mapping");
			tagListResp = new ArrayList<Tags>();
			mav = "tagList";
			e.printStackTrace();

		}
		return mav;
	}

	@RequestMapping(value = "/addNewTag", method = RequestMethod.GET)
	public String addNewTag(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<AccountType> accTypeResponse = new ArrayList<AccountType>();
		String mav = "addNewTag";
		Tags newTag = new Tags();
		try {
			AccountType[] accType = Constants.getRestTemplate().postForObject(Constants.url + "getAllAccouctTypeList",
					null, AccountType[].class);
			accTypeResponse = new ArrayList<>(Arrays.asList(accType));
			// System.err.println(accTypeResponse+"Accounttype Response");
			model.addAttribute("AccountTypeList", accTypeResponse);
			model.addAttribute("tagResponse", newTag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/editTag", method = RequestMethod.GET)
	public String editTag(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam int tagId) {
		System.err.println("In Edit Tag ");
		List<AccountType> accTypeResponse = new ArrayList<AccountType>();
		String mav = "addNewTag";
		Tags tagResp = new Tags();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("tagId", tagId);

		try {
			System.err.println("In Try Before Resttemplate");
			AccountType[] accType = Constants.getRestTemplate().postForObject(Constants.url + "getAllAccouctTypeList",
					null, AccountType[].class);
			accTypeResponse = new ArrayList<>(Arrays.asList(accType));
			tagResp = Constants.getRestTemplate().postForObject(Constants.url + "getSingTagByIdAndDelStatus", map,
					Tags.class);
			// System.err.println(accTypeResponse+"Accounttype Response");
			model.addAttribute("AccountTypeList", accTypeResponse);
			model.addAttribute("tagResponse", tagResp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	List<LmsDetail> lmsDetailList = new ArrayList<LmsDetail>();

	@RequestMapping(value = "/addLead", method = RequestMethod.GET)
	public String addLead(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "addLead";

		try {
			lmsDetailList = new ArrayList<LmsDetail>();
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/addContactPersonLead", method = RequestMethod.POST)
	@ResponseBody
	public Info addContactPersonLead(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {

			String cpName = request.getParameter("cpName");
			int designation = Integer.parseInt(request.getParameter("designation"));
			String cpMobile1 = request.getParameter("cpMobile1");
			String cpMobile2 = request.getParameter("cpMobile2");
			String email = request.getParameter("email");

			LmsDetail lmsDetail = new LmsDetail();
			lmsDetail.setCpDesignationId(designation);
			lmsDetail.setCpEmail(email);
			lmsDetail.setCpMobile(cpMobile1);
			lmsDetail.setCpMobile2(cpMobile2);
			lmsDetail.setCpName(cpName);

			if (lmsDetailList.size() == 0) {
				lmsDetail.setCpPrimary(1);
			}
			lmsDetailList.add(lmsDetail);
			info.setError(false);
			info.setMsg("Successfully Added");
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMsg("failed Added");
		}
		return info;
	}

	@RequestMapping(value = "/deleteContactPersonLead", method = RequestMethod.POST)
	@ResponseBody
	public Info deleteContactPersonLead(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {

			int id = Integer.parseInt(request.getParameter("id"));
			lmsDetailList.remove(id);
			info.setError(false);
			info.setMsg("Successfully Deleted");
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMsg("failed Deleted");
		}
		return info;
	}

	@RequestMapping(value = "/getCpList", method = RequestMethod.POST)
	@ResponseBody
	public List<LmsDetail> getCpList(HttpServletRequest request, HttpServletResponse response) {

		return lmsDetailList;
	}

	@RequestMapping(value = "/showLeadList", method = RequestMethod.GET)
	public String showLeadList(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "showLeadList";

		try {

			LmsHeaderWithNames[] tags = Constants.getRestTemplate()
					.getForObject(Constants.url + "getListOfAllLmsHeader", LmsHeaderWithNames[].class);
			List<LmsHeaderWithNames> list = new ArrayList<>(Arrays.asList(tags));
			model.addAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/submitLms", method = RequestMethod.POST)
	public String submitLms(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date dt = new Date();

			String custName = request.getParameter("custName");
			String cmpName = request.getParameter("cmpName");
			int type = Integer.parseInt(request.getParameter("type"));
			int channelId = Integer.parseInt(request.getParameter("channelId"));
			int domainId = Integer.parseInt(request.getParameter("domainId"));
			String domainText = request.getParameter("domainText");
			String accCode = request.getParameter("accCode");
			String[] accTag = request.getParameterValues("accTag");
			String website = request.getParameter("website");
			int empCount = 0;
			try {
				empCount = Integer.parseInt(request.getParameter("empCount"));
			} catch (Exception e) {

			}

			String contactNo = request.getParameter("contactNo");
			String scaleDesc = request.getParameter("scaleDesc");
			String remark = request.getParameter("remark");
			String rating = request.getParameter("rating");

			String tags = "";

			for (int i = 0; i < accTag.length; i++) {
				tags = tags + "," + accTag[i];
			}
			tags = tags.substring(1);
			//System.out.println(tags);
			LmsHeader lmsHeader = new LmsHeader();
			lmsHeader.setAccCompany(cmpName);
			lmsHeader.setMdAccTypeId(type);
			lmsHeader.setChannelId(channelId);
			lmsHeader.setAccDomainId(domainId);
			lmsHeader.setAccDomainOther(domainText);
			lmsHeader.setAccCode(accCode);
			lmsHeader.setAccTags(tags);
			lmsHeader.setAccWebsite(website);
			lmsHeader.setAccEmpCount(empCount);
			lmsHeader.setAccCompanyLandline(contactNo);
			lmsHeader.setAccScaleDesc(scaleDesc);
			lmsHeader.setAccRemark(remark);
			lmsHeader.setAccAtsRating(rating);
			lmsHeader.setDelStatus(1);
			lmsHeader.setMakerUserId(userDetail.getEmpId());
			lmsHeader.setMakerDatetime(sf.format(dt));

			lmsHeader.setLmsDetailList(lmsDetailList);

			System.out.println(lmsHeader);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showLeadList";
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

	@RequestMapping(value = "/submitTagForm", method = RequestMethod.POST)
	public String addNewTAg(HttpServletRequest request, HttpServletResponse response, Model model) {
		Tags tag = new Tags();
		Info info = new Info();
		HttpSession session = request.getSession();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String mav = "";

		UserLoginData currentUser = (UserLoginData) session.getAttribute("userObj");

		try {
			tag.setmTagId(Integer.parseInt(request.getParameter("tagId")));
			tag.setmAccTypeId(Integer.parseInt(request.getParameter("accountType")));
			tag.setmTagName(request.getParameter("tagName"));
			tag.setDelStatus(true);
			tag.setActive(true);
			tag.setMakerUserId(currentUser.getEmpId());
			tag.setMakerDatetime(simpleDate.format(date));
			if (tag.getmTagId() == 0) {

				Tags t1 = Constants.getRestTemplate().postForObject(Constants.url + "addNewTag", tag, Tags.class);
				System.err.println("Saved Tag Is=" + "\t" + t1);
				if (t1 != null) {
					session.setAttribute("successMsg", "New Tag SuccessFully  Added");
				} else {
					session.setAttribute("errorMsg", "Unable To Add New Tag");
				}
			} else {
				System.err.println("Exiisting Tag For Edit Is:" + "\t" + tag);
				info = Constants.getRestTemplate().postForObject(Constants.url + "editTag", tag, Info.class);
				if (!info.isError()) {
					session.setAttribute("successMsg", "Tag SucessFully Updated");

				} else {
					session.setAttribute("errorMsg", "Unable To Update  Tag");
				}
			}

			mav = "redirect:/tagList";

		} catch (Exception e) {
			// TODO: handle exception

			System.err.println("Something Went Wrong Cat Block Of  /submitTagForm  mapping");
			e.printStackTrace();
			mav = "redirect:/addNewTag";
		}

		return mav;

	}

	@RequestMapping(value = "/deleteTag", method = RequestMethod.GET)
	public String deleteTagById(@RequestParam int tagId, HttpServletRequest request) {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("tagId", tagId);

		Info info = new Info();
		String mav = "";
		HttpSession session = request.getSession();
		try {
			info = Constants.getRestTemplate().postForObject(Constants.url + "deleteTagByDelStatus", map, Info.class);
			if (info.isError()) {
				session.setAttribute("errorMsg", "Unable To Delete Tag");
				mav = "redirect:/";
			}
			session.setAttribute("successMsg", "Tag Successfully Deleted");
			mav = "redirect:/tagList";
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occurs In Catch Block Of /deleteTag Mapping ");
			e.printStackTrace();
			mav = "redirect:/";
		}

		// System.err.println(tagId+"\t"+"Tag Id");
		return mav;
	}

}
