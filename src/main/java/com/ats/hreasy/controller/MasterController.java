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

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.common.FormValidation;
import com.ats.hreasy.model.Hardware;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.UserLoginData;

@Controller
@Scope("session")
public class MasterController {
	@RequestMapping(value = "/showHardwareList", method = RequestMethod.GET)
	public String customerProfile(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "master/hardwareList";

		try {
			Hardware[] arr = Constants.getRestTemplate().getForObject(Constants.url + "getAllHardwares",
					Hardware[].class);
			List<Hardware> hardwareList = new ArrayList<Hardware>(Arrays.asList(arr));

			for (int i = 0; i < hardwareList.size(); i++) {
				hardwareList.get(i)
						.setExVar1(FormValidation.Encrypt(String.valueOf(hardwareList.get(i).getHardwareId())));
			}

			model.addAttribute("hardwareList", hardwareList);

			model.addAttribute("title", "Hardware List");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/addHardware", method = RequestMethod.GET)
	public String addHardware(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "master/newHardware";

		try {
			Hardware hardware = new Hardware();
			model.addAttribute("hardware", hardware);
			model.addAttribute("title", "Add New Hardware");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/submitNewHardware", method = RequestMethod.POST)
	public String submitNewHardware(HttpServletRequest request, HttpServletResponse response) {

		try {
			Hardware hardware = new Hardware();
			HttpSession session = request.getSession();
			UserLoginData userDetail = (UserLoginData) session.getAttribute("userObj");

			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();

			int hardwareId = Integer.parseInt(request.getParameter("hardwareId"));

			hardware.setCompany(request.getParameter("companyName"));
			hardware.setDateOfPurchase(request.getParameter("dop"));
			hardware.setDelStatus(1);
			hardware.setExInt1(0);
			hardware.setExInt2(0);
			hardware.setExVar1("NA");
			hardware.setExVar2("NA");
			hardware.setHardwareCode(request.getParameter("hardwareCode"));
			hardware.setHardwareId(hardwareId);
			hardware.setHardwareName(request.getParameter("hardwareName"));
			hardware.setMakerDateTime(sf.format(date));
			hardware.setMakerUserId(userDetail.getEmpId());
			hardware.setPassword(request.getParameter("password"));
			hardware.setPrice(Float.parseFloat(request.getParameter("price")));
			hardware.setUserName(request.getParameter("username"));

			Hardware res = Constants.getRestTemplate().postForObject(Constants.url + "saveEditHardware", hardware,
					Hardware.class);

			if (res.getHardwareId() > 0) {
				if (hardwareId == 0)
					session.setAttribute("successMsg", "Hardware Saved Sucessfully");
				else
					session.setAttribute("successMsg", "Hardware  Update Sucessfully");
			} else {
				session.setAttribute("errorMsg", "Failed to Save Hardware");
			}

		} catch (Exception e) {
			System.out.println("Execption in /insertUom : " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showHardwareList";

	}

	@RequestMapping(value = "/editHardware", method = RequestMethod.GET)
	public String editHardware(HttpServletRequest request, HttpServletResponse response, Model model) {
		String mav = new String();
		try {
			mav = "master/newHardware";

			String base64encodedString = request.getParameter("hardwareId");
			String hardwareId = FormValidation.DecodeKey(base64encodedString);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("hardwareId", Integer.parseInt(hardwareId));

			Hardware hardware = Constants.getRestTemplate().postForObject(Constants.url + "getHardwareById", map,
					Hardware.class);
			model.addAttribute("hardware", hardware);
			model.addAttribute("title", "Edit Hardware");

		} catch (Exception e) {
			System.out.println("Execption in /editHardware : " + e.getMessage());
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/deleteHardware", method = RequestMethod.GET)
	public String deleteUom(HttpServletRequest request, HttpServletResponse response) {

		String mav = new String();
		try {
			mav = "redirect:/showHardwareList";
			
			HttpSession session = request.getSession();

			String base64encodedString = request.getParameter("hardwareId");
			String hardwareId = FormValidation.DecodeKey(base64encodedString);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("hardwareId", Integer.parseInt(hardwareId));

			Info info = Constants.getRestTemplate().postForObject(Constants.url + "deleteHardwareById", map,
					Info.class);

			if (!info.isError()) {
				session.setAttribute("successMsg", info.getMsg());
			} else {
				session.setAttribute("errorMsg", info.getMsg());
			}

		} catch (Exception e) {
			System.out.println("Execption in /deleteHardware : " + e.getMessage());
			e.printStackTrace();
		}
		return mav;
	}

}
