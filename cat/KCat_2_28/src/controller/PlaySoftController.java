package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import constan.Global;
import dao.PlaySoftDAO;
import model.PlaySoft;
import model.PlaySoft_title;
import model.StudySoft;

@Controller
public class PlaySoftController {
	PlaySoftDAO playSoftDAO;
	
	public PlaySoftDAO getPlaySoftDAO() {
		return playSoftDAO;
	}
	@Resource
	public void setPlaySoftDAO(PlaySoftDAO playSoftDAO) {
		this.playSoftDAO = playSoftDAO;
	}
/**
 * 跳转到娱乐软件页面
 * @param request
 * @param response
 */
	@RequestMapping("/yuleruanjian.do")
	public void toAdminIndex(HttpServletRequest request,HttpServletResponse response){
		try {
			request.getRequestDispatcher("/visitor/yuleruanjian.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
/**
 * 直接获取所有的标题信息
 * @return
 */
	@RequestMapping("/getPlaySoft_title.do")
	@ResponseBody
	public ArrayList<PlaySoft_title> getPlaySoft_title(){
		System.out.println("A.进入了getPlaySoft_title");
		ArrayList<PlaySoft_title> list=playSoftDAO.getPlaySoft_title();
		System.out.println(list);
		return list;
	}
	
/**
 * 根据标题id获取该模块信息
 * @param playSoft
 * @return
 */
	@RequestMapping("/getPlaySoft.do")
	@ResponseBody
	public ArrayList<PlaySoft> getPlaySoft(PlaySoft playSoft){
		System.out.println(playSoft.getSoft_to_title());
		System.out.println("进入了PlaySoft的controller方法");
		ArrayList<PlaySoft> list=playSoftDAO.getPlaySoft(playSoft.getSoft_to_title());
		System.out.println(list);
		return list;
	}
	
/**
 * 根据标题id获取该模块信息
 * @param playSoft
 * @return
 */
	@RequestMapping("/getPlaySoft_All.do")
	@ResponseBody
	public void getPlaySoft_All(int num,HttpSession session,HttpServletRequest request,HttpServletResponse response){
		System.out.println("进入了PlaySoft_All的controller方法"+num);
		ArrayList<PlaySoft> list=playSoftDAO.getPlaySoft_All(num);
		System.out.println(list);
		request.setAttribute(Global.Study_Play_DATA, list);
		try {
			request.getRequestDispatcher("visitor/download_play.jsp").forward(request, response);		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getAllPlaySoft.do")
	@ResponseBody
	public ArrayList<PlaySoft> getAllPlaySoft(){
		ArrayList<PlaySoft> list=playSoftDAO.getAllPlaySoft();
		System.out.println(list);
		return list;
		
	}
	
	@RequestMapping("/checkPlaySoftName.do")
	@ResponseBody
	public boolean checkPlaySoftName(String softName){
	
		ArrayList<PlaySoft> list=playSoftDAO.checkPlaySoftName(softName);
		if(list.size()>0){    
			return false;    
		}
		return true;
		
	}
	
	@RequestMapping("/addPlaySoft.do")
	@ResponseBody
	public boolean addPlaySoft(PlaySoft playSoft){
		playSoftDAO.addPlaySoft(playSoft);
		return true;
		
	}
	
	@RequestMapping("/updatePlaySoft.do")
	@ResponseBody
	public boolean updatePlaySoft(PlaySoft playSoft){
		playSoftDAO.updatePlaySoft(playSoft);
		return true;
	}
	
	@RequestMapping("/deletePlaySoft.do")
	@ResponseBody
	public boolean deletePlaySoft(int id){
		playSoftDAO.deletePlaySoft(id);
		return true;
	}
	
	@RequestMapping("/addPlaysoft_Type.do")
	@ResponseBody
	public boolean addPlaysoft_Type(String titleName){
		playSoftDAO.addPlaysoft_Type(titleName);
		return true;
	}
	
	@RequestMapping("/delPlaysoft_Type.do")
	@ResponseBody
	public boolean delPlaysoft_Type(int id){
		playSoftDAO.delPlaysoft_Type(id);
		return true;
	}
	
	@RequestMapping("/updatePlaysoft_Type.do")
	@ResponseBody
	public boolean updatePlaysoft_Type(String titleName,int id){
		playSoftDAO.updatePlaysoft_Type(titleName, id);
		return true;
	}
	
	@RequestMapping("/getPlaysoft_Type.do")
	@ResponseBody
	public ArrayList<PlaySoft_title> getPlaysoft_Type(){
		return playSoftDAO.getPlaysoft_Type();
	}
	
	@RequestMapping("/getPlaysoft_Type_soft.do")
	@ResponseBody
	public boolean getPlaysoft_Type_soft(int soft_to_title){
		ArrayList<PlaySoft> list=playSoftDAO.getPlaysoft_Type_soft(soft_to_title);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}
	
	
	
	
	
}
