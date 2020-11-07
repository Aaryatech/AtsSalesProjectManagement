package com.ats.hreasy.common;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class Constants {

	// local

	public static final String opsWebApiUrl = "http://107.180.95.11:8080/webapi/";
	//public static final String url = "http://192.169.205.160:8080/salesApi/";
	public static final String url = "http://localhost:8094/";
	/*public static String REPORT_SAVE = "/home/lenovo/Documents/pdf/Report.pdf";
	public static final String ReportURL = "http://localhost:8081/hreasy/";
	public static final String attsDocSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";
	public static final String docSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";

	public static final String companyLogoSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";
	public static final String empDocSaveUrl = "/home/maddy/ats-11/";
	static final String leaveDocSaveUrl1 = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";
	public static final String leaveDocSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";
	public static final String imageSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";

	public static final String companyLogoShowUrl = "http://localhost:8080/media/";
	public static final String empDocShowUrl = "http://localhost:8080/home/maddy/ats-11/";
	public static final String leaveDocShowUrl = "http://localhost:8080/media/";
	public static final String imageShowUrl = "http://localhost:8080/media/";
	public static final String templateShowUrl = "http://localhost:8080/hrdocument/templatedoc/";
	public static String EPF_SAVE = "/home/lenovo/Documents/pdf/EPFFILE.txt";*/

	public static RestTemplate rest = new RestTemplate();
	public static String[] allextension = { "txt", "doc", "pdf", "xls", "jpg", "jpeg", "gif", "png" };
	public static String[] values = { "jpg", "jpeg", "gif", "png" };
	public static String empLoanAgrDocViewUrl;
	public static String empLoanAgrDocSaveUrl;
	public static String JWTToken;

	public static RestTemplate getRestTemplate() {
		rest = new RestTemplate();
		rest.getInterceptors().add(new BasicAuthorizationInterceptor("aaryatech", "Aaryatech@1cr"));

		/*
		 * rest.getInterceptors().add((request, body, execution) -> {
		 * request.getHeaders().add("Authorization", "Bearer " + JWTToken); return
		 * execution.execute(request, body); });
		 */

		return rest;

	}
}