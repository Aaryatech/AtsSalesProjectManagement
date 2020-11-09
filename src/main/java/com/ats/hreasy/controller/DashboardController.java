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
import com.ats.hreasy.common.DateConvertor;
import com.ats.hreasy.model.AccessRightModule;
import com.ats.hreasy.model.AccountType;
import com.ats.hreasy.model.Channel;
import com.ats.hreasy.model.CustInfo;
import com.ats.hreasy.model.DashBoardSummary;
import com.ats.hreasy.model.DashboardData;
import com.ats.hreasy.model.Designation;
import com.ats.hreasy.model.DomainType;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.LmsDetail;
import com.ats.hreasy.model.LmsHeader;
import com.ats.hreasy.model.LmsHeaderWithNames;
import com.ats.hreasy.model.Tags;
import com.ats.hreasy.model.TaskDetails;
import com.ats.hreasy.model.TaskDetailsEmpName;
import com.ats.hreasy.model.TaskDetailsWithMsg;
import com.ats.hreasy.model.TaskStatus;
import com.ats.hreasy.model.UserLoginData;

@Controller
@Scope("session")
public class DashboardController {

	TaskDetailsEmpName taskDetail = new TaskDetailsEmpName();
	List<TaskStatus> stsList = new ArrayList<>();

	@RequestMapping(value = "/customerProfile", method = RequestMethod.GET)
	public String customerProfile(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "task/customerProfile";

		try {

			int typeId = Integer.parseInt(request.getParameter("typeId"));
			int primaryKey = Integer.parseInt(request.getParameter("primaryKey"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("type", typeId);
			map.add("primaryKey", primaryKey);
			// System.out.println(map);
			CustInfo custInfo = Constants.getRestTemplate().postForObject(Constants.url + "getCustInfo", map,
					CustInfo.class);

			model.addAttribute("custInfo", custInfo);

			TaskDetailsEmpName[] log = Constants.getRestTemplate().postForObject(Constants.url + "getTaskPreviousLog",
					map, TaskDetailsEmpName[].class);

			List<TaskDetailsEmpName> logList = new ArrayList<>(Arrays.asList(log));
			model.addAttribute("logList", logList);

			map = new LinkedMultiValueMap<>();
			map.add("mdAccTypeId", typeId);
			map.add("priKey", primaryKey);
			// System.out.println(map);
			TaskDetailsWithMsg[] taskDetailsWithMsg = Constants.getRestTemplate()
					.postForObject(Constants.url + "getTaskDetailsClientProfiling", map, TaskDetailsWithMsg[].class);
			List<TaskDetailsWithMsg> clientProfilingList = new ArrayList<>(Arrays.asList(taskDetailsWithMsg));
			model.addAttribute("clientProfilingList", clientProfilingList);

			TaskDetailsWithMsg[] wentright = Constants.getRestTemplate()
					.postForObject(Constants.url + "getTaskDetailsClientWentWrong", map, TaskDetailsWithMsg[].class);
			List<TaskDetailsWithMsg> wentrightList = new ArrayList<>(Arrays.asList(wentright));
			model.addAttribute("wentrightList", wentrightList);

			TaskDetailsWithMsg[] question = Constants.getRestTemplate()
					.postForObject(Constants.url + "getTaskDetailsClientQuestions", map, TaskDetailsWithMsg[].class);
			List<TaskDetailsWithMsg> questionList = new ArrayList<>(Arrays.asList(question));
			model.addAttribute("questionList", questionList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/taskLog", method = RequestMethod.GET)
	public String taskLog(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "task/taskLog";

		try {

			int typeId = Integer.parseInt(request.getParameter("typeId"));
			int primaryKey = Integer.parseInt(request.getParameter("primaryKey"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("type", typeId);
			map.add("primaryKey", primaryKey);
			TaskDetailsEmpName[] log = Constants.getRestTemplate().postForObject(Constants.url + "getTaskPreviousLog",
					map, TaskDetailsEmpName[].class);

			List<TaskDetailsEmpName> logList = new ArrayList<>(Arrays.asList(log));
			model.addAttribute("logList", logList);

			System.out.println(logList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/compaletTask", method = RequestMethod.GET)
	public String compaletTask(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "task/compaletTask";

		try {

			int taskId = Integer.parseInt(request.getParameter("taskId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("taskId", taskId);
			taskDetail = Constants.getRestTemplate().postForObject(Constants.url + "getTaskdetailsEmpnameByTaskId", map,
					TaskDetailsEmpName.class);

			model.addAttribute("taskDetail", taskDetail);

			map = new LinkedMultiValueMap<>();
			map.add("mdAccTypeId", 1);
			TaskStatus[] taskStatus = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllTaskStatusBymdAccTypeId", map, TaskStatus[].class);
			stsList = new ArrayList<>(Arrays.asList(taskStatus));
			model.addAttribute("stsList", stsList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/submitandupdatetask", method = RequestMethod.POST)
	@ResponseBody
	public Info submitandupdatetask(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		Info info = new Info();

		try {

			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date dt = new Date();

			// String custName = request.getParameter("custName");

			int status = Integer.parseInt(request.getParameter("status"));
			String sdate = request.getParameter("sdate");

			String stime = request.getParameter("stime");
			String clientDiscussion = request.getParameter("clientDiscussion");
			String taskDescription = request.getParameter("taskDescription");
			String clientProfiling = request.getParameter("clientProfiling");
			String queations = request.getParameter("queations");
			String right = request.getParameter("right");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("taskId", taskDetail.getTaskId());
			TaskDetails taskinfo = Constants.getRestTemplate().postForObject(Constants.url + "getTaskById", map,
					TaskDetails.class);
			taskinfo.setTaskClientDiscussion(clientDiscussion);
			taskinfo.setThisTaskStatus(1);
			taskinfo.setTaskDoneBy(userDetail.getEmpId());
			taskinfo.setTaskDoneDate(sf.format(dt));
			TaskDetails update = Constants.getRestTemplate().postForObject(Constants.url + "addNewTask", taskinfo,
					TaskDetails.class);

			TaskDetails taskDetails = new TaskDetails();
			taskDetails.setMdAccTypeId(taskDetail.getMdAccTypeId());
			taskDetails.setPriKey(taskDetail.getPriKey());

			int terminate = 0;

			for (int i = 0; i < stsList.size(); i++) {
				// System.out.println(stsList.get(i).getmTaskStatusId() + " " + status);
				if (stsList.get(i).getmTaskStatusId() == status) {
					taskDetails.setTaskTittle(stsList.get(i).getmTaskStatusName());
					taskDetails.setTaskFinalStatus(status);
					taskDetails.setTaskPts(stsList.get(i).getmTaskPts());
					terminate = stsList.get(i).getmTaskIsClosed();
					break;
				}
			}

			if (terminate == 0) {

				taskDetails.setTaskPriority(1);
				taskDetails.setMakerUserId(userDetail.getEmpId());
				taskDetails.setMakerDatetime(sf.format(dt));
				taskDetails.setDelStatus(1);
				taskDetails.setIsActive(1);
				taskDetails.setTaskAllotedTo(taskDetail.getTaskAllotedTo());
				taskDetails.setTaskAllotmentInstructions(taskDescription);
				taskDetails.setTaskScheDate(DateConvertor.convertToYMD(sdate));
				taskDetails.setTaskScheTime(DateConvertor.convertToYMD(sdate) + " " + stime);
				taskDetails.setTaskClientProfiling(clientProfiling);
				taskDetails.setTaskThoughQuestions(queations);
				taskDetails.setTaskWhatWentWrong(right);

				TaskDetails newTask = Constants.getRestTemplate().postForObject(Constants.url + "addNewTask",
						taskDetails, TaskDetails.class);
			}
			info.setError(false);
			info.setMsg("Insert new Task");
		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed to update lead.");
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "welcome2";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/taskAssignPendingList", method = RequestMethod.GET)
	public String taskAssignPendingList(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "taskAssignPendingList";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/getPendingTaskList", method = RequestMethod.POST)
	@ResponseBody
	public DashboardData getPendingTaskList(HttpServletRequest request, HttpServletResponse response) {

		DashboardData dashboardData = new DashboardData();
		try {
			HttpSession session = request.getSession();
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("empId", userDetail.getEmpId());
			TaskDetailsEmpName[] tags = Constants.getRestTemplate()
					.postForObject(Constants.url + "getTaskDetailWithEmpNameByEmpid", map, TaskDetailsEmpName[].class);
			List<TaskDetailsEmpName> list = new ArrayList<>(Arrays.asList(tags));

			DashBoardSummary dashBoardSummary = Constants.getRestTemplate()
					.postForObject(Constants.url + "getRegularDashboardSummry", map, DashBoardSummary.class);
			dashboardData.setDashBoardSummary(dashBoardSummary);
			dashboardData.setPendingTask(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dashboardData;
	}

	@RequestMapping(value = "/getAssignPendingTaskList", method = RequestMethod.POST)
	@ResponseBody
	public List<TaskDetailsEmpName> getAssignPendingTaskList(HttpServletRequest request, HttpServletResponse response) {

		List<TaskDetailsEmpName> list = new ArrayList<>();
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("empId", 0);
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
			String designationName = request.getParameter("designationName");

			LmsDetail lmsDetail = new LmsDetail();
			lmsDetail.setCpDesignationId(designation);
			lmsDetail.setCpEmail(email);
			lmsDetail.setCpMobile(cpMobile1);
			lmsDetail.setCpMobile2(cpMobile2);
			lmsDetail.setCpName(cpName);
			lmsDetail.setExVar1(designationName);
			lmsDetail.setDelStatus(1);
			if (lmsDetailList.size() == 0) {
				lmsDetail.setCpPrimary(1);
			} else {
				int find = 0;
				for (int i = 0; i < lmsDetailList.size(); i++) {
					if (lmsDetailList.get(i).getDelStatus() == 1) {
						find = 1;
						break;
					}
				}
				if (find == 0) {
					lmsDetail.setCpPrimary(1);
				}
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

	@RequestMapping(value = "/deleteLead", method = RequestMethod.GET)
	public String deleteLead(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		try {

			int lmsId = Integer.parseInt(request.getParameter("lmsId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("lmsId", lmsId);
			Info info = Constants.getRestTemplate().postForObject(Constants.url + "deleteLmsHeader", map, Info.class);

			if (info.isError() == true) {
				session.setAttribute("errorMsg", "Failed To Detel Lead.");
			} else {

				session.setAttribute("successMsg", "Lead Deleted Successfully.");
			}
		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed To Generated Lead.");
			e.printStackTrace();
		}
		return "redirect:/showLeadList";
	}

	LmsHeaderWithNames editLmsHeader = new LmsHeaderWithNames();

	@RequestMapping(value = "/editLms", method = RequestMethod.GET)
	public String editLms(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mv = "editLms";
		try {
			lmsDetailList = new ArrayList<LmsDetail>();
			int lmsId = Integer.parseInt(request.getParameter("lmsId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("lmsId", lmsId);
			editLmsHeader = Constants.getRestTemplate().postForObject(Constants.url + "/getLmsHeader", map,
					LmsHeaderWithNames.class);
			model.addAttribute("editLmsHeader", editLmsHeader);

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

			String[] selectedTags = editLmsHeader.getAccTags().split(",");
			model.addAttribute("selectedTags", selectedTags);
			lmsDetailList = editLmsHeader.getLmsDetailList();

		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed To Generated Lead.");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/deleteContactPersonLeadEdit", method = RequestMethod.POST)
	@ResponseBody
	public Info deleteContactPersonLeadEdit(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {

			int id = Integer.parseInt(request.getParameter("id"));

			if (lmsDetailList.get(id).getLmsId() == 0) {
				lmsDetailList.remove(id);
			} else {
				lmsDetailList.get(id).setDelStatus(0);
			}

			info.setError(false);
			info.setMsg("Successfully Deleted");
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMsg("failed Deleted");
		}
		return info;
	}

	@RequestMapping(value = "/submitEditLms", method = RequestMethod.POST)
	public String submitLms(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		try {

			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date dt = new Date();

			// String custName = request.getParameter("custName");
			String cmpName = request.getParameter("cmpName");
			int type = Integer.parseInt(request.getParameter("type"));
			int channelId = Integer.parseInt(request.getParameter("channelId"));
			int domainId = Integer.parseInt(request.getParameter("domainId"));
			String domainText = request.getParameter("domainText");
			String accCode = request.getParameter("accCode");
			String[] accTag = request.getParameterValues("accTag");
			String website = request.getParameter("website");
			String custName = request.getParameter("cName");
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
			// System.out.println(tags);

			editLmsHeader.setAccCompany(cmpName);
			editLmsHeader.setCustomerName(custName);
			editLmsHeader.setMdAccTypeId(type);
			editLmsHeader.setChannelId(channelId);
			editLmsHeader.setAccDomainId(domainId);
			editLmsHeader.setAccDomainOther(domainText);
			editLmsHeader.setAccCode(accCode);
			editLmsHeader.setAccTags(tags);
			editLmsHeader.setAccWebsite(website);
			editLmsHeader.setAccEmpCount(empCount);
			editLmsHeader.setAccCompanyLandline(contactNo);
			editLmsHeader.setAccScaleDesc(scaleDesc);
			editLmsHeader.setAccRemark(remark);
			editLmsHeader.setAccAtsRating(rating);

			editLmsHeader.setLmsDetailList(lmsDetailList);

			// System.out.println(lmsHeader);
			LmsHeader res = Constants.getRestTemplate().postForObject(Constants.url + "addNewLmsHeader", editLmsHeader,
					LmsHeader.class);
			if (res == null) {
				session.setAttribute("errorMsg", "Failed to update lead.");
			} else {

				session.setAttribute("successMsg", "Lead updated successfully.");
			}
		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed to update lead.");
			e.printStackTrace();
		}
		return "redirect:/showLeadList";
	}

	@RequestMapping(value = "/submitLms", method = RequestMethod.POST)
	public String submitEditLms(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		try {

			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
			Date dt = new Date();

			// String custName = request.getParameter("custName");
			String cmpName = request.getParameter("cmpName");
			int type = Integer.parseInt(request.getParameter("type"));
			int channelId = Integer.parseInt(request.getParameter("channelId"));
			int domainId = Integer.parseInt(request.getParameter("domainId"));
			String domainText = request.getParameter("domainText");
			// String accCode = request.getParameter("accCode");
			String[] accTag = request.getParameterValues("accTag");
			String website = request.getParameter("website");
			String custName = request.getParameter("cName");
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
			// System.out.println(tags);
			LmsHeader lmsHeader = new LmsHeader();
			lmsHeader.setAccCompany(cmpName);
			lmsHeader.setMdAccTypeId(type);
			lmsHeader.setChannelId(channelId);
			lmsHeader.setAccDomainId(domainId);
			lmsHeader.setAccDomainOther(domainText);
			lmsHeader.setCustomerName(custName);
			// lmsHeader.setAccCode(accCode);
			lmsHeader.setAccTags(tags);
			lmsHeader.setAccWebsite(website);
			lmsHeader.setAccEmpCount(empCount);
			lmsHeader.setAccCompanyLandline(contactNo);
			lmsHeader.setAccScaleDesc(scaleDesc);
			lmsHeader.setAccRemark(remark);
			lmsHeader.setAccAtsRating(rating);
			lmsHeader.setDelStatus(1);
			lmsHeader.setIsActive(1);
			lmsHeader.setMakerUserId(userDetail.getEmpId());
			lmsHeader.setMakerDatetime(sf.format(dt));

			lmsHeader.setLmsDetailList(lmsDetailList);

			// System.out.println(lmsHeader);
			LmsHeader res = Constants.getRestTemplate().postForObject(Constants.url + "addNewLmsHeader", lmsHeader,
					LmsHeader.class);
			if (res == null) {
				session.setAttribute("errorMsg", "Failed To Generated Lead.");
			} else {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("mdAccTypeId", 1);
				map.add("statusSequence", 0);
				TaskStatus[] sts = Constants.getRestTemplate()
						.postForObject(Constants.url + "getTaskStatusByAccTypeIdAndSequnce", map, TaskStatus[].class);

				TaskDetails taskDetails = new TaskDetails();
				taskDetails.setMdAccTypeId(1);
				taskDetails.setPriKey(res.getLmsId());
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
				TaskDetails newTask = Constants.getRestTemplate().postForObject(Constants.url + "addNewTask",
						taskDetails, TaskDetails.class);
				session.setAttribute("successMsg", "Lead Generated Successfully.");
			}
		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed To Generated Lead.");
			e.printStackTrace();
		}
		return "redirect:/showLeadList";
	}

	/*
	 * @RequestMapping(value = "/addEnquiry", method = RequestMethod.GET) public
	 * String addEnquiry(HttpServletRequest request, HttpServletResponse response,
	 * Model model) {
	 * 
	 * String mav = "addEnquiry";
	 * 
	 * try {
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return mav; }
	 */

	/*
	 * @RequestMapping(value = "/showEnquiryList", method = RequestMethod.GET)
	 * public String showEnquiryList(HttpServletRequest request, HttpServletResponse
	 * response, Model model) {
	 * 
	 * String mav = "showEnquiryList";
	 * 
	 * try {
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return mav; }
	 */

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

	@RequestMapping(value = "/allocateTask", method = RequestMethod.GET)
	public String allocateTask(HttpServletRequest request, Model model) {

		String mav = "allocateTask";
		HttpSession session = request.getSession();
		try {

			int taskId = Integer.parseInt(request.getParameter("taskId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("tagId", taskId);
			TaskDetailsEmpName taskDetail = Constants.getRestTemplate()
					.postForObject(Constants.url + "getTaskdetailsEmpnameByTaskId", map, TaskDetailsEmpName.class);

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occurs In Catch Block Of /deleteTag Mapping ");

		}

		// System.err.println(tagId+"\t"+"Tag Id");
		return mav;
	}

}
