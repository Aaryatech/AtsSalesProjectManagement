package com.ats.hreasy.common;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.LmsHeaderWithNames;

/*<dependency>
<groupId>javax.mail</groupId>
<artifactId>mail</artifactId>
<version>1.4</version>
</dependency>*/

public class EmailUtility {

	public static String getOTP(int n) {

		// chose a Character random from this String
		String AlphaNumericString = "0123456789";

		// create StringBuffer size of AlphaNumericString
		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {

			// generate a random number between
			// 0 to AlphaNumericString variable length
			int index = (int) (AlphaNumericString.length() * Math.random());

			// add Character one by one in end of sb
			sb.append(AlphaNumericString.charAt(index));
		}

		return sb.toString();
	}

	public static Info sendEmailWithSubMsgAndToAdd(String mailSubjet, String msgContent, String toAddress) {

		Info info = new Info();

		try {

			final String emailSMTPserver = "smtp.gmail.com";
			final String emailSMTPPort = "587";
			final String mailStoreType = "imaps";
			String username = "atsinfosoft@gmail.com";
			String password = "atsinfosoft#123";
			// atsinfosoft@123
			System.out.println("username" + username);
			System.out.println("password" + password);

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try {
				Store mailStore = session.getStore(mailStoreType);
				mailStore.connect(emailSMTPserver, username, password);

				Message mimeMessage = new MimeMessage(session);
				mimeMessage.setFrom(new InternetAddress(username));
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
				mimeMessage.setSubject(mailSubjet);
				mimeMessage.setText(msgContent);

				Transport.send(mimeMessage);
			} catch (Exception e) {
				e.printStackTrace();
				info.setError(true);
				info.setMsg("email_exce");
			}

			info.setError(false);
			info.setMsg("success_email");
		} catch (Exception e) {

			e.printStackTrace();
			info.setError(true);
			info.setMsg("email_exce");
		}

		return info;

	}

	public static String convertMinToHours(String minutes1) {
		String min = new String();
		int minutes = Integer.parseInt(minutes1);

		try {
			String hrs = String.valueOf(minutes / 60);
			String rem = String.valueOf(minutes % 60);
			System.out.println("prev hrs **" + hrs);
			System.out.println("prev rem  **" + rem);
			if (String.valueOf(hrs).length() == 1) {
				hrs = "0".concat(hrs);
				System.out.println("hrs after **" + hrs);

			}
			if (String.valueOf(rem).length() == 1) {
				rem = "0".concat(rem);
				System.out.println("rem after **" + rem);
			}
			min = hrs.concat(":").concat(rem);

			/// System.out.println("final hrs**" + min);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return min;

	}

	public static Info mailer(String mailSubjet, String msgContent, List<LmsHeaderWithNames> list) {

		Info info = new Info();

		try {

			final String emailSMTPserver = "smtp.gmail.com";
			final String emailSMTPPort = "587";
			final String mailStoreType = "imaps";
			final String username = "businessdevelopment@aaryatechindia.in";
			final String password = "pass@123";
			/*
			 * final String username = "atsinfosoft@gmail.com"; final String password =
			 * "atsinfosoft#123";
			 */
			// atsinfosoft@123
			System.out.println("username" + username);
			System.out.println("password" + password);

			List<String> mail = new ArrayList<>();

			mail.add("akshaykasar72@gmail.com");
			/*mail.add("galdhar.balaji12@gmail.com");
			mail.add("ngaldhar@gmail.com");
			mail.add("neilsatyam@gmail.com");
			mail.add("shabbir.paliwala@gmail.com");
			mail.add("sfatehnagri@gmail.com");
			mail.add("it@monginispune.com");
			mail.add("trupti_patole@yahoo.com");
			mail.add("ab_nvd@rediffmail.com");
			mail.add("gajananstone95_nsk@rediffmail.com");
			mail.add("pdmulani@yahoo.co.in");
			mail.add("chaudharyjigar1232@gmail.com");
			mail.add("jjkunija@gmail.com");
			mail.add("chaudharyjigar1232@gmail.com");
			mail.add("madhvi2004@gmail.com");
			mail.add("madhvibcp@gmail.com");
			mail.add("harshal.pahade@kppmca.in");
			mail.add("namrata.patil@kppmca.in");
			mail.add("ahmedabad@monginis.net");
			mail.add("siddharthfoodsaccounts@yahoo.com");
			mail.add("skthareja@gmail.com");
			mail.add("gajananstone95_nsk@rediffmail.com");
			mail.add("shivshambhubuildcon.nashik@gmail.com");
			mail.add("jaganugale27@gmail.com");
			mail.add("umangchaudhary2608@gmail.com");
			mail.add("nikhilchaudhary12155@gmail.com");*/
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try {
				Store mailStore = session.getStore(mailStoreType);
				mailStore.connect(emailSMTPserver, username, password);

				Message mimeMessage = new MimeMessage(session);
				mimeMessage.setFrom(new InternetAddress(username, "Aarya Tech Solutions"));

				mimeMessage.setSubject(mailSubjet);
				mimeMessage.setContent(msgContent, "text/html; charset=utf-8");
				/*
				 * BodyPart mbodypart = new MimeBodyPart(); Multipart multipart = new
				 * MimeMultipart(); DataSource source = new FileDataSource(Constants.file1);
				 * mbodypart.setDataHandler(new DataHandler(source)); mbodypart.setFileName(new
				 * File(Constants.file1).getName()); multipart.addBodyPart(mbodypart);
				 * mimeMessage.setContent(multipart);
				 * 
				 * BodyPart mbodypart1 = new MimeBodyPart(); Multipart multipart1 = new
				 * MimeMultipart(); DataSource source1 = new FileDataSource(Constants.file2);
				 * mbodypart1.setDataHandler(new DataHandler(source1));
				 * mbodypart1.setFileName(new File(Constants.file2).getName());
				 * multipart.addBodyPart(mbodypart1);
				 * 
				 * MimeBodyPart messageBodyPart = new MimeBodyPart(); messageBodyPart = new
				 * MimeBodyPart();
				 * 
				 * messageBodyPart.setContent(msgContent, "text/html; charset=utf-8");
				 * multipart.addBodyPart(messageBodyPart); mimeMessage.setContent(multipart);
				 */

				for (int i = 0; i < mail.size(); i++) {
					mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail.get(i).trim()));
					Transport.send(mimeMessage);
				}

				/*
				 * for (int i = 0; i < list.size(); i++) { try {
				 * mimeMessage.setRecipients(Message.RecipientType.TO,
				 * InternetAddress.parse(list.get(i).getMail().trim()));
				 * Transport.send(mimeMessage); } catch (Exception e) {
				 * 
				 * }
				 * 
				 * }
				 */

			} catch (Exception e) {
				e.printStackTrace();
				info.setError(true);
				info.setMsg("email_exce");
			}

			info.setError(false);
			info.setMsg("success_email");
		} catch (Exception e) {

			e.printStackTrace();
			info.setError(true);
			info.setMsg("email_exce");
		}

		return info;

	}

}
