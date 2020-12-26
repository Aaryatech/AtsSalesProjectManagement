package com.ats.hreasy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hreasy.common.Constants;
import com.ats.hreasy.model.CustomerMst;
import com.ats.hreasy.model.Info;
import com.ats.hreasy.model.ServerMaster;


//Akhilesh	2020-12-26
@Controller
@Scope("session")
public class ServerMasterController {
	
	
	@RequestMapping(value="/getServerMasterList",method=RequestMethod.GET)
	public ModelAndView getServerMasterList() {
		ModelAndView model=new ModelAndView("serverMstList");
		List<ServerMaster> serverMstList=new ArrayList<>();
		List<CustomerMst> custMstList=new ArrayList<>();
		try {
			
			
			CustomerMst[] custArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllCustomerList", CustomerMst[].class);
			custMstList=new ArrayList<>(Arrays.asList(custArr));
			System.err.println("list-->"+custMstList);
			model.addObject("custList",custMstList);
			
		ServerMaster[] serverArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllServerList", ServerMaster[].class);
		serverMstList=new ArrayList<>(Arrays.asList(serverArr));
		System.err.println("list-->"+serverMstList);
		model.addObject("serverList",serverMstList);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /getServerMasterList ");
			e.printStackTrace();
		}
			
		return model;
	}
	
	
	
	
	@RequestMapping(value="/addServerMaster",method=RequestMethod.GET)
	public ModelAndView addCustomerMaster(HttpServletRequest request,HttpServletResponse response) {
		ServerMaster server=new ServerMaster();
		server.setServerId(0);
		int flag=0;
		List<CustomerMst> custMstList=new ArrayList<>();
		ModelAndView model=new ModelAndView("addServerMst");
		try {
			CustomerMst[] custArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllCustomerList", CustomerMst[].class);
			custMstList=new ArrayList<>(Arrays.asList(custArr));
			System.err.println("list-->"+custMstList);
			model.addObject("custList",custMstList);
			
			server.setServerId(0);
			
			model.addObject("server", server);
			model.addObject("flag", flag);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /addServerMaster");
			e.printStackTrace();
		}
		
		//System.err.println(cust);
		
		
		return model;
	}
	
	
	
	
	
	@RequestMapping(value="/editServerMst",method=RequestMethod.GET)
	public ModelAndView editCustMst(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model=new ModelAndView("addServerMst");
		int flag=1;
		Info info=new Info();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		HttpSession session=request.getSession();
		model.addObject("flag", flag);
		List<CustomerMst> custMstList=new ArrayList<>();
		try {
			
			
			
			CustomerMst[] custArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllCustomerList", CustomerMst[].class);
			custMstList=new ArrayList<>(Arrays.asList(custArr));
			System.err.println("list-->"+custMstList);
			model.addObject("custList",custMstList);
			
			int serverId=Integer.parseInt(request.getParameter("serverId"));
			map.add("sId", serverId);
			ServerMaster server=Constants.getRestTemplate().postForObject(Constants.url+"getServerById", map, ServerMaster.class);
			model.addObject("server", server);
			
			System.err.println(server);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /editCustMst   ");
			e.printStackTrace();
		}
		
		return model;
		
	}
	
	
	
	@RequestMapping(value="/submitServermstForm",method=RequestMethod.POST)
	public ModelAndView submitServermstForm(HttpServletRequest request,HttpServletResponse response) {
		ServerMaster server=new ServerMaster();
		HttpSession session=request.getSession();
		ModelAndView model=new ModelAndView("redirect:/getServerMasterList");
		SimpleDateFormat dt=new SimpleDateFormat("yyyy-MM-dd");
	
		try {
			int serverId= Integer.parseInt(request.getParameter("serverId"));
			int custId= Integer.parseInt(request.getParameter("custId"));
			String servProvider=request.getParameter("servProvider");
			String servProviderUname=request.getParameter("servProviderUname");
			String  custSupMob= request.getParameter("cSupNo");
			int pinNo=Integer.parseInt(request.getParameter("pinNo"));
			String mobNo=request.getParameter("mobNo");
			String serverIp=request.getParameter("serverIp");
			String serverName=request.getParameter("serverName");
			String expDt=request.getParameter("date");
			System.err.println(expDt);
		
			
			String serverUName=request.getParameter("serverUName"); 
			String serverPass=request.getParameter("serverPass");
			String cPanelIp=request.getParameter("cPanelIp");
			String cPaneluName=request.getParameter("cPaneluName");
			String cPanelPass=request.getParameter("cPanelPass");
			String remarks=request.getParameter("remarks");
		
			
			if(serverId!=0) {
				//System.err.println("Old Server");
				server.setServerId(serverId);
			}
			
			server.setCustId(custId);
			server.setServiceProviderName(servProvider);
			server.setServiceProviderUsername(servProviderUname);
			server.setCustSupportNumber(custSupMob);
			server.setPinNumber(pinNo);
			server.setMobNoForVerification(mobNo);
			server.setServerIp(serverIp);
			server.setServerName(serverName);
			server.setServerExpDate(expDt);
			server.setServerUsername(serverUName);
			server.setServerPassword(serverPass);
			server.setCpanelIpWithPortNo(cPanelIp);
			server.setCpanelUsername(cPaneluName);
			server.setCpanelPassword(cPanelPass);
			server.setRemarks(remarks);
			server.setIsActive(1);
			server.setDelStatus(1);
			
			System.err.println("Server Obj--->"+server);
			
			
			ServerMaster sResp=Constants.getRestTemplate().postForObject(Constants.url+"addServer", server, ServerMaster.class);
			
			if(sResp.getServerId()==0) {
				session.setAttribute("errorMsg", "Unable To Save Server");
			}else {
				session.setAttribute("successMsg", "Server Saved Successfully!!!");
			}
			
			if(sResp.getServerId()==0 && serverId==0) {
				session.setAttribute("errorMsg", "Unable To Update Server");
			}else {
				session.setAttribute("successMsg", "Server Updated Successfully!!!");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /submitServermstForm");
			e.printStackTrace();
		}
		
		return model;
		
		
	}
	
	
	
	
	
	@RequestMapping(value="/deleteServerMst",method=RequestMethod.GET)
	public ModelAndView deleteServerMst(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model=new ModelAndView("redirect:/getServerMasterList");
		Info info=new Info();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		HttpSession session=request.getSession();
		
		try {
			int servId=Integer.parseInt(request.getParameter("serverId"));
			map.add("sId", servId);
			info=Constants.getRestTemplate().postForObject(Constants.url+"deleteServer", map, Info.class);
			if(info.isError()) {
				session.setAttribute("errorMsg", "Unable To Delete Server");	
				
			}else {
				session.setAttribute("successMsg", "Server Deleted Successfully!!!");
			}
				
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Unable To Delete  Server  Exception Occuered");	
			System.err.println("Exception Occuered In /deleteCustMst");
			e.printStackTrace();
		}
		
		
		return model;
	}
	
	
	
	
	
	

}
