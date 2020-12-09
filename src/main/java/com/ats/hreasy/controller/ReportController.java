package com.ats.hreasy.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.common.DateConvertor;
import com.ats.hreasy.common.ExceUtil;
import com.ats.hreasy.common.ExportToExcel;

import com.ats.hreasy.model.ChannelReports;
import com.ats.hreasy.model.ChannelWiseDetailReport;
import com.ats.hreasy.model.CityReports;
import com.ats.hreasy.model.CityWiseDetailReport;
import com.ats.hreasy.model.DomainTypeReports;
import com.ats.hreasy.model.DomainWiseDetailReports;
import com.ats.hreasy.model.LeadConTymReport;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


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





@RequestMapping(value = "/ChannelWiseLeadCount", method = RequestMethod.GET)
public void custExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		ChannelReports[] channelCntRespArr=Constants.getRestTemplate().postForObject(Constants.url+"getChannelWiseCount", map, ChannelReports[].class);
	  	List<ChannelReports>  channelRepList=new ArrayList<ChannelReports>(Arrays.asList(channelCntRespArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Channel Name");
		rowData.add("Lead Count");
		//rowData.add("Owner Partner Id");
		//rowData.add("Owner Partner Name");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < channelRepList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ channelRepList.get(i).getmChannelName());
			rowData.add("" + channelRepList.get(i).getChnlLeadCount());
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "Channel Wise Lead Count";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


@RequestMapping(value = "/ChannelWiseInqCount", method = RequestMethod.GET)
public void ChannelWiseInqCountcustExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	//System.err.println("date Range========"+dates[0]);
	//System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
	ChannelReports[] channelCntRespArr=Constants.getRestTemplate().postForObject(Constants.url+"getChannelWiseCount", map, ChannelReports[].class);
  	List<ChannelReports>  channelRepList=new ArrayList<ChannelReports>(Arrays.asList(channelCntRespArr)); 
		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Channel Name");
		rowData.add("Inquiry Count");
		//rowData.add("Owner Partner Id");
		//rowData.add("Owner Partner Name");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < channelRepList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ channelRepList.get(i).getmChannelName());
			rowData.add("" + channelRepList.get(i).getChnlInqCount());
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "Channel Wise Inquiry Count";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}






@RequestMapping(value = "/CityWiseLeadCount", method = RequestMethod.GET)
public void CityWiseLeadCountcustExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	//System.err.println("date Range========"+dates[0]);
	//System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
	
		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();
		
		
		CityReports[] cityReportArr=Constants.getRestTemplate().postForObject(Constants.url+"getCityWiseCount", map, CityReports[].class);
		List<CityReports> cityReportList=new ArrayList<CityReports>(Arrays.asList(cityReportArr));
		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("City Name");
		rowData.add("Lead Count");
		//rowData.add("Owner Partner Id");
		//rowData.add("Owner Partner Name");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < cityReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ cityReportList.get(i).getmCityName());
			rowData.add("" + cityReportList.get(i).getCityLeadCount());
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "City Wise Lead Count";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


@RequestMapping(value = "/CityWiseInqCount", method = RequestMethod.GET)
public void CityWiseInqCountcustExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	//System.err.println("date Range========"+dates[0]);
	//System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
	
		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();
		
		
		CityReports[] cityReportArr=Constants.getRestTemplate().postForObject(Constants.url+"getCityWiseCount", map, CityReports[].class);
		List<CityReports> cityReportList=new ArrayList<CityReports>(Arrays.asList(cityReportArr));
		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("City Name");
		rowData.add("Inquiry Count");
		//rowData.add("Owner Partner Id");
		//rowData.add("Owner Partner Name");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < cityReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ cityReportList.get(i).getmCityName());
			rowData.add("" + cityReportList.get(i).getCityInqCount());
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "City Wise Inquiry Count";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}




@RequestMapping(value = "/DomainWiseLeadCount", method = RequestMethod.GET)
public void DomainWiseLeadCountcustExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	//System.err.println("date Range========"+dates[0]);
	//System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
	
		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();
		
		
		DomainTypeReports[] domainReportArr=Constants.getRestTemplate().postForObject(Constants.url+"getDomainWiseCount", map, DomainTypeReports[].class);
		List<DomainTypeReports> domainReportList=new ArrayList<DomainTypeReports>(Arrays.asList(domainReportArr));
		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Domain Name");
		rowData.add("Lead Count");
		//rowData.add("Owner Partner Id");
		//rowData.add("Owner Partner Name");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < domainReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ domainReportList.get(i).getmDomainName());
			rowData.add("" + domainReportList.get(i).getDomainLeadCount());
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "Domain Wise Lead Count";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	


}





