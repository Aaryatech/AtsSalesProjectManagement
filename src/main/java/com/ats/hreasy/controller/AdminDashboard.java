package com.ats.hreasy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.common.DateConvertor;
import com.ats.hreasy.model.DashBoardSummary;
import com.ats.hreasy.model.DashboardData;
import com.ats.hreasy.model.DomainType;
import com.ats.hreasy.model.Employee;
import com.ats.hreasy.model.EmployeeTaskDashBoard;
import com.ats.hreasy.model.EmployeeWiseDashboard;
import com.ats.hreasy.model.GetTaskByModuleWise;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.ModeludeWiseDashboard;
import com.ats.hreasy.model.TaskDetails;
import com.ats.hreasy.model.TaskDetailsEmpName;
import com.ats.hreasy.model.TaskStatus;
import com.ats.hreasy.model.UserLoginData;

@Controller
@Scope("session")
public class AdminDashboard {

	@RequestMapping(value = "/adminDashboard", method = RequestMethod.GET)
	public String addRightsRole(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {

			mav = "dashboard/adminDashboard";
			EmployeeWiseDashboard[] emp = Constants.getRestTemplate()
					.getForObject(Constants.url + "getEmployeeWiseDashboardList", EmployeeWiseDashboard[].class);
			List<EmployeeWiseDashboard> empList = new ArrayList<>(Arrays.asList(emp));
			model.addAttribute("empList", empList);

			ModeludeWiseDashboard modeludeWiseDashboard = Constants.getRestTemplate()
					.getForObject(Constants.url + "modulewiseTaskDashboard", ModeludeWiseDashboard.class);
			model.addAttribute("modeludeWiseDashboard", modeludeWiseDashboard);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/moduleDetailWiseDashboard", method = RequestMethod.GET)
	public String moduleWiseDashboard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {
			int moduleId = Integer.parseInt(request.getParameter("moduleId"));
			mav = "dashboard/moduleWiseDashboard";
			model.addAttribute("moduleId", moduleId);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			Employee[] emp = Constants.getRestTemplate().postForObject(Constants.url + "getAllEmployeeList", map,
					Employee[].class);
			List<Employee> empList = new ArrayList<>(Arrays.asList(emp));
			model.addAttribute("empList", empList);

			DomainType[] domainType = Constants.getRestTemplate().getForObject(Constants.url + "getAllDomainTypelist",
					DomainType[].class);
			List<DomainType> domainList = new ArrayList<DomainType>(Arrays.asList(domainType));

			model.addAttribute("domainList", domainList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/getTaskByModuleWiseList", method = RequestMethod.POST)
	@ResponseBody
	public GetTaskByModuleWise getTaskByModuleWiseList(HttpServletRequest request, HttpServletResponse response) {

		GetTaskByModuleWise getTaskByModuleWise = new GetTaskByModuleWise();
		try {
			HttpSession session = request.getSession();
			int moduleId = Integer.parseInt(request.getParameter("moduleId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("moduleId", moduleId);

			getTaskByModuleWise = Constants.getRestTemplate().postForObject(Constants.url + "getTaskByModuleWise", map,
					GetTaskByModuleWise.class);
 
		} catch (Exception e) {
			getTaskByModuleWise = new GetTaskByModuleWise();
			e.printStackTrace();
		}
		return getTaskByModuleWise;
	}

	TaskDetailsEmpName taskDetail = new TaskDetailsEmpName();

	@RequestMapping(value = "/editTask", method = RequestMethod.GET)
	public String editTask(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {
			int taskId = Integer.parseInt(request.getParameter("taskId"));
			mav = "task/editTask";

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("taskId", taskId);
			taskDetail = Constants.getRestTemplate().postForObject(Constants.url + "getTaskdetailsEmpnameByTaskId", map,
					TaskDetailsEmpName.class);

			Employee[] emp = Constants.getRestTemplate().postForObject(Constants.url + "getAllEmployeeList", map,
					Employee[].class);
			List<Employee> empList = new ArrayList<>(Arrays.asList(emp));
			model.addAttribute("empList", empList);

			try {
				model.addAttribute("allocateTo", taskDetail.getTaskAllotedTo().split(","));
			} catch (Exception e) {
				e.printStackTrace();
			}

			model.addAttribute("taskDetail", taskDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	String taskIds = new String();

	@RequestMapping(value = "/allocateTaskCommon", method = RequestMethod.GET)
	public String allocateTaskCommon(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {
			taskIds = request.getParameter("list");
			mav = "task/allocateTaskCommon";

			//System.out.println(taskIds);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

			Employee[] emp = Constants.getRestTemplate().postForObject(Constants.url + "getAllEmployeeList", map,
					Employee[].class);
			List<Employee> empList = new ArrayList<>(Arrays.asList(emp));
			model.addAttribute("empList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/submitAllocateCommontask", method = RequestMethod.POST)
	@ResponseBody
	public Info submitAllocateCommontask(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		Info info = new Info();

		try {

			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date dt = new Date();

			// String custName = request.getParameter("custName");

			String sdate = request.getParameter("sdate");
			String stime = request.getParameter("stime");
			String taskDescription = request.getParameter("taskDescription");
			String allocateTo = request.getParameter("allocateTo");
			int priority = Integer.parseInt(request.getParameter("priority"));

			// //System.out.println(allocateTo);

			String[] ids = taskIds.split(",");
			for (int i = 0; i < ids.length; i++) {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("taskId", ids[i]);
				TaskDetails taskinfo = Constants.getRestTemplate().postForObject(Constants.url + "getTaskById", map,
						TaskDetails.class);

				taskinfo.setTaskAllotmentInstructions(taskDescription);
				taskinfo.setTaskAllotedTo(allocateTo);
				taskinfo.setTaskPriority(priority);
				taskinfo.setTaskScheDate(DateConvertor.convertToYMD(sdate));
				taskinfo.setTaskScheTime(DateConvertor.convertToYMD(sdate) + " " + stime);
				TaskDetails update = Constants.getRestTemplate().postForObject(Constants.url + "addNewTask", taskinfo,
						TaskDetails.class);

			}
			info.setError(false);
			info.setMsg("Insert new Task");
		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed to update lead.");
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/submitEdittask", method = RequestMethod.POST)
	@ResponseBody
	public Info submitEdittask(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		Info info = new Info();

		try {

			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date dt = new Date();

			// String custName = request.getParameter("custName");

			String sdate = request.getParameter("sdate");
			String stime = request.getParameter("stime");
			String taskDescription = request.getParameter("taskDescription");
			String allocateTo = request.getParameter("allocateTo");
			int priority = Integer.parseInt(request.getParameter("priority"));

			// //System.out.println(allocateTo);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("taskId", taskDetail.getTaskId());
			TaskDetails taskinfo = Constants.getRestTemplate().postForObject(Constants.url + "getTaskById", map,
					TaskDetails.class);

			taskinfo.setTaskAllotmentInstructions(taskDescription);
			taskinfo.setTaskAllotedTo(allocateTo);
			taskinfo.setTaskPriority(priority);
			taskinfo.setTaskScheDate(DateConvertor.convertToYMD(sdate));
			taskinfo.setTaskScheTime(DateConvertor.convertToYMD(sdate) + " " + stime);
			TaskDetails update = Constants.getRestTemplate().postForObject(Constants.url + "addNewTask", taskinfo,
					TaskDetails.class);

			info.setError(false);
			info.setMsg("Insert new Task");
		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed to update lead.");
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/lmsDashBoard", method = RequestMethod.GET)
	public String lmsDashBoard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {

			mav = "dashboard/lmsDashBoard";
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map = new LinkedMultiValueMap<>();
			map.add("mdAccTypeId", "1,4,5");
			TaskStatus[] taskStatus = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllTaskStatusBymdAccTypeId", map, TaskStatus[].class);
			List<TaskStatus> stsList = new ArrayList<>(Arrays.asList(taskStatus));
			model.addAttribute("stsList", stsList);

			map = new LinkedMultiValueMap<>();
			map.add("moduleId", "1");
			EmployeeTaskDashBoard[] employeeTaskDashBoard = Constants.getRestTemplate()
					.postForObject(Constants.url + "employeewiseTaskwiseList", map, EmployeeTaskDashBoard[].class);
			List<EmployeeTaskDashBoard> employeeTaskDashBoardList = new ArrayList<>(
					Arrays.asList(employeeTaskDashBoard));
			model.addAttribute("employeeTaskDashBoardList", employeeTaskDashBoardList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/lmsDetailDashBoard", method = RequestMethod.GET)
	public String lmsDetailDashBoard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {

			mav = "dashboard/lmsDetailDashBoard";

			int moduleId = Integer.parseInt(request.getParameter("moduleId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map = new LinkedMultiValueMap<>();
			if (moduleId == 1) {
				map.add("mdAccTypeId", "1,4,5");
			} else if (moduleId == 2) {
				map.add("mdAccTypeId", "2,4,5");
			} else if (moduleId == 2) {
				map.add("mdAccTypeId", "3,4,5");
			}

			TaskStatus[] taskStatus = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllTaskStatusBymdAccTypeId", map, TaskStatus[].class);
			List<TaskStatus> stsList = new ArrayList<>(Arrays.asList(taskStatus));
			model.addAttribute("stsList", stsList);

			model.addAttribute("moduleId", moduleId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/getTaskByStatusWiseList", method = RequestMethod.POST)
	@ResponseBody
	public GetTaskByModuleWise getTaskByStatusWiseList(HttpServletRequest request, HttpServletResponse response) {

		GetTaskByModuleWise getTaskByModuleWise = new GetTaskByModuleWise();
		try {
			HttpSession session = request.getSession();
			int moduleId = Integer.parseInt(request.getParameter("moduleId"));
			int status = Integer.parseInt(request.getParameter("status"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("moduleId", moduleId);
			map.add("status", status);
			getTaskByModuleWise = Constants.getRestTemplate().postForObject(Constants.url + "getTaskByStatusWiseList",
					map, GetTaskByModuleWise.class);

		} catch (Exception e) {
			getTaskByModuleWise = new GetTaskByModuleWise();
			e.printStackTrace();
		}
		return getTaskByModuleWise;
	}

	@RequestMapping(value = "/inqDashBoard", method = RequestMethod.GET)
	public String inqDashBoard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = new String();

		try {

			mav = "dashboard/inqDashBoard";
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map = new LinkedMultiValueMap<>();
			map.add("mdAccTypeId", "2,4,5");
			TaskStatus[] taskStatus = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllTaskStatusBymdAccTypeId", map, TaskStatus[].class);
			List<TaskStatus> stsList = new ArrayList<>(Arrays.asList(taskStatus));
			model.addAttribute("stsList", stsList);

			map = new LinkedMultiValueMap<>();
			map.add("moduleId", "2");
			EmployeeTaskDashBoard[] employeeTaskDashBoard = Constants.getRestTemplate()
					.postForObject(Constants.url + "employeewiseTaskwiseList", map, EmployeeTaskDashBoard[].class);
			List<EmployeeTaskDashBoard> employeeTaskDashBoardList = new ArrayList<>(
					Arrays.asList(employeeTaskDashBoard));
			model.addAttribute("employeeTaskDashBoardList", employeeTaskDashBoardList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}
