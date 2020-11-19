package com.ats.hreasy.common;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class Constants {

	// local

	public static final String url = "http://localhost:8094/";
	public static String REPORT_SAVE = "/home/lenovo/Documents/pdf/Report.pdf";
	public static final String ReportURL = "http://localhost:8081/hreasy/";
	public static final String docSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";
	public static String file1 = "/home/lenovo/Documents/pdf/ATS Company Brochure.pdf";
	public static String file2 = "/home/lenovo/Documents/pdf/BizIntel ERP Brochure.pdf";

	/*public static final String url = "http://107.180.88.121:8080/salesApi/";
	public static String REPORT_SAVE = "/opt/apache-tomcat-8.5.47/webapps/hrdocument/Report.pdf";
	public static final String ReportURL = "http://107.180.88.121:8080/HrEasy/";
	public static final String docSaveUrl = "/opt/apache-tomcat-8.5.47/webapps/hrdocument/updatedoc/";
	public static String file1 = "/opt/apache-tomcat-8.5.47/webapps/ATS Company Brochure.pdf";
	public static String file2 = "/opt/apache-tomcat-8.5.47/webapps/BizIntel ERP Brochure.pdf";*/

	public static RestTemplate rest = new RestTemplate();

	public static final String softPath = "http://107.180.88.121:8080/SalesManagement/resources/assets/emailer/";

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