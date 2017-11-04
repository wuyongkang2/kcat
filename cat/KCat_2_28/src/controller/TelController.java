package controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import constan.Global;
import dao.TelDAO;
import model.Tel;
import model.Tel;
import model.Tel;

@Controller
public class TelController {
	TelDAO telDAO;

	public TelDAO getTelDAO() {
		return telDAO;
	}
	
	@Resource
	public void setTelDAO(TelDAO telDAO) {
		this.telDAO = telDAO;
	}
	
	@RequestMapping("/getTel.do")
	public void getTel(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		ArrayList<Tel> list=telDAO.getTel();
		System.out.println(list);
		request.setAttribute(Global.Tel_DATA, list);	
		request.getRequestDispatcher("/visitor/xydh.jsp").forward(request, response);
		
		return;
	}
	
	@RequestMapping("/getAllTel.do")
	@ResponseBody
	public ArrayList<Tel> getAllTel(){
		ArrayList<Tel> list=telDAO.getAllTel();
		return list;
	}
	
	@RequestMapping("/addTel.do")
	@ResponseBody
	public boolean addTel(Tel tel){
		telDAO.addTel(tel);;
		return true;
	}
	
	@RequestMapping("/deleteTel.do")
	@ResponseBody
	public boolean deleteTel(int id){
		telDAO.deleteTel(id);;
		return true;
	}
	
	@RequestMapping("/updateTel.do")
	@ResponseBody
	public boolean updateTel(Tel tel){
		telDAO.updateTel(tel);;
		return true;
	}
	
	@RequestMapping("/getTel_Type.do")
	@ResponseBody
	public ArrayList<Tel> getTel_Type(){
		return telDAO.getTel_Type();
	}
	
	@RequestMapping("/addTel_Type.do")
	@ResponseBody
	public boolean addTel_Type(String category){
		telDAO.addTel_Type(category);
		return true;
	}
	
	@RequestMapping("/delTel_Type.do")
	@ResponseBody
	public boolean delTel_Type(int id){
		telDAO.delTel_Type(id);
		return true;
	}
	
	@RequestMapping("/updateTel_Type.do")
	@ResponseBody
	public boolean updateTel_Type(String category,int id){
		telDAO.updateTel_Type(category, id);
		return true;
	}
	
	@RequestMapping("/getTel_Type_title.do")
	@ResponseBody
	public boolean getTel_Type_title(int cid){
		ArrayList<Tel> list=telDAO.getTel_Type_title(cid);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}
	
	
}
