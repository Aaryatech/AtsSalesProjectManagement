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
import com.ats.hreasy.model.ProjectsMaster;
import com.ats.hreasy.model.ServerMaster;

//Akhilesh	2020-12-26
@Controller
@Scope("session")
public class ProjectsMasterController {
	
	

	
	
	@RequestMapping(value="/getProjectMasterList",method=RequestMethod.GET)
	public ModelAndView getProjectMasterList() {
		ModelAndView model=new ModelAndView("projectMstList");
		
		List<ProjectsMaster> projectsMstList=new ArrayList<>();
		try {
			
			
		
		
		
		ProjectsMaster[] projArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllProjectsList", ProjectsMaster[].class);
		projectsMstList=new ArrayList<>(Arrays.asList(projArr));
		System.err.println("Projectslist-->"+projectsMstList);
		model.addObject("projectList",projectsMstList);
		
		
		
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /getProjectMasterList ");
			e.printStackTrace();
		}
			
		return model;
	}
	
	
	
	
	
	
	@RequestMapping(value="/addProjectMaster",method=RequestMethod.GET)
	public ModelAndView addProjectMaster(HttpServletRequest request,HttpServletResponse response) {
		ProjectsMaster project=new ProjectsMaster();
		project.setProjectId(0);
		int flag=0;
		List<CustomerMst> custMstList=new ArrayList<>();
		List<ServerMaster> serverMstList=new ArrayList<>();
		ModelAndView model=new ModelAndView("addProjectMst");
		try {
			CustomerMst[] custArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllCustomerList", CustomerMst[].class);
			custMstList=new ArrayList<>(Arrays.asList(custArr));
			System.err.println("Custlist-->"+custMstList);
			model.addObject("custList",custMstList);
			
			ServerMaster[] serverArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllServerList", ServerMaster[].class);
			serverMstList=new ArrayList<>(Arrays.asList(serverArr));
			System.err.println("Serverlist-->"+serverMstList);
			model.addObject("serverList",serverMstList);
			
			model.addObject("project", project);
			model.addObject("flag", flag);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /addProjectMaster");
			e.printStackTrace();
		}
		
		//System.err.println(cust);
		
		
		return model;
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/editProjectMst",method=RequestMethod.GET)
	public ModelAndView editProjectMst(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model=new ModelAndView("addProjectMst");
		int flag=1;
		Info info=new Info();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		HttpSession session=request.getSession();
		model.addObject("flag", flag);
		List<CustomerMst> custMstList=new ArrayList<>();
		List<ServerMaster> serverMstList=new ArrayList<>(); 
		try {
			
			
			
			CustomerMst[] custArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllCustomerList", CustomerMst[].class);
			custMstList=new ArrayList<>(Arrays.asList(custArr));
			System.err.println("cust list-->"+custMstList);
			model.addObject("custList",custMstList);
			
			ServerMaster[] serverArr=Constants.getRestTemplate().getForObject(Constants.url+"getAllServerList", ServerMaster[].class);
			serverMstList=new ArrayList<>(Arrays.asList(serverArr));
			System.err.println("Serverlist-->"+serverMstList);
			model.addObject("serverList",serverMstList);
			
			
			
			int projectId=Integer.parseInt(request.getParameter("projectId"));
			map.add("pId", projectId);
			ProjectsMaster project=Constants.getRestTemplate().postForObject(Constants.url+"getProjectById", map, ProjectsMaster.class);
			System.err.println("project Obj"+project);
			model.addObject("project", project);
			
				
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /editProjectMst   ");
			e.printStackTrace();
		}
		
		return model;
		
	}
	
	
	
	
	@RequestMapping(value="/submitProjectmstForm",method=RequestMethod.POST)
	public ModelAndView submitProjectmstForm(HttpServletRequest request,HttpServletResponse response) {
		ProjectsMaster project=new ProjectsMaster();
		HttpSession session=request.getSession();
		ModelAndView model=new ModelAndView("redirect:/getProjectMasterList");
		SimpleDateFormat dt=new SimpleDateFormat("yyyy-MM-dd");
	
		try {
			int projectId= Integer.parseInt(request.getParameter("projectId"));
			int custId= Integer.parseInt(request.getParameter("custId"));
			int servId= Integer.parseInt(request.getParameter("servId"));
			String projName=request.getParameter("pName");
			String projDesc=request.getParameter("pDesc");
			String  projectLink= request.getParameter("pLink");
			String projType=request.getParameter("pType");
			String gitLink=request.getParameter("gLink");
			String adminUname=request.getParameter("adminUname");
			String adminPass=request.getParameter("adminPass");  
			String dbIp=request.getParameter("dbIp");  
			String dbUname=request.getParameter("dbUname");  
			String dbPass=request.getParameter("dbPass"); 
			String dbName=request.getParameter("dbName");
			String pStatus=request.getParameter("pStatus");
		
		
			
			if(projectId!=0) {
				//System.err.println("Old Server");
				project.setProjectId(projectId);
			}
			
			project.setCustId(custId);
			project.setServer(servId);
			project.setProjectName(projName);
			project.setProjectDesc(projDesc);
			project.setProjectLink(projectLink);
			project.setProjectType(projType);
			project.setGitLink(gitLink);
			project.setAdminUsername(adminUname);
			project.setAdminPass(adminPass);
			project.setDatabaseIp(dbIp);
			project.setDbUsername(dbUname);
			project.setDbPassword(dbPass);
			project.setDbName(dbName);
			project.setStatus(pStatus);
			project.setIsActive(1);
			project.setDelStatus(1);
			
		
			
			System.err.println("Server Obj--->"+project);
			
			
			ProjectsMaster projResp=Constants.getRestTemplate().postForObject(Constants.url+"addProject", project, ProjectsMaster.class);
			
			if(projResp.getProjectId()==0) {
				session.setAttribute("errorMsg", "Unable To Save Project");
			}else {
				session.setAttribute("successMsg", "Project Saved Successfully!!!");
			}
			
			if(projResp.getProjectId()==0 && projectId==0) {
				session.setAttribute("errorMsg", "Unable To Update Project");
			}else {
				session.setAttribute("successMsg", "Project Updated Successfully!!!");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Exception Occuered In /submitProjectmstForm");
			e.printStackTrace();
		}
		
		return model;
		
		
	}
	
	
	
	@RequestMapping(value="/deleteProjectMst",method=RequestMethod.GET)
	public ModelAndView deleteProjectMst(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model=new ModelAndView("redirect:/getProjectMasterList");
		Info info=new Info();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
		HttpSession session=request.getSession();
		
		try {
			int projectId= Integer.parseInt(request.getParameter("projectId"));
			map.add("pId", projectId);
			info=Constants.getRestTemplate().postForObject(Constants.url+"deleteProject", map, Info.class);
			if(info.isError()) {
				session.setAttribute("errorMsg", "Unable To Delete Project");	
				
			}else {
				session.setAttribute("successMsg", "Project Deleted Successfully!!!");
			}
				
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("errorMsg", "Unable To Delete Project  Exception Occuered");	
			System.err.println("Exception Occuered In /deleteProjectMst");
			e.printStackTrace();
		}
		
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
