package com.ats.hreasy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.common.EmailUtility;
import com.ats.hreasy.common.VpsImageUpload;
import com.ats.hreasy.model.Channel;
import com.ats.hreasy.model.City;
import com.ats.hreasy.model.Designation;
import com.ats.hreasy.model.LmsDetail;
import com.ats.hreasy.model.LmsHeader;
import com.ats.hreasy.model.LmsHeaderWithNames;
import com.ats.hreasy.model.States;
import com.ats.hreasy.model.TaskDetails;
import com.ats.hreasy.model.TaskStatus;
import com.ats.hreasy.model.UserLoginData;

@Controller
@Scope("session")
public class ImporExcel {

	@RequestMapping(value = "/importLead", method = RequestMethod.GET)
	public String importLead(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		String mav = null;

		try {

			mav = "fileUpload/importLeadExcel";

		} catch (Exception e) {
			e.printStackTrace();
		}
		// }
		return mav;
	}

	@RequestMapping(value = "/submitImportLeadExcel", method = RequestMethod.POST)
	public String submitImportLeadExcel(@RequestParam("fileNew") List<MultipartFile> fileNew,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		try {
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");
			SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
			Date date = new Date();
			VpsImageUpload upload = new VpsImageUpload();
			String imageName = new String();
			imageName = dateTimeInGMT.format(date) + "_" + fileNew.get(0).getOriginalFilename();

			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
			Date dt = new Date();

			upload.saveUploadedFiles(fileNew.get(0), Constants.docSaveUrl, imageName);

			String fileIn = Constants.docSaveUrl + imageName;

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

			// temp.xls2020-02-27_19:30:03_abc.xls
			FileInputStream file = new FileInputStream(new File(Constants.docSaveUrl + imageName));

			// Create Workbook instance holding reference to .xlsx file
			HSSFWorkbook workbook = new HSSFWorkbook(file);

			HSSFSheet sheet = workbook.getSheetAt(0);

			Row row;
			DataFormatter formatter = new DataFormatter();
			try {
				for (int i = 1; i <= sheet.getLastRowNum(); i++) {

					row = (Row) sheet.getRow(i);

					int accTypeId = (int) row.getCell(1).getNumericCellValue();
					String custName = formatter.formatCellValue(row.getCell(3));

					String domainName = formatter.formatCellValue(row.getCell(6));
					String companyName = formatter.formatCellValue(row.getCell(9));
					String website = formatter.formatCellValue(row.getCell(10));
					String landline = formatter.formatCellValue(row.getCell(17));
					String status = formatter.formatCellValue(row.getCell(18));
					String remark = formatter.formatCellValue(row.getCell(19));
					String link = formatter.formatCellValue(row.getCell(29));

					int empCout = 0;

					try {
						empCout = (int) row.getCell(14).getNumericCellValue();
					} catch (Exception e) {
						empCout = 0;
						// e.printStackTrace();
					}

					// ----Detail----

					String personName = formatter.formatCellValue(row.getCell(25));
					String contact = formatter.formatCellValue(row.getCell(26));
					String contact2 = formatter.formatCellValue(row.getCell(27));
					String email = formatter.formatCellValue(row.getCell(28));

					LmsHeader lmsHeader = new LmsHeader();

					String channel = formatter.formatCellValue(row.getCell(2));
					String state = formatter.formatCellValue(row.getCell(15));
					String city = formatter.formatCellValue(row.getCell(13));
					String designation = formatter.formatCellValue(row.getCell(24));

					MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<>();
					map1.add("channelName", channel);
					Channel getChannel = Constants.getRestTemplate()
							.postForObject(Constants.url + "getChannelBychanelname", map1, Channel.class);

					if (getChannel.getmChannelId() == 0) {
						getChannel.setActive(1);
						getChannel.setDelStatus(1);
						getChannel.setmChannelName(channel);
						getChannel.setmChannelDesc(channel);
						getChannel.setMakerUserId(userDetail.getEmpId());
						getChannel.setMakerDatetime(sf.format(dt));
						getChannel = Constants.getRestTemplate().postForObject(Constants.url + "saveChannel",
								getChannel, Channel.class);
					}

					map1 = new LinkedMultiValueMap<>();
					map1.add("stateName", state);
					States getStates = Constants.getRestTemplate().postForObject(Constants.url + "getByStateName", map1,
							States.class);

					if (getStates.getmStateId() == 0) {
						getStates.setIsActive(1);
						getStates.setDelStatus(1);
						getStates.setmStateName(state);
						getStates = Constants.getRestTemplate().postForObject(Constants.url + "saveState", getStates,
								States.class);
					}

					map1 = new LinkedMultiValueMap<>();
					map1.add("cityName", city);
					City getCity = Constants.getRestTemplate().postForObject(Constants.url + "getCitiesByCityName",
							map1, City.class);
					if (getCity.getmCityId() == 0) {
						getCity.setIsActive(1);
						getCity.setDelStatus(1);
						getCity.setmCityName(city);
						getCity.setmStateId(getStates.getmStateId());
						getCity = Constants.getRestTemplate().postForObject(Constants.url + "saveCity", getCity,
								City.class);
					}

					map1 = new LinkedMultiValueMap<>();
					map1.add("desigName", designation);
					Designation getDesignation = Constants.getRestTemplate()
							.postForObject(Constants.url + "getDesignationBydesName", map1, Designation.class);
					if (getDesignation.getmDesignationId() == 0) {
						getDesignation.setActive(true);
						getDesignation.setDelStatus(true);
						getDesignation.setmDesignationName(designation);
						getDesignation.setMakerUserID(userDetail.getEmpId());
						getDesignation.setMakerDatetime(sf.format(dt));
						getDesignation = Constants.getRestTemplate().postForObject(Constants.url + "savedesignation",
								getDesignation, Designation.class);
					}

					lmsHeader.setChannelId(getChannel.getmChannelId());
					lmsHeader.setmStateId(getStates.getmStateId());
					lmsHeader.setmCityId(getCity.getmCityId());
					/*
					 * System.out.println(designation + " - " + personName + " - " + contact + " - "
					 * + contact2 + " - " + email + " - " + link);
					 */

					lmsHeader.setAccCompany(companyName);
					lmsHeader.setMdAccTypeId(accTypeId);

					lmsHeader.setAccDomainId(1);
					lmsHeader.setAccDomainOther(domainName);
					lmsHeader.setCustomerName(custName);
					lmsHeader.setAccTags("1");
					lmsHeader.setAccWebsite(website);
					lmsHeader.setAccEmpCount(empCout);
					lmsHeader.setAccCompanyLandline(landline);
					lmsHeader.setAccScaleDesc("");
					lmsHeader.setAccRemark(remark + "," + link);
					lmsHeader.setAccAtsRating("1");
					lmsHeader.setDelStatus(1);
					lmsHeader.setIsActive(1);
					lmsHeader.setMakerUserId(userDetail.getEmpId());
					lmsHeader.setMakerDatetime(sf.format(dt));

					List<LmsDetail> lmsDetailList = new ArrayList<LmsDetail>();
					LmsDetail lmsDetail = new LmsDetail();

					lmsDetail.setCpEmail(email);
					lmsDetail.setCpMobile(contact);
					lmsDetail.setCpMobile2(contact2);
					lmsDetail.setCpName(personName);
					lmsDetail.setExVar1(designation);
					lmsDetail.setDelStatus(1);
					lmsDetail.setCpPrimary(1);
					lmsDetail.setCpDesignationId(getDesignation.getmDesignationId());
					lmsDetailList.add(lmsDetail);

					lmsHeader.setLmsDetailList(lmsDetailList);

					String[] stsarr = status.split("-");

					map = new LinkedMultiValueMap<>();
					map.add("mdAccTypeId", 1);
					map.add("statusSequence", 0);
					TaskStatus[] sts = Constants.getRestTemplate().postForObject(
							Constants.url + "getTaskStatusByAccTypeIdAndSequnce", map, TaskStatus[].class);
					lmsHeader.setAccStatus(sts[0].getmTaskStatusId());
					// System.out.println(lmsHeader);
					LmsHeader res = Constants.getRestTemplate().postForObject(Constants.url + "addNewLmsHeader",
							lmsHeader, LmsHeader.class);
					if (res == null) {
						session.setAttribute("errorMsg", "Failed To Generated Lead.");
					} else {

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
						taskDetails.setTaskAllotedTo(String.valueOf(userDetail.getEmpId()));
						taskDetails.setTaskAllotmentInstructions("-");
						taskDetails.setTaskScheDate(yy.format(dt));
						taskDetails.setTaskScheTime(sf.format(dt));

						if (stsarr[0].equalsIgnoreCase("Close")) {
							taskDetails.setThisTaskStatus(1);
							taskDetails.setTaskDoneBy(userDetail.getEmpId());
							taskDetails.setTaskDoneDate(sf.format(dt));
						} else {
							taskDetails.setThisTaskStatus(0);
						}
						TaskDetails newTask = Constants.getRestTemplate().postForObject(Constants.url + "addNewTask",
								taskDetails, TaskDetails.class);

					}

				}
			} catch (Exception e) {
				// e.printStackTrace();
			}
			session.setAttribute("successMsg", "Lead Generated Successfully.");

		} catch (Exception e) {

			session.setAttribute("successMsg", "Lead Generated Successfully.");

			e.printStackTrace();
		}

		return "redirect:/importLead";
	}

