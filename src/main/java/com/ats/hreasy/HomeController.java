package com.ats.hreasy;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.common.DateConvertor;
import com.ats.hreasy.common.RandomString;
import com.ats.hreasy.model.AccessRightModule;
import com.ats.hreasy.model.AccountType;
import com.ats.hreasy.model.AtsTaskSchedule;
import com.ats.hreasy.model.AtsTaskScheduleWithNames;
import com.ats.hreasy.model.EmpType;
import com.ats.hreasy.model.Employee;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.LoginResponse;
import com.ats.hreasy.model.TaskDetails;
import com.ats.hreasy.model.TaskStatus;
import com.ats.hreasy.model.UserLoginData;
import com.fasterxml.jackson.databind.ObjectMapper;
import static java.time.temporal.TemporalAdjusters.lastDayOfYear;

/**
 * Handles requests for the application home page.
 */
@Controller
@Scope("session")
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "home"; }
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		// model.addAttribute("loginOrforgot", "0");
					
		String mav = "login";

		return mav;
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = new String();
		HttpSession session = request.getSession();
		try {

			String name = request.getParameter("username");
			String password = request.getParameter("password");

			if (name.equalsIgnoreCase("") || password.equalsIgnoreCase("") || name == null || password == null) {

				mav = "redirect:/";
				session.setAttribute("errorMsg", "Login Failed");
			} else {
				// mav = "redirect:/dashboard";
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("userName", name);
				map.add("password", password);

				// Get User By Username And Password From Api
				try {
					UserLoginData user = Constants.getRestTemplate()
							.postForObject(Constants.url + "getUserByUsernameAndPassword", map, UserLoginData.class);
					// System.err.println("User Responce="+user);
					// System.err.println(user.getStatusCodeValue());
					// UserLoginData userResponse=user.getBody();
					if (user == null) {

						mav = "redirect:/";
						session.setAttribute("errorMsg", "Login Failed! Enter Valid Username Or Password");
					} else {

						List<AccessRightModule> moduleJsonList = new ArrayList<AccessRightModule>();
						try {
							map = new LinkedMultiValueMap<>();
							map.add("empTypeId", user.getEmpAccessId());
							EmpType editEmpType = Constants.getRestTemplate()
									.postForObject(Constants.url + "/getEmpTypeById", map, EmpType.class);

							AccessRightModule[] moduleJson = null;
							ObjectMapper mapper = new ObjectMapper();

							moduleJson = mapper.readValue(editEmpType.getEmpTypeAccess(), AccessRightModule[].class);

							moduleJsonList = new ArrayList<AccessRightModule>(Arrays.asList(moduleJson));

						} catch (Exception e) {

							e.printStackTrace();
						}
						session.setAttribute("moduleJsonList", moduleJsonList);
						mav = "redirect:/dashboard";
						session.setAttribute("userObj", user);
					}
				} catch (Exception e) {
					// TODO: handle exception
					mav = "redirect:/";
					session.setAttribute("errorMsg", "Something Went Wrong Please Try Again!!!");
					e.printStackTrace();
				}

			}

		} catch (Exception e) {
			mav = "redirect:/";
			session.setAttribute("errorMsg", "Login Failed");
			e.printStackTrace();
		}

		return mav;
	}

	/*
	 * @RequestMapping(value = "/dashboard", method = RequestMethod.GET) public
	 * String dashboard(HttpServletRequest request, HttpServletResponse response,
	 * Model model) {
	 * 
	 * String mav = "welcome";
	 * 
	 * try {
	 * 
	 * 
	 * String testString = request.getParameter("pass"); MessageDigest md =
	 * MessageDigest.getInstance("MD5"); byte[] messageDigest =
	 * md.digest(testString.getBytes()); BigInteger number = new BigInteger(1,
	 * messageDigest); String hashtext = number.toString(16);
	 * 
	 * System.out.println(hashtext);
	 * 
	 * RandomString randomString = new RandomString(); String password =
	 * randomString.nextString(); System.out.println(password);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return mav; }
	 */

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/sessionTimeOut", method = RequestMethod.GET)
	public String sessionTimeOut(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/setLocation", method = RequestMethod.POST)
	@ResponseBody
	public Info setLocation(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();

		try {
			int locationId = Integer.parseInt(request.getParameter("locationId"));

			HttpSession session = request.getSession();
			session.setAttribute("liveLocationId", locationId);
			info.setError(false);
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
		}

		return info;
	}

	@RequestMapping(value = "/setSubModId", method = RequestMethod.GET)
	public @ResponseBody void setSubModId(HttpServletRequest request, HttpServletResponse response) {
		int subModId = Integer.parseInt(request.getParameter("subModId"));
		int modId = Integer.parseInt(request.getParameter("modId"));
		/*
		 * System.out.println("subModId " + subModId); System.out.println("modId " +
		 * modId);
		 */
		HttpSession session = request.getSession();
		session.setAttribute("sessionModuleId", modId);
		session.setAttribute("sessionSubModuleId", subModId);
		session.removeAttribute("exportExcelList");
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(HttpServletRequest request, HttpServletResponse response) {
		String mav = "accessDenied";
		return mav;
	}

	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public @ResponseBody String sendMail(HttpServletRequest request, HttpServletResponse response) {
		final String emailSMTPserver = "smtp.gmail.com";
		final String emailSMTPPort = "587";
		final String mailStoreType = "imaps";

		final String username = "purchase.monginis1@gmail.com";
		final String password = "purchase1234#";

		/*
		 * final String username = "akshaykasar72@gmail.com"; final String password =
		 * "Mh151772";
		 */

		System.out.println("username** " + username);
		System.out.println("password** " + password);

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.starttls.enable", "true");

		/*
		 * Session session = Session.getDefaultInstance(props, new
		 * javax.mail.Authenticator() { protected PasswordAuthentication
		 * getPasswordAuthentication() { return new PasswordAuthentication(username,
		 * password); } });
		 * 
		 * try { Store mailStore = session.getStore(mailStoreType);
		 * mailStore.connect(emailSMTPserver, username, password);
		 * 
		 * String subject = " Order For ";
		 * 
		 * Message mimeMessage = new MimeMessage(session); mimeMessage.setFrom(new
		 * InternetAddress(username)); //
		 * mimeMessage.setRecipients(Message.RecipientType.TO, //
		 * InternetAddress.parse(vendorList.getVendorEmail()));
		 * mimeMessage.setRecipients(Message.RecipientType.TO,
		 * InternetAddress.parse("akshaykasar72@gmail.com"));
		 * mimeMessage.setSubject(subject); mimeMessage.setFileName("PO Print");
		 * Multipart multipart = new MimeMultipart();
		 * 
		 * MimeBodyPart messageBodyPart = new MimeBodyPart(); messageBodyPart = new
		 * MimeBodyPart(); StringBuilder sb = new StringBuilder();
		 * sb.append("<html><body style='color : blue;'>"); sb.append("Dear Sir, <br>" +
		 * "	Kindly dispatch the goods as per attached PO. We have changed our system as per FSSAI gudlines. Kindly follow following instructions while dispatching the material.<br>"
		 * +
		 * "	1. COA-Chemical Analysis Report is compulsory with all the raw materials. Kindly note that if COA is not sent, payment will be delayed.<br>"
		 * +
		 * "	2. New Software has been installed at our end, so send material as per PO quantity only. If excess material is sent we will not be able to accept it, as there is no facility in new software to inward excess material.<br>"
		 * + "	3. All bills shall compulsory carry our PO number. <br>" +
		 * "	4. All bills shall compulsory carry your FDA/ FSSAI license no. (This is important if your are supplying edible raw material which is used as raw material in our manufacturing process). Note that if your bill is without FSSAI no your payment will be put on hold.<br>\r\n"
		 * + "	<br>" + "	<br>" + "	डिअर सर, <br>" +
		 * "	माल पाठविताना खालील पॉईंट्स वर कृपया लक्ष द्यावे-- <br>" +
		 * "	1. मटेरियल सोबात COA (केमिकल अनेलीसिस ) रिपोर्ट पाठवणे. COA मटेरियल सोबत नाही आला तर, पेमेंट मध्ये दिरंगाई होईल याची नोंद घ्यावी.<br>"
		 * +
		 * "	2. परचेस ऑर्डर मध्ये जि Quantity आहे त्यानुसार बिल बनवणे, Quantity जर परचेस ऑर्डर नुसार जास्त आली तर माल परत केला जाईल ,कारण लक्षात घ्या आमच्या कडे नवीन सॉफ्टवेअर इन्स्टॉल केला आहे व त्या मध्ये परचेस ऑर्डर च्या जास्त माल इनवॉर्ड करता येत नाही.<br>"
		 * +
		 * "	३. आमच्या कडे नवीन सॉफ्टवेअर इन्स्टॉल झाल्या कारणाने, बिल बनवतानी परचेसे ऑर्डर नंबर टाकणे आवश्यक आहे  <br>"
		 * +
		 * "	4. तुम्ही जर आम्हाला खाद्य पदार्थ पाठवत/ सप्लाय  असाल तर तुमचा FSSAI license no तुमच्या बिलावर येणे अनिवार्य आहे.बिना FSSAI license नो च्या बिल आल्यास पेमेंट होल्ड वर जाईल."
		 * );
		 * 
		 * sb.append("</body></html>"); messageBodyPart.setContent("" + sb,
		 * "text/html; charset=utf-8"); multipart.addBodyPart(messageBodyPart);
		 * mimeMessage.setContent(multipart);
		 * 
		 * Transport.send(mimeMessage); } catch (Exception e) {
		 * 
		 * e.printStackTrace(); }
		 */
		return "success";
	}

	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public @ResponseBody String downloadFile(HttpServletRequest request, HttpServletResponse response) {

		try {
			/*
			 * URL url = new
			 * URL("http://97.74.228.55:8080/uploads/ITEM/15:03:14-download.jpg");
			 * URLConnection connection = url.openConnection(); InputStream is =
			 * connection.getInputStream();
			 */

			String dataDirectory = "/home/lenovo/Downloads/";
			/* request.getServletContext().getRealPath("/WEB-INF/downloads/pdf/"); */
			String fileName = "8_StandardReport.xls";
			Path file = Paths.get(dataDirectory, fileName);
			if (Files.exists(file)) {
				response.setContentType("application/pdf");
				response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
				try {
					Files.copy(file, response.getOutputStream());
					response.getOutputStream().flush();
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@RequestMapping(value = "/addofficeTask", method = RequestMethod.GET)
	public String addofficeTask(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "addofficeTask";

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/checkUserName", method = RequestMethod.POST)
	public String checkUserName(HttpServletRequest request, HttpServletResponse response, Model model) {
		Employee empResp = new Employee();
		HttpSession session = request.getSession();
		String mav = "";
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			String userName = request.getParameter("usernameFp");
			map.add("userName", userName);
			empResp = Constants.getRestTemplate().postForObject(Constants.url + "findEmployeeByUsername", map,
					Employee.class);
			if (empResp == null) {
				System.err.println("In If =================");
				session.setAttribute("errorPassMsg1", "Username Not Found Please Enter Valid User Name!!!");
				model.addAttribute("loginOrforgot", "1");
				mav = "login";
			} else {
				System.err.println("In else =================");
				model.addAttribute("empId", empResp.getEmpId());
				mav = "forgetPass";
			}
		} catch (Exception e) {
			// TODO: handle exception
			mav = "redirect:/";
			System.err.println("Exception Occured!!! In Catch Block Of /checkUserName Mapping");
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
		// System.err.println("In resetPassword====");
		String mav = "";
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		Info info = new Info();
		HttpSession session = request.getSession();
		try {
			int empId = Integer.parseInt(request.getParameter("empId"));
			String passWord = request.getParameter("password");
			map.add("empId", empId);
			map.add("passWord", passWord);
			info = Constants.getRestTemplate().postForObject(Constants.url + "resetPassword", map, Info.class);
			if (info.isError()) {
				session.setAttribute("errorMsg", "Unable To Reset Password");
				mav = "redirect:/";
			} else {
				session.setAttribute("successMsg", "Password Reset Successfully");
				mav = "login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			mav = "redirect:/";
			System.err.println("Exception Occured!!! In Catch Block Of /resetPassword Mapping");
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/atsAddTask", method = RequestMethod.GET)
	public String atsAddTask(HttpServletRequest request, HttpServletResponse response, Model model) {
		String mav = "atsAddTaskForm";
		List<AccountType> accountTypeList = new ArrayList<AccountType>();
		List<Employee> empList = new ArrayList<Employee>();

		try {
			AccountType[] accTypeArr = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllAccouctTypeList", null, AccountType[].class);
			accountTypeList = new ArrayList<AccountType>(Arrays.asList(accTypeArr));
			model.addAttribute("accTypeList", accountTypeList);

			Employee[] empArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllEmployeeList", null,
					Employee[].class);
			empList = new ArrayList<Employee>(Arrays.asList(empArr));
			model.addAttribute("empList", empList);

		} catch (Exception e) {
			// TODO: handle exception
			mav = "redirect:/";
			accountTypeList = new ArrayList<AccountType>();
			empList = new ArrayList<Employee>();
			System.err.println("Exception Occured!! In Catch Block Of /atsAddTask Mapping");
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/submitAtsAddTask", method = RequestMethod.POST)
	public String submitAtsAddTask(HttpServletRequest request, HttpServletResponse response, Model model) {
		AtsTaskSchedule atsTask = new AtsTaskSchedule();
		HttpSession session = request.getSession();
		String mav = "redirect:/showAtsTaskList";
		System.err.println("in submitAtsAddTask");

		try {
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
			Date dt = new Date();

			String taskTittle = request.getParameter("taskTittle");
			String taskDesc = request.getParameter("taskDesc");
			int accType = Integer.parseInt(request.getParameter("accType"));
			String taskPriority = request.getParameter("priority");
			String taskPts = request.getParameter("taskPts");
			// String taskRepType=request.getParameter("taskRepType");
			int isSeprate = Integer.parseInt(request.getParameter("isSeprate"));
			// String sDate=request.getParameter("sdate");
			// String eDate=request.getParameter("edate");
			String scTime = request.getParameter("stime");
			String apTime = request.getParameter("atime");
			String[] us = request.getParameterValues("allotedTo");
			String user = String.join(",", us);
			int RepType = Integer.parseInt(request.getParameter("taskType"));
			// System.err.println("Task Rep---->"+RepType);

			if (RepType == 1) {
				String sDate = request.getParameter("sdate");
				String eDate = request.getParameter("sdate");

				atsTask.setMdAccTypeId(accType);
				atsTask.setTaskTittle(taskTittle);
				atsTask.setTaskDesc(taskDesc);
				atsTask.setTaskPriority(taskPriority);
				atsTask.setTaskPts(taskPts);
				atsTask.setIsSeperateTask(isSeprate);
				atsTask.setTaskStartDate(DateConvertor.convertToYMD(sDate));
				atsTask.setTaskEndDate(DateConvertor.convertToYMD(eDate));
				atsTask.setTaskScheTime(DateConvertor.convertToYMD(sDate) + " " + scTime + ":00");
				atsTask.setTaskApprxTime(DateConvertor.convertToYMD(eDate) + " " + apTime + ":00");
				atsTask.setTaskAllottedTo(user);
				atsTask.setDelStatus(1);
				atsTask.setIsActive(1);

				atsTask.setTaskRepType(String.valueOf(RepType));
				atsTask.setMakerUserId(userDetail.getEmpId());
				atsTask.setMakerDatetime(sf.format(dt));
				atsTask.setExInt1(0);
				atsTask.setExInt2(0);

				System.err.println(atsTask);

				AtsTaskSchedule atsTaskResp = Constants.getRestTemplate().postForObject(Constants.url + "saveAtsTask",
						atsTask, AtsTaskSchedule.class);

				System.err.println(atsTaskResp + "Response From Save ats Task api");
				if (atsTaskResp == null) {
					// System.err.println("Not Saved");
					session.setAttribute("errorMsg", "Failed To Generated Lead.");
					mav = "redirect:/showAtsTaskList";

				} else {

					MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					map.add("mdAccTypeId", 3);
					map.add("statusSequence", 0);
					TaskStatus[] sts = Constants.getRestTemplate().postForObject(
							Constants.url + "getTaskStatusByAccTypeIdAndSequnce", map, TaskStatus[].class);

					if (atsTaskResp.getIsSeperateTask() == 0) {
						System.err.println("Single Task Detail");
						TaskDetails taskDetails = new TaskDetails();
						taskDetails.setMdAccTypeId(3);
						taskDetails.setPriKey(atsTaskResp.getAtsTaskId());
						taskDetails.setTaskTittle(sts[0].getmTaskStatusName() + atsTaskResp.getTaskTittle());
						taskDetails.setTaskFinalStatus(sts[0].getmTaskStatusId());
						taskDetails.setTaskPriority(1);
						taskDetails.setTaskPts(sts[0].getmTaskPts());
						taskDetails.setMakerUserId(userDetail.getEmpId());
						taskDetails.setMakerDatetime(sf.format(dt));
						taskDetails.setDelStatus(1);
						taskDetails.setIsActive(1);
						taskDetails.setTaskAllotedTo(atsTaskResp.getTaskAllottedTo());

						taskDetails.setTaskAllotmentInstructions("-");
						taskDetails.setTaskScheDate(yy.format(dt));
						taskDetails.setTaskScheTime(sf.format(dt));
						taskDetails.setTaskAllottedBy(atsTask.getMakerUserId());

						TaskDetails newTask = Constants.getRestTemplate().postForObject(Constants.url + "addNewTask",
								taskDetails, TaskDetails.class);
						session.setAttribute("successMsg", "Ats Task Generated Successfully.");

					} else {
						System.err.println("Multiple Task Detail");
						for (String u : us) {
							TaskDetails taskDetails = new TaskDetails();
							taskDetails.setMdAccTypeId(3);
							taskDetails.setPriKey(atsTaskResp.getAtsTaskId());
							taskDetails.setTaskTittle(sts[0].getmTaskStatusName() + atsTaskResp.getTaskTittle());
							taskDetails.setTaskFinalStatus(sts[0].getmTaskStatusId());
							taskDetails.setTaskPriority(1);
							taskDetails.setTaskPts(sts[0].getmTaskPts());
							taskDetails.setMakerUserId(userDetail.getEmpId());
							taskDetails.setMakerDatetime(sf.format(dt));
							taskDetails.setDelStatus(1);
							taskDetails.setIsActive(1);
							taskDetails.setTaskAllotedTo(u);

							taskDetails.setTaskAllotmentInstructions("-");
							taskDetails.setTaskScheDate(yy.format(dt));
							taskDetails.setTaskScheTime(sf.format(dt));
							taskDetails.setTaskAllottedBy(atsTask.getMakerUserId());

							TaskDetails newTask = Constants.getRestTemplate()
									.postForObject(Constants.url + "addNewTask", taskDetails, TaskDetails.class);
							session.setAttribute("successMsg", "Ats Task Generated Successfully.");

						}

					}
					mav = "redirect:/showAtsTaskList";
				}
			} else if (RepType == 2) {
				String sDate = request.getParameter("sdate");
				String eDate = request.getParameter("edate");

				String[] selectedDays = request.getParameterValues("selectDay");
				List<String> selectedDates = new ArrayList<String>();

				for (String sd : selectedDays) {
					int temp = Integer.parseInt(sd);
					for (Date j = yy.parse(DateConvertor.convertToYMD(sDate)); j
							.compareTo(yy.parse(DateConvertor.convertToYMD(eDate))) <= 0;) {
						// System.err.println("a");
						Calendar c = Calendar.getInstance();
						c.setTime(j);
						int dayOfWeek = c.get(Calendar.DAY_OF_WEEK) - 1;
						if (temp == dayOfWeek) {
							selectedDates.add(yy.format(j));

							System.err.println("dow" + dayOfWeek + "\t" + sd + "\t" + yy.format(j));
						}

						j.setTime(j.getTime() + 1000 * 60 * 60 * 24);

					}

				}

				for (int i = 0; i < selectedDates.size(); i++) {
					atsTask.setMdAccTypeId(accType);
					atsTask.setTaskTittle(taskTittle);
					atsTask.setTaskDesc(taskDesc);
					atsTask.setTaskPriority(taskPriority);
					atsTask.setTaskPts(taskPts);
					atsTask.setIsSeperateTask(isSeprate);
					atsTask.setTaskStartDate(selectedDates.get(i));
					atsTask.setTaskEndDate(selectedDates.get(i));
					atsTask.setTaskScheTime(selectedDates.get(i) + " " + scTime + ":00");
					atsTask.setTaskApprxTime(selectedDates.get(i) + " " + apTime + ":00");
					atsTask.setTaskAllottedTo(user);
					atsTask.setDelStatus(1);
					atsTask.setIsActive(1);

					atsTask.setTaskRepType(String.valueOf(RepType));
					atsTask.setMakerUserId(userDetail.getEmpId());
					atsTask.setMakerDatetime(sf.format(dt));
					atsTask.setExInt1(0);
					atsTask.setExInt2(0);

					System.err.println(atsTask);
					AtsTaskSchedule atsTaskResp = Constants.getRestTemplate()
							.postForObject(Constants.url + "saveAtsTask", atsTask, AtsTaskSchedule.class);

					System.err.println(atsTaskResp + "Response From Save ats Task api");
					if (atsTaskResp == null) {
							// System.err.println("Not Saved");
						session.setAttribute("errorMsg", "Failed To Generated Lead.");
						mav = "redirect:/showAtsTaskList";

					} else {

						MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
						map.add("mdAccTypeId", 3);
						map.add("statusSequence", 0);
						TaskStatus[] sts = Constants.getRestTemplate().postForObject(
								Constants.url + "getTaskStatusByAccTypeIdAndSequnce", map, TaskStatus[].class);

						if (atsTaskResp.getIsSeperateTask() == 0) {
							System.err.println("Single Task Detail");
							TaskDetails taskDetails = new TaskDetails();
							taskDetails.setMdAccTypeId(3);
							taskDetails.setPriKey(atsTaskResp.getAtsTaskId());
							taskDetails.setTaskTittle(sts[0].getmTaskStatusName() + atsTaskResp.getTaskTittle());
							taskDetails.setTaskFinalStatus(sts[0].getmTaskStatusId());
							taskDetails.setTaskPriority(1);
							taskDetails.setTaskPts(sts[0].getmTaskPts());
							taskDetails.setMakerUserId(userDetail.getEmpId());
							taskDetails.setMakerDatetime(sf.format(dt));
							taskDetails.setDelStatus(1);
							taskDetails.setIsActive(1);
							taskDetails.setTaskAllotedTo(atsTaskResp.getTaskAllottedTo());

							taskDetails.setTaskAllotmentInstructions("-");
							taskDetails.setTaskScheDate(selectedDates.get(i));
							taskDetails.setTaskScheTime(selectedDates.get(i)+" "+scTime+":00");
							taskDetails.setTaskAllottedBy(atsTask.getMakerUserId());

							TaskDetails newTask = Constants.getRestTemplate()
									.postForObject(Constants.url + "addNewTask", taskDetails, TaskDetails.class);
							session.setAttribute("successMsg", "Ats Task Generated Successfully.");

						} else {
							System.err.println("Multiple Task Detail");
							for (String u : us) {
								TaskDetails taskDetails = new TaskDetails();
								taskDetails.setMdAccTypeId(3);
								taskDetails.setPriKey(atsTaskResp.getAtsTaskId());
								taskDetails.setTaskTittle(sts[0].getmTaskStatusName() + atsTaskResp.getTaskTittle());
								taskDetails.setTaskFinalStatus(sts[0].getmTaskStatusId());
								taskDetails.setTaskPriority(1);
								taskDetails.setTaskPts(sts[0].getmTaskPts());
								taskDetails.setMakerUserId(userDetail.getEmpId());
								taskDetails.setMakerDatetime(sf.format(dt));
								taskDetails.setDelStatus(1);
								taskDetails.setIsActive(1);
								taskDetails.setTaskAllotedTo(u);

								taskDetails.setTaskAllotmentInstructions("-");
								taskDetails.setTaskScheDate(selectedDates.get(i));
								taskDetails.setTaskScheTime(selectedDates.get(i)+" "+scTime+":00");
								taskDetails.setTaskAllottedBy(atsTask.getMakerUserId());

								TaskDetails newTask = Constants.getRestTemplate()
										.postForObject(Constants.url + "addNewTask", taskDetails, TaskDetails.class);
								session.setAttribute("successMsg", "Ats Task Generated Successfully.");	
									
							}

						}
						mav = "redirect:/showAtsTaskList";
					}

				}

			}else if(RepType==3) {
				System.err.println("IF RepType == 3");
				String sDate = request.getParameter("sdate");
				String eDate = request.getParameter("sdate");
				Calendar c=Calendar.getInstance();
				String[] SplitDate=sDate.split("-");
			
				
				c.set(Calendar.MONTH, 11);
				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
				//System.err.println("Last Day"+yy.format(c.getTime()));
				
				String d=yy.format(c.getTime());
				List<String> monThlyDate=new ArrayList<String>();
				System.err.println("c.gettime=="+d);
				for (Date j = yy.parse(DateConvertor.convertToYMD(sDate)); j.compareTo(yy.parse(d)) <= 0;) {
					// System.err.println("a");
					
					c.setTime(j);
					if(c.get(Calendar.DAY_OF_MONTH)==Integer.parseInt(SplitDate[0])) {
						//int dayOfmonth = c.getTime() ;
						//System.err.println("Date"+ yy.format(c.getTime()));
						monThlyDate.add(yy.format(c.getTime()));
					}
					
					j.setTime(j.getTime() + 1000 * 60 * 60 * 24);

				}
				//System.err.println("datelist===="+monThlyDate);
				for(int i=0;i<monThlyDate.size();i++) {

					atsTask.setMdAccTypeId(accType);
					atsTask.setTaskTittle(taskTittle);
					atsTask.setTaskDesc(taskDesc);
					atsTask.setTaskPriority(taskPriority);
					atsTask.setTaskPts(taskPts);
					atsTask.setIsSeperateTask(isSeprate);
					atsTask.setTaskStartDate(monThlyDate.get(i));
					atsTask.setTaskEndDate(monThlyDate.get(i));
					atsTask.setTaskScheTime(monThlyDate.get(i) + " " + scTime + ":00");
					atsTask.setTaskApprxTime(monThlyDate.get(i) + " " + apTime + ":00");
					atsTask.setTaskAllottedTo(user);
					atsTask.setDelStatus(1);
					atsTask.setIsActive(1);

					atsTask.setTaskRepType(String.valueOf(RepType));
					atsTask.setMakerUserId(userDetail.getEmpId());
					atsTask.setMakerDatetime(sf.format(dt));
					atsTask.setExInt1(0);
					atsTask.setExInt2(0);

					System.err.println(atsTask);
					AtsTaskSchedule atsTaskResp = Constants.getRestTemplate()
							.postForObject(Constants.url + "saveAtsTask", atsTask, AtsTaskSchedule.class);

					System.err.println(atsTaskResp + "Response From Save ats Task api");
					if (atsTaskResp == null) {
							// System.err.println("Not Saved");
						session.setAttribute("errorMsg", "Failed To Generated Lead.");
						mav = "redirect:/showAtsTaskList";

					} else {

						MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
						map.add("mdAccTypeId", 3);
						map.add("statusSequence", 0);
						TaskStatus[] sts = Constants.getRestTemplate().postForObject(
								Constants.url + "getTaskStatusByAccTypeIdAndSequnce", map, TaskStatus[].class);

						if (atsTaskResp.getIsSeperateTask() == 0) {
							System.err.println("Single Task Detail");
							TaskDetails taskDetails = new TaskDetails();
							taskDetails.setMdAccTypeId(3);
							taskDetails.setPriKey(atsTaskResp.getAtsTaskId());
							taskDetails.setTaskTittle(sts[0].getmTaskStatusName() + atsTaskResp.getTaskTittle());
							taskDetails.setTaskFinalStatus(sts[0].getmTaskStatusId());
							taskDetails.setTaskPriority(1);
							taskDetails.setTaskPts(sts[0].getmTaskPts());
							taskDetails.setMakerUserId(userDetail.getEmpId());
							taskDetails.setMakerDatetime(sf.format(dt));
							taskDetails.setDelStatus(1);
							taskDetails.setIsActive(1);
							taskDetails.setTaskAllotedTo(atsTaskResp.getTaskAllottedTo());

							taskDetails.setTaskAllotmentInstructions("-");
							taskDetails.setTaskScheDate(monThlyDate.get(i));
							taskDetails.setTaskScheTime(monThlyDate.get(i)+" "+scTime+":00");
							taskDetails.setTaskAllottedBy(atsTask.getMakerUserId());

							TaskDetails newTask = Constants.getRestTemplate()
									.postForObject(Constants.url + "addNewTask", taskDetails, TaskDetails.class);
							session.setAttribute("successMsg", "Ats Task Generated Successfully.");

						} else {
							System.err.println("Multiple Task Detail");
							for (String u : us) {
								TaskDetails taskDetails = new TaskDetails();
								taskDetails.setMdAccTypeId(3);
								taskDetails.setPriKey(atsTaskResp.getAtsTaskId());
								taskDetails.setTaskTittle(sts[0].getmTaskStatusName() + atsTaskResp.getTaskTittle());
								taskDetails.setTaskFinalStatus(sts[0].getmTaskStatusId());
								taskDetails.setTaskPriority(1);
								taskDetails.setTaskPts(sts[0].getmTaskPts());
								taskDetails.setMakerUserId(userDetail.getEmpId());
								taskDetails.setMakerDatetime(sf.format(dt));
								taskDetails.setDelStatus(1);
								taskDetails.setIsActive(1);
								taskDetails.setTaskAllotedTo(u);

								taskDetails.setTaskAllotmentInstructions("-");
								taskDetails.setTaskScheDate(monThlyDate.get(i));
								taskDetails.setTaskScheTime(monThlyDate.get(i)+" "+scTime+":00");
								taskDetails.setTaskAllottedBy(atsTask.getMakerUserId());

								TaskDetails newTask = Constants.getRestTemplate()
										.postForObject(Constants.url + "addNewTask", taskDetails, TaskDetails.class);
								session.setAttribute("successMsg", "Ats Task Generated Successfully.");	
									
							}

						}
						mav = "redirect:/showAtsTaskList";
					}

				}
	
				
				
				
			}

		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Failed To Genrate Ats Task.");

			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/showAtsTaskList", method = RequestMethod.GET)
	public String showAtsTaskList(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<AtsTaskScheduleWithNames> atsTaskList = new ArrayList<AtsTaskScheduleWithNames>();
		HttpSession session = request.getSession();
		String mav = "atsTaskList";
		try {
			AtsTaskScheduleWithNames[] atsTask = Constants.getRestTemplate()
					.getForObject(Constants.url + "getAllAtsTaskScheduleWithNames", AtsTaskScheduleWithNames[].class);
			atsTaskList = new ArrayList<AtsTaskScheduleWithNames>(Arrays.asList(atsTask));
			if (atsTaskList.size() == 0) {
				session.setAttribute("errorMsg", "No Record Found!!!");
			} else {
				model.addAttribute("atsTaskLIst", atsTaskList);
			}
		} catch (Exception e) {
			// TODO: handle exception
			mav = "redirect:/";
			System.err.println("Exception Occured!!! In  Catch Block Of /showAtsTaskList Mapping");
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/deleteAtsTask", method = RequestMethod.GET)
	public String deleteLead(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		try {

			int atsTaskId = Integer.parseInt(request.getParameter("atsTaskId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("atsTaskId", atsTaskId);
			Info info = Constants.getRestTemplate().postForObject(Constants.url + "deleteAtsTask", map, Info.class);

			if (info.isError() == true) {
				session.setAttribute("errorMsg", "Failed To Delete Ats Task.");
			} else {

				session.setAttribute("successMsg", "Ats Task Deleted Successfully.");
			}
		} catch (Exception e) {
			session.setAttribute("errorMsg", "Failed To Delete  Ats Task.");
			e.printStackTrace();
		}
		return "redirect:/showAtsTaskList";
	}

	AtsTaskSchedule editAtsTask = new AtsTaskSchedule();

	@RequestMapping(value = "/editAtsTask", method = RequestMethod.GET)
	public String editAtsTask(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		String mav = "editAtsTask";
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		List<AccountType> AcctypeList = new ArrayList<AccountType>();
		List<Employee> empList = new ArrayList<Employee>();
		try {

			AccountType[] accArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllAccouctTypeList",
					null, AccountType[].class);
			AcctypeList = new ArrayList<AccountType>(Arrays.asList(accArr));
			model.addAttribute("AcctypeList", AcctypeList);
			int atsTaskId = Integer.parseInt(request.getParameter("atsTaskId"));
			map.add("atsTaskId", atsTaskId);
			editAtsTask = Constants.getRestTemplate().postForObject(Constants.url + "getAtsTaskById", map,
					AtsTaskSchedule.class);
			model.addAttribute("editAtsTask", editAtsTask);
			Employee[] empArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllEmployeeList", null,
					Employee[].class);
			empList = new ArrayList<Employee>(Arrays.asList(empArr));
			model.addAttribute("empList", empList);
			String[] allotedTo = editAtsTask.getTaskAllottedTo().split(",");
			model.addAttribute("allotedTo", allotedTo);

			String scTime = editAtsTask.getTaskScheTime();
			String apxTime = editAtsTask.getTaskApprxTime();
			String[] splitScTime = scTime.split(" ");
			String[] splitApxTime = apxTime.split(" ");
			String sct = splitScTime[1].toString();
			String apxt = splitApxTime[1].toString();
			String scT[] = sct.split(":");
			String apxT[] = apxt.split(":");
			String sctym = scT[0] + ":" + scT[1];
			String apxtym = apxT[0] + ":" + apxT[1];

			model.addAttribute("sctym", sctym);
			model.addAttribute("apxtym", apxtym);

		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Unable To Edit Ats Task");
			mav = "redirect:/showAtsTaskList";
			System.err.println("Exception Occured!!! In Catch Of /editAtsTAsk Mapping");
			e.printStackTrace();

		}
		return mav;
	}

	@RequestMapping(value = "/submitAtsEditTask", method = RequestMethod.POST)
	public String submitAtsEditTask(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mav = "redirect:/showAtsTaskList";
		try {
			String taskTittle = request.getParameter("taskTittle");
			String taskDesc = request.getParameter("taskDesc");
			int accType = Integer.parseInt(request.getParameter("accType"));
			String taskPriority = request.getParameter("priority");
			String taskPts = request.getParameter("taskPts");
			// String taskRepType=request.getParameter("taskRepType");
			// int isSeprate=Integer.parseInt(request.getParameter("isSeprate"));
			String sDate = request.getParameter("sdate");
			String eDate = request.getParameter("edate");
			String scTime = request.getParameter("stime");
			String apTime = request.getParameter("atime");
			// String [] us=request.getParameterValues("allotedTo");
			// String user=String.join(",", us);

			editAtsTask.setTaskTittle(taskTittle);
			editAtsTask.setTaskDesc(taskDesc);
			editAtsTask.setMdAccTypeId(accType);
			editAtsTask.setTaskPriority(taskPriority);
			editAtsTask.setTaskPts(taskPts);
			editAtsTask.setTaskStartDate(DateConvertor.convertToYMD(sDate));
			editAtsTask.setTaskEndDate(DateConvertor.convertToYMD(eDate));
			editAtsTask.setTaskScheTime(DateConvertor.convertToYMD(sDate) + " " + scTime + ":00");
			editAtsTask.setTaskApprxTime(DateConvertor.convertToYMD(eDate) + " " + apTime + ":00");

			AtsTaskSchedule atsTaskResp = Constants.getRestTemplate().postForObject(Constants.url + "saveAtsTask",
					editAtsTask, AtsTaskSchedule.class);
			System.err.println("save Ats Responce in edit");
			if (atsTaskResp == null) {
				session.setAttribute("errorMsg", "Failed To Update Ats Task!!!");
			} else {
				session.setAttribute("successMsg", "Ats Task Successfully Updated!!!");
			}

		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Failed To Update Ats Task Exception Occured!!!!!");
			System.err.println("Exception Occured!!! In Catch Block Of /submitAtsEditTask Mapping");
			e.printStackTrace();
		}

		return mav;
	}

}