@RequestMapping(value = "/DomainWiseInqCount", method = RequestMethod.GET)
public void DomainWiseInqCountcustExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	//System.err.println("date Range========"+dates[0]);
	//System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
	
		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();
		
		
		DomainTypeReports[] domainReportArr=Constants.getRestTemplate().postForObject(Constants.url+"getDomainWiseCount", map, DomainTypeReports[].class);
		List<DomainTypeReports> domainReportList=new ArrayList<DomainTypeReports>(Arrays.asList(domainReportArr));
		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Domain Name");
		rowData.add("Inquiry Count");
		//rowData.add("Owner Partner Id");
		//rowData.add("Owner Partner Name");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < domainReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ domainReportList.get(i).getmDomainName());
			rowData.add("" + domainReportList.get(i).getDomainInqCount());
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "Domain Wise Inquiry Count";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	


}







@RequestMapping(value = "/channelWiseLeadCntPdf", method = RequestMethod.GET)
public void channelWiseLeadCntPdf(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
	BufferedOutputStream outStream = null;
	System.out.println("Inside Pdf channelWiseLeadCntPdf");
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();


	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		ChannelReports[] channelCntRespArr=Constants.getRestTemplate().postForObject(Constants.url+"getChannelWiseCount", map, ChannelReports[].class);
	  	List<ChannelReports>  channelRepList=new ArrayList<ChannelReports>(Arrays.asList(channelCntRespArr)); 
	
	
	

	// moneyOutList = prodPlanDetailList;
	Document document = new Document(PageSize.A4);
	// ByteArrayOutputStream out = new ByteArrayOutputStream();

	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Calendar cal = Calendar.getInstance();

	System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
	String FILE_PATH = Constants.REPORT_SAVE;
	File file = new File(FILE_PATH);

	PdfWriter writer = null;

	FileOutputStream out = new FileOutputStream(FILE_PATH);
	try {
		writer = PdfWriter.getInstance(document, out);
	} catch (DocumentException e) {

		e.printStackTrace();
	}

	PdfPTable table = new PdfPTable(3);
	try {
		System.out.println("Inside PDF Table try");
		table.setWidthPercentage(100);
		table.setWidths(new float[] { 1.4f, 3.7f, 3.7f });
		Font headFont = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font headFont1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
		headFont1.setColor(BaseColor.WHITE);
		Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);

		PdfPCell hcell = new PdfPCell();
		hcell.setBackgroundColor(BaseColor.PINK);

		hcell.setPadding(3);
		hcell = new PdfPCell(new Phrase("Sr.No.", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Channel Name", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Lead Count", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		int index = 0;
		for (ChannelReports chnl : channelRepList) {
			index++;
			PdfPCell cell;

			cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(chnl.getmChannelName(), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(String.valueOf(chnl.getChnlLeadCount()), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

		}
		document.open();
		Paragraph name = new Paragraph("\n", f);
		name.setAlignment(Element.ALIGN_CENTER);
		document.add(name);
		document.add(new Paragraph(" "));
		Paragraph company = new Paragraph("Channel Wise  Lead Report\n", f);
		company.setAlignment(Element.ALIGN_CENTER);
		document.add(company);
		document.add(new Paragraph(" "));

		DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");

		document.add(new Paragraph("\n"));
		document.add(table);

		int totalPages = writer.getPageNumber();

		System.out.println("Page no " + totalPages);

		document.close();
		// Atul Sir code to open a Pdf File
		if (file != null) {

			String mimeType = URLConnection.guessContentTypeFromName(file.getName());

			if (mimeType == null) {

				mimeType = "application/pdf";

			}

			response.setContentType(mimeType);

			response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

			response.setContentLength((int) file.length());

			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

			try {
				FileCopyUtils.copy(inputStream, response.getOutputStream());
			} catch (IOException e) {
				System.out.println("Excep in Opening a Pdf File");
				e.printStackTrace();
			}
		}

	} catch (DocumentException ex) {

		System.out.println("Pdf Generation Error: BOm Prod  View Prod" + ex.getMessage());

		ex.printStackTrace();

	}

}



@RequestMapping(value = "/channelWiseInqCntPdf", method = RequestMethod.GET)
public void channelWiseInqCntPdf(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
	BufferedOutputStream outStream = null;
	System.out.println("Inside Pdf channelWiseInqCntPdf");
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();


	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		ChannelReports[] channelCntRespArr=Constants.getRestTemplate().postForObject(Constants.url+"getChannelWiseCount", map, ChannelReports[].class);
	  	List<ChannelReports>  channelRepList=new ArrayList<ChannelReports>(Arrays.asList(channelCntRespArr)); 
	
	
	

	// moneyOutList = prodPlanDetailList;
	Document document = new Document(PageSize.A4);
	// ByteArrayOutputStream out = new ByteArrayOutputStream();

	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Calendar cal = Calendar.getInstance();

	System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
	String FILE_PATH = Constants.REPORT_SAVE;
	File file = new File(FILE_PATH);

	PdfWriter writer = null;

	FileOutputStream out = new FileOutputStream(FILE_PATH);
	try {
		writer = PdfWriter.getInstance(document, out);
	} catch (DocumentException e) {

		e.printStackTrace();
	}

	PdfPTable table = new PdfPTable(3);
	try {
		System.out.println("Inside PDF Table try");
		table.setWidthPercentage(100);
		table.setWidths(new float[] { 1.4f, 3.7f, 3.7f });
		Font headFont = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font headFont1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
		headFont1.setColor(BaseColor.WHITE);
		Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);

		PdfPCell hcell = new PdfPCell();
		hcell.setBackgroundColor(BaseColor.PINK);

		hcell.setPadding(3);
		hcell = new PdfPCell(new Phrase("Sr.No.", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Channel Name", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Lead Count", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		int index = 0;
		for (ChannelReports chnl : channelRepList) {
			index++;
			PdfPCell cell;

			cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(chnl.getmChannelName(), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(String.valueOf(chnl.getChnlInqCount()), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

		}
		document.open();
		Paragraph name = new Paragraph("\n", f);
		name.setAlignment(Element.ALIGN_CENTER);
		document.add(name);
		document.add(new Paragraph(" "));
		Paragraph company = new Paragraph("Channel Wise  Inquiry Report\n", f);
		company.setAlignment(Element.ALIGN_CENTER);
		document.add(company);
		document.add(new Paragraph(" "));

		DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");

		document.add(new Paragraph("\n"));
		document.add(table);

		int totalPages = writer.getPageNumber();

		System.out.println("Page no " + totalPages);

		document.close();
		// Atul Sir code to open a Pdf File
		if (file != null) {

			String mimeType = URLConnection.guessContentTypeFromName(file.getName());

			if (mimeType == null) {

				mimeType = "application/pdf";

			}

			response.setContentType(mimeType);

			response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

			response.setContentLength((int) file.length());

			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

			try {
				FileCopyUtils.copy(inputStream, response.getOutputStream());
			} catch (IOException e) {
				System.out.println("Excep in Opening a Pdf File");
				e.printStackTrace();
			}
		}

	} catch (DocumentException ex) {

		System.out.println("Pdf Generation Error: BOm Prod  View Prod" + ex.getMessage());

		ex.printStackTrace();

	}

}









@RequestMapping(value = "/domainWiseLeadCntPdf", method = RequestMethod.GET)
public void domainWiseLeadCntPdf(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
	BufferedOutputStream outStream = null;
	System.out.println("Inside Pdf domainWiseLeadCntPdf");
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();


	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		

	DomainTypeReports[] domainReportArr=Constants.getRestTemplate().postForObject(Constants.url+"getDomainWiseCount", map, DomainTypeReports[].class);
	List<DomainTypeReports> domainReportList=new ArrayList<DomainTypeReports>(Arrays.asList(domainReportArr));
	
	
	
	

	// moneyOutList = prodPlanDetailList;
	Document document = new Document(PageSize.A4);
	// ByteArrayOutputStream out = new ByteArrayOutputStream();

	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Calendar cal = Calendar.getInstance();

	System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
	String FILE_PATH = Constants.REPORT_SAVE;
	File file = new File(FILE_PATH);

	PdfWriter writer = null;

	FileOutputStream out = new FileOutputStream(FILE_PATH);
	try {
		writer = PdfWriter.getInstance(document, out);
	} catch (DocumentException e) {

		e.printStackTrace();
	}

	PdfPTable table = new PdfPTable(3);
	try {
		System.out.println("Inside PDF Table try");
		table.setWidthPercentage(100);
		table.setWidths(new float[] { 1.4f, 3.7f, 3.7f });
		Font headFont = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font headFont1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
		headFont1.setColor(BaseColor.WHITE);
		Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);

		PdfPCell hcell = new PdfPCell();
		hcell.setBackgroundColor(BaseColor.PINK);

		hcell.setPadding(3);
		hcell = new PdfPCell(new Phrase("Sr.No.", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Domain Name", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Lead Count", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		int index = 0;
		for (DomainTypeReports chnl : domainReportList) {
			index++;
			PdfPCell cell;

			cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(chnl.getmDomainName(), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(String.valueOf(chnl.getDomainLeadCount()), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

		}
		document.open();
		Paragraph name = new Paragraph("\n", f);
		name.setAlignment(Element.ALIGN_CENTER);
		document.add(name);
		document.add(new Paragraph(" "));
		Paragraph company = new Paragraph("Domain Wise  Lead  Report\n", f);
		company.setAlignment(Element.ALIGN_CENTER);
		document.add(company);
		document.add(new Paragraph(" "));

		DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");

		document.add(new Paragraph("\n"));
		document.add(table);

		int totalPages = writer.getPageNumber();

		System.out.println("Page no " + totalPages);

		document.close();
		// Atul Sir code to open a Pdf File
		if (file != null) {

			String mimeType = URLConnection.guessContentTypeFromName(file.getName());

			if (mimeType == null) {

				mimeType = "application/pdf";

			}

			response.setContentType(mimeType);

			response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

			response.setContentLength((int) file.length());

			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

			try {
				FileCopyUtils.copy(inputStream, response.getOutputStream());
			} catch (IOException e) {
				System.out.println("Excep in Opening a Pdf File");
				e.printStackTrace();
			}
		}

	} catch (DocumentException ex) {

		System.out.println("Pdf Generation Error: BOm Prod  View Prod" + ex.getMessage());

		ex.printStackTrace();

	}

}






@RequestMapping(value = "/domainWiseInqCntPdf", method = RequestMethod.GET)
public void domainWiseInqCntPdf(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
	BufferedOutputStream outStream = null;
	System.out.println("Inside Pdf domainWiseLeadCntPdf");
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();


	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		

	DomainTypeReports[] domainReportArr=Constants.getRestTemplate().postForObject(Constants.url+"getDomainWiseCount", map, DomainTypeReports[].class);
	List<DomainTypeReports> domainReportList=new ArrayList<DomainTypeReports>(Arrays.asList(domainReportArr));
	
	
	
	

	// moneyOutList = prodPlanDetailList;
	Document document = new Document(PageSize.A4);
	// ByteArrayOutputStream out = new ByteArrayOutputStream();

	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Calendar cal = Calendar.getInstance();

	System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
	String FILE_PATH = Constants.REPORT_SAVE;
	File file = new File(FILE_PATH);

	PdfWriter writer = null;

	FileOutputStream out = new FileOutputStream(FILE_PATH);
	try {
		writer = PdfWriter.getInstance(document, out);
	} catch (DocumentException e) {

		e.printStackTrace();
	}

	PdfPTable table = new PdfPTable(3);
	try {
		System.out.println("Inside PDF Table try");
		table.setWidthPercentage(100);
		table.setWidths(new float[] { 1.4f, 3.7f, 3.7f });
		Font headFont = new Font(FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font headFont1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
		headFont1.setColor(BaseColor.WHITE);
		Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);

		PdfPCell hcell = new PdfPCell();
		hcell.setBackgroundColor(BaseColor.PINK);

		hcell.setPadding(3);
		hcell = new PdfPCell(new Phrase("Sr.No.", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Domain Name", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		hcell = new PdfPCell(new Phrase("Inquiry Count", headFont1));
		hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		hcell.setBackgroundColor(BaseColor.PINK);

		table.addCell(hcell);

		int index = 0;
		for (DomainTypeReports chnl : domainReportList) {
			index++;
			PdfPCell cell;

			cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(chnl.getmDomainName(), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(String.valueOf(chnl.getDomainInqCount()), headFont));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setPaddingRight(2);
			cell.setPadding(3);
			table.addCell(cell);

		}
		document.open();
		Paragraph name = new Paragraph("\n", f);
		name.setAlignment(Element.ALIGN_CENTER);
		document.add(name);
		document.add(new Paragraph(" "));
		Paragraph company = new Paragraph("Domain Wise  Inquiry  Report\n", f);
		company.setAlignment(Element.ALIGN_CENTER);
		document.add(company);
		document.add(new Paragraph(" "));

		DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");

		document.add(new Paragraph("\n"));
		document.add(table);

		int totalPages = writer.getPageNumber();

		System.out.println("Page no " + totalPages);

		document.close();
		// Atul Sir code to open a Pdf File
		if (file != null) {

			String mimeType = URLConnection.guessContentTypeFromName(file.getName());

			if (mimeType == null) {

				mimeType = "application/pdf";

			}

			response.setContentType(mimeType);

			response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

			response.setContentLength((int) file.length());

			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

			try {
				FileCopyUtils.copy(inputStream, response.getOutputStream());
			} catch (IOException e) {
				System.out.println("Excep in Opening a Pdf File");
				e.printStackTrace();
			}
		}

	} catch (DocumentException ex) {

		System.out.println("Pdf Generation Error: BOm Prod  View Prod" + ex.getMessage());

		ex.printStackTrace();

	}

}



@RequestMapping(value = "/AllChannelWiseDetailLeadReportExcel", method = RequestMethod.GET)
public void AllChannelWiseDetailLeadReportExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		ChannelWiseDetailReport[] channelWiseDetlArr=Constants.getRestTemplate().postForObject(Constants.url+"getAllChannelWiseDetailLeadReport", map, ChannelWiseDetailReport[].class);
	  	List<ChannelWiseDetailReport>  channelWiseDtlReportList=new ArrayList<ChannelWiseDetailReport>(Arrays.asList(channelWiseDetlArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Channel Name");
		rowData.add("Customer Name");
		rowData.add("Company Name");
		rowData.add("Contact Person Info");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < channelWiseDtlReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ channelWiseDtlReportList.get(i).getmChannelName());
			rowData.add("" + channelWiseDtlReportList.get(i).getCustomerName());
			rowData.add("" + channelWiseDtlReportList.get(i).getAccCompany());
			rowData.add("" + channelWiseDtlReportList.get(i).getCpName()+","+
					channelWiseDtlReportList.get(i).getCpMobile()+","+
					channelWiseDtlReportList.get(i).getCpEmail());
			
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "All Channel Wise Detail Lead Report";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}





@RequestMapping(value = "/AllDomainWiseDetailLeadReportExcel", method = RequestMethod.GET)
public void AllDomainWiseDetailLeadReportExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		DomainWiseDetailReports[] domainlWiseDetlArr=Constants.getRestTemplate().postForObject(Constants.url+"getAllDomainlWiseDetailLeadReport", map, DomainWiseDetailReports[].class);
	  	List<DomainWiseDetailReports>  domainWiseDtlReportList=new ArrayList<DomainWiseDetailReports>(Arrays.asList(domainlWiseDetlArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Domain Name");
		rowData.add("Customer Name");
		rowData.add("Company Name");
		rowData.add("Contact Person Info");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < domainWiseDtlReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ domainWiseDtlReportList.get(i).getmDomainName());
			rowData.add("" + domainWiseDtlReportList.get(i).getCustomerName());
			rowData.add("" + domainWiseDtlReportList.get(i).getAccCompany());
			rowData.add("" + domainWiseDtlReportList.get(i).getCpName()+","+
					domainWiseDtlReportList.get(i).getCpMobile()+","+
					domainWiseDtlReportList.get(i).getCpEmail());
			
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "All Domain Wise Detail  Lead Report";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}





@RequestMapping(value = "/AllCityWiseDetailLeadReportExcel", method = RequestMethod.GET)
public void AllCityWiseDetailLeadReportExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		CityWiseDetailReport[] citylWiseDetlArr=Constants.getRestTemplate().postForObject(Constants.url+"getAllCityWiseDetailLeadReport", map, CityWiseDetailReport[].class);
	  	List<CityWiseDetailReport>  cityWiseDtlReportList=new ArrayList<CityWiseDetailReport>(Arrays.asList(citylWiseDetlArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("City Name");
		rowData.add("Customer Name");
		rowData.add("Company Name");
		rowData.add("Contact Person Info");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < cityWiseDtlReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ cityWiseDtlReportList.get(i).getmCityName());
			rowData.add("" + cityWiseDtlReportList.get(i).getCustomerName());
			rowData.add("" + cityWiseDtlReportList.get(i).getAccCompany());
			rowData.add("" + cityWiseDtlReportList.get(i).getCpName()+","+
					cityWiseDtlReportList.get(i).getCpMobile()+","+
					cityWiseDtlReportList.get(i).getCpEmail());
			
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "All City Wise Detail Lead Report";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}




@RequestMapping(value = "/AllChannelWiseDetailINQReportExcel", method = RequestMethod.GET)
public void AllChannelWiseDetailINQReportExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		ChannelWiseDetailReport[] channelWiseDetlArr=Constants.getRestTemplate().postForObject(Constants.url+"getAllChannelWiseDetailINQReport", map, ChannelWiseDetailReport[].class);
	  	List<ChannelWiseDetailReport>  channelWiseDtlReportList=new ArrayList<ChannelWiseDetailReport>(Arrays.asList(channelWiseDetlArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Channel Name");
		rowData.add("Customer Name");
		rowData.add("Company Name");
		rowData.add("Contact Person Info");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < channelWiseDtlReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ channelWiseDtlReportList.get(i).getmChannelName());
			rowData.add("" + channelWiseDtlReportList.get(i).getCustomerName());
			rowData.add("" + channelWiseDtlReportList.get(i).getAccCompany());
			rowData.add("" + channelWiseDtlReportList.get(i).getCpName()+","+
					channelWiseDtlReportList.get(i).getCpMobile()+","+
					channelWiseDtlReportList.get(i).getCpEmail());
			
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "All Channel Wise Detail Inquiry Report";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}










@RequestMapping(value = "/AllDomainWiseDetailINQReportExcel", method = RequestMethod.GET)
public void AllDomainWiseDetailINQReportExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		DomainWiseDetailReports[] domainlWiseDetlArr=Constants.getRestTemplate().postForObject(Constants.url+"getAllDomainlWiseDetailINQReport", map, DomainWiseDetailReports[].class);
	  	List<DomainWiseDetailReports>  domainWiseDtlReportList=new ArrayList<DomainWiseDetailReports>(Arrays.asList(domainlWiseDetlArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Domain Name");
		rowData.add("Customer Name");
		rowData.add("Company Name");
		rowData.add("Contact Person Info");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < domainWiseDtlReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ domainWiseDtlReportList.get(i).getmDomainName());
			rowData.add("" + domainWiseDtlReportList.get(i).getCustomerName());
			rowData.add("" + domainWiseDtlReportList.get(i).getAccCompany());
			rowData.add("" + domainWiseDtlReportList.get(i).getCpName()+","+
					domainWiseDtlReportList.get(i).getCpMobile()+","+
					domainWiseDtlReportList.get(i).getCpEmail());
			
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "All Domain Wise Detail Inquiry Report";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}






@RequestMapping(value = "/AllCityWiseDetailINQReportExcel", method = RequestMethod.GET)
public void AllCityWiseDetailINQReportExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		CityWiseDetailReport[] citylWiseDetlArr=Constants.getRestTemplate().postForObject(Constants.url+"getAllCityWiseDetailInqReport", map, CityWiseDetailReport[].class);
	  	List<CityWiseDetailReport>  cityWiseDtlReportList=new ArrayList<CityWiseDetailReport>(Arrays.asList(citylWiseDetlArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("City Name");
		rowData.add("Customer Name");
		rowData.add("Company Name");
		rowData.add("Contact Person Info");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < cityWiseDtlReportList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ cityWiseDtlReportList.get(i).getmCityName());
			rowData.add("" + cityWiseDtlReportList.get(i).getCustomerName());
			rowData.add("" + cityWiseDtlReportList.get(i).getAccCompany());
			rowData.add("" + cityWiseDtlReportList.get(i).getCpName()+","+
					cityWiseDtlReportList.get(i).getCpMobile()+","+
					cityWiseDtlReportList.get(i).getCpEmail());
			
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "All City Wise Detail Inquiry Report";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


@RequestMapping(value = "/LeadConversionTimeReportExcel", method = RequestMethod.GET)
public void LeadConversionTimeReportExcel(HttpServletRequest request, HttpServletResponse response) {
	MultiValueMap<String,Object> map=new LinkedMultiValueMap<String, Object>();
	
	
	String dateRange=request.getParameter("leaveDateRange");
	
	String dates[]=dateRange.split("to");
	String fromDate=DateConvertor.convertToYMD(dates[0]);
	String toDate=DateConvertor.convertToYMD(dates[1]);
	System.err.println("date Range========"+dates[0]);
	System.err.println("date Range========"+dates[1]);
	map.add("fromDate", fromDate);
	map.add("toDate",toDate);
		
		LeadConTymReport[] LeadConTymReprtArr=Constants.getRestTemplate().postForObject(Constants.url+"getLeadConTymReportList", map, LeadConTymReport[].class);
	  	List<LeadConTymReport> LeadConTymReprtArrList=new ArrayList<LeadConTymReport>(Arrays.asList(LeadConTymReprtArr)); 
		

		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr. No");
		rowData.add("Lead Name");
		rowData.add("Domain Name");
		rowData.add("Channel Name");
		rowData.add("Ref. Name");
		rowData.add("Schedule Date");
		rowData.add("Current Status");
		rowData.add("Total Days");
		//rowData.add("Group Id");
		//rowData.add("Group Name");
		//rowData.add("Assesse Name");
		//rowData.add("PAN No");
		//rowData.add("Email Id");
		//rowData.add("Phone No");
		//rowData.add("Address 1");
		//rowData.add("Address 2");
		//rowData.add("City");
		//rowData.add("Pincode");
		
		//rowData.add("Business Nature");
		//rowData.add("Folder Id");
		//rowData.add("File No");
		
		//rowData.add("DOB");
		//rowData.add("Aadhar No");
		//rowData.add("Is Active ?");
		
		
		expoExcel.setRowData(rowData);
		exportToExcelList.add(expoExcel);

		for (int i = 0; i < LeadConTymReprtArrList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();

			rowData.add("" + (i + 1));

			rowData.add(""+ LeadConTymReprtArrList.get(i).getCustomerName()+LeadConTymReprtArrList.get(i).getAccCompany());
			rowData.add(""+ LeadConTymReprtArrList.get(i).getmDomainName());
			rowData.add(""+ LeadConTymReprtArrList.get(i).getmChannelName());
			rowData.add(""+ "-");
			rowData.add(""+ LeadConTymReprtArrList.get(i).getTaskScheDate());
			rowData.add(""+ LeadConTymReprtArrList.get(i).getStatusName());
			rowData.add(""+ LeadConTymReprtArrList.get(i).getDays());
			
			
			
			/*
			 * rowData.add("" + custList.get(i).getOwnerEmpId()); rowData.add("" +
			 * custList.get(i).getExVar2());//owner name
			 * 
			 * rowData.add("" + custList.get(i).getCustGroupId()); rowData.add("" +
			 * custList.get(i).getExVar1());//group name rowData.add("" +
			 * custList.get(i).getCustAssesseeName()); rowData.add("" +
			 * custList.get(i).getCustPanNo()); rowData.add("" +
			 * custList.get(i).getCustEmailId());
			 * 
			 * rowData.add("" + custList.get(i).getCustPhoneNo());
			 * 
			 * //rowData.add("" + custList.get(i).getCustAddr1()); //rowData.add("" +
			 * custList.get(i).getCustAddr2());
			 * 
			 * rowData.add("" + custList.get(i).getCustCity()); rowData.add("" +
			 * custList.get(i).getCustPinCode()); rowData.add("" +
			 * custList.get(i).getCustBusinNatute());
			 * 
			 * //rowData.add("" + custList.get(i).getCustFolderId()); //rowData.add("" +
			 * custList.get(i).getCustFileNo());
			 * 
			 * rowData.add("" + custList.get(i).getCustDob()); rowData.add("" +
			 * custList.get(i).getCustAadhar()); rowData.add("" +
			 * custList.get(i).getIsActive());
			 */


			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
		}
		XSSFWorkbook wb = null;
		try {

			// System.out.println("Excel List :" + exportToExcelList.toString());
			String rep = "Lead Conversion Time Report";
			System.err.println("rep  " + rep);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

			// String excelName = (String) session.getAttribute("excelName");
			wb = ExceUtil.createWorkbook(exportToExcelList, rep, " ",
					"Export Time " + date + " ", "  ", 'Q');
			ExceUtil.autoSizeColumns(wb, 3);
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition",
					"attachment; filename=" + rep + "-" + date + ".xlsx");
			wb.write(response.getOutputStream());

		} catch (IOException ioe) {
			throw new RuntimeException("Error writing spreadsheet to output stream");
		} finally {
			if (wb != null) {
				try {
					wb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}





}