	@RequestMapping(value = "/sendMailer", method = RequestMethod.GET)
	public String sendMailer(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		try {

			LmsHeaderWithNames[] tags = Constants.getRestTemplate()
					.getForObject(Constants.url + "getListOfAllLmsHeader", LmsHeaderWithNames[].class);
			List<LmsHeaderWithNames> list = new ArrayList<>(Arrays.asList(tags));

			String msg = "﻿﻿<!doctype html>\n" + "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "<head>\n"
					+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n"
					+ "<title>Aaryatech Solutions</title>\n" + "</head>\n"
					+ "<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" yahoo=\"fix\" style=\"font-family:Arial, sans-serif; background:#FFF;\">\n"
					+ "<!-- Wrapper -->\n"
					+ "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"margin-bottom:10px;\">\n"
					+ "  <tr>\n"
					+ "    <td width=\"100%\" valign=\"top\" bgcolor=\"#FFF\"><!-- Start Header--> <!--style=\"padding-top:20px; padding-bottom:20px;\"-->\n"
					+ "      \n"
					+ "      <table width=\"700\" id=\"tborder\" class=\"deviceWidth\" bgcolor=\"#fff\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative;\">\n"
					+ "        <!--f07d00-->\n" + "        \n" + "        <tr>\n"
					+ "        	<td align=\"center\" ><a href=\"https://aaryatechindia.in/\" target=\"_blank\"> <img src='"
					+ Constants.softPath
					+ "logo.jpg' alt=\"logo\" style=\"border:none; max-width:100%; float:none; vertical-align:top;\"></a></td>\n"
					+ "        </tr>\n" + "        <tr>\n"
					+ "        	<td align=\"center\" ><a href=\"https://aaryatechindia.in/\" target=\"_blank\"> <img src='"
					+ Constants.softPath
					+ "banner_pic.jpg' alt=\"banner_pic\" style=\"border:none; max-width:100%; float:none; vertical-align:top;\"></a></td>\n"
					+ "        </tr>\n" + "        <tr>\n"
					+ "        	<td align=\"center\" ><a href=\"https://aaryatechindia.in/\" target=\"_blank\"> <img src='"
					+ Constants.softPath
					+ "future_txt.jpg' alt=\"future_txt\" style=\"border:none; max-width:100%; float:none; vertical-align:top;\"></a></td>\n"
					+ "        </tr>\n" + "        <tr>\n"
					+ "        	<td align=\"center\" ><a href=\"https://aaryatechindia.in/\" target=\"_blank\"> <img src='"
					+ Constants.softPath
					+ "diwali_title.jpg' alt=\"diwali_title\" style=\"border:none; max-width:100%; float:none; vertical-align:top;\"></a></td>\n"
					+ "        </tr>\n" + "        <tr>\n"
					+ "        	<td align=\"center\" ><a href=\"https://aaryatechindia.in/\" target=\"_blank\"> <img src='"
					+ Constants.softPath
					+ "footer.jpg' alt=\"footer\" style=\"border:none; max-width:100%; float:none; vertical-align:top;\"></a></td>\n"
					+ "        </tr> " + "<tr>\n"
					+ "        	<td style=\"color:#0000ff; font-size:13px; line-height:20px; padding-left:10px;\">\n"
					+ "            	Best Regards, <br>\n" + "                Mr. Swapnil S Mashalkar <br>\n"
					+ "                Executive Director, <br>\n" + "                Cell No: +91 99 22 942972 <br>\n"
					+ "                Cell No: +91 75 88 174966 <br>\n" + "            </td>\n" + "        </tr>\n"
					+ "        \n" + "        <tr>\n"
					+ "        	<td style=\"color:#0000ff; font-size:13px; line-height:20px; padding-left:10px;\">\n"
					+ "            <img src='" + Constants.softPath
					+ "logo_footer.jpg' alt=\"\" style=\"margin:0px 0 5px 5px;\"> <br> \n"
					+ "            eSaleX | <span style=\"color:#00ff00;\">EasY</span> | <span style=\"color:#cc0000;\">BuzZ</span>\n"
					+ "            </td>\n" + "        </tr>\n" + "        \n" + "        <tr>\n"
					+ "        	<td style=\"color:#222222; font-size:13px; line-height:20px; padding-left:10px; padding-top:20px;\">\n"
					+ "            	<strong style=\"color:#0000ff;\">Head Office:</strong> <br>\n"
					+ "1st Floor, Raj Apartment, Rachna Vidyalay Road, <br>\n"
					+ "Sharanpur Rd, opp. to BSNL Office,  <br>\n" + "Nashik, Maharashtra 422002 \n"
					+ "            </td>\n" + "        </tr>\n" + "        \n" + "        <tr>\n"
					+ "        	<td style=\"color:#222222; font-size:13px; line-height:20px; padding-left:10px; padding-top:20px;\">\n"
					+ "            	<strong style=\"color:#0000ff;\">Pune Office :</strong> <br>\n"
					+ "C4,202,Kumar Prithvi,Mitha Nagar, <br>\n" + "Kondhwa,Pune-411048.\n" + "            </td>\n"
					+ "        </tr>\n" + "        \n" + "        \n" + "        \n" + "      </table>\n" + "      \n"
					+ "      <!--end--></td>\n" + "  </tr>\n" + "</table> </body>\n" + "</html>";

			EmailUtility.mailer("ATS wishes you a Very Happy Diwali & Prosperous New Year.", msg, list);

			session.setAttribute("successMsg", "Mail Send Successfully..!!");

		} catch (Exception e) {
			session.setAttribute("successMsg", "Failed to send mail.");
			e.printStackTrace();
		}
		return "redirect:/showLeadList";
	}
}
