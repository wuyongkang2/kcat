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
import dao.StudySoftDAO;
import model.First;
import model.StudySoft;
import model.StudySoft_titleB;
import model.StudySoft_titleS;

@Controller
public class StudySoftController {
	StudySoftDAO studySoftDAO;

	public StudySoftDAO getStudySoftDAO() {
		return studySoftDAO;
	}
	@Resource
	public void setStudySoftDAO(StudySoftDAO studySoftDAO) {
		this.studySoftDAO = studySoftDAO;
	}
	/**
	 * 跳转到专业软件页面
	 * @param request
	 * @param response
	 */
	@RequestMapping("/zhuanyeruanjian.do")
	public void toAdminIndex(HttpServletRequest request,HttpServletResponse response){
		try {
			request.getRequestDispatcher("/visitor/zhuanyeruanjian.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
/**
 * 获取所有的大标题(学院)
 */
	@RequestMapping("/getStudySoftB.do")
	@ResponseBody
	public ArrayList<StudySoft_titleB> getStudySoftB(){
		System.out.println("A:"+studySoftDAO.getStudySoftB());
		return studySoftDAO.getStudySoftB();
	}
/**
 * 通过大标题id获取小标题(专业)
 */
	@RequestMapping("/getStudySoftS.do")
	@ResponseBody
	public ArrayList<StudySoft_titleS> getStudySoftS(StudySoft_titleS studySoft_titleS){
		System.out.println("B:"+studySoftDAO.getStudySoftS(1));
		return studySoftDAO.getStudySoftS(studySoft_titleS.getTitleS_to_titleB());
	}
/**
 * 通过小标题id获取专业软件信息	
 */
	@RequestMapping("/getStudySoft.do")
	@ResponseBody
	public ArrayList<StudySoft> getStudySoft(StudySoft studySoft){
		System.out.println("D:"+studySoft.getSoft_to_titleS());
		return studySoftDAO.getStudySoft(studySoft.getSoft_to_titleS());
	}
/**
 * 根据标题id获取该模块信息
 * @param studySoft
 * @return
 */
	@RequestMapping("/getStudySoft_All.do")
	@ResponseBody
	public void getStudySoft_All(int num,HttpServletRequest request,HttpServletResponse response) {
		ArrayList<StudySoft> list=studySoftDAO.getStudySoft_All(num);
		request.setAttribute(Global.Study_Play_DATA, list);
		try {
			request.getRequestDispatcher("visitor/download.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过软件名字查找该软件的信息
	 */
		@RequestMapping("/getStudySoft_id.do")
		@ResponseBody
		public ArrayList<StudySoft> getStudySoft_id(String data){
			return studySoftDAO.getStudySoft_id(data);
		}

		
/**
 * 获取所有软件名字
 * @param studySoft
 * @return
 */
	@RequestMapping("/getAllSoftName.do")
	@ResponseBody
	public ArrayList<StudySoft> getAllSoftName(){
		ArrayList<StudySoft> list = studySoftDAO.getAllSoftName();
		System.out.println(list);
		return list;
	}
	
/**
 * 添加软件名字
 * @param studySoft
 * @return
 */
	@RequestMapping("/addSoftName.do")
	@ResponseBody
	public boolean addSoftName(StudySoft studySoft){
		System.out.println("进入StudySoftController:softName:"+studySoft);
		studySoftDAO.addSoftName(studySoft);
		return true;
	}
	
/**
 * 添加专业软件
 * @param studySoft
 * @return
 */
	@RequestMapping("/addStudySoft.do")
	@ResponseBody
	public boolean addStudySoft(StudySoft studySoft){
		System.out.println("进入StudySoftController:"+studySoft);
		studySoftDAO.addStudySoft(studySoft);
		return true;
	}
	
/**
 * 获得软件名字对应的序号
 * @param studySoft
 * @return
 */	
	@RequestMapping("/getSoftName_id.do")
	@ResponseBody
	public ArrayList<StudySoft> getSoftName_id(String softName){
		System.out.println("进入StudySoftController:softName:"+softName);
		return studySoftDAO.getSoftName_id(softName);
	}
	
	
/**
 * 获取所有软件
 * @param studySoft
 * @return
 */
	@RequestMapping("/getAllSoft.do")
	@ResponseBody
	public ArrayList<StudySoft> getAllSoft(){
		ArrayList<StudySoft> list = studySoftDAO.getAllSoft();
		System.out.println(list);
		return list;
	}
	
/**
 * 删除软件
 * @param studySoft
 * @return
 */
	
	@RequestMapping("/deleteStudySoft.do")
	@ResponseBody
	public boolean deleteStudySoft(int id){
		studySoftDAO.deleteStudySoft(id);
		return true;
	}
/*
 * 检查软件名字	
 */
	@RequestMapping("/checkSoftName.do")
	@ResponseBody
	public boolean checkSoftName(String softName){
		ArrayList<StudySoft> list=studySoftDAO.checkSoftName(softName);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}

/**
 * 删除软件
 * @param studySoft
 * @return
 */
	
	@RequestMapping("/deleteStudySoftAllot.do")
	@ResponseBody
	public boolean deleteStudySoftAllot(int id){
		studySoftDAO.deleteStudySoftAllot(id);
		return true;
	}
	
/**
 * 修改软件信息
 * @param studySoft
 * @return
 */	
	@RequestMapping("/updateStudySoft.do")
	@ResponseBody
	public boolean updateStudySoft(StudySoft studySoft){
		studySoftDAO.updateStudySoft(studySoft);
		return true;
	}
	
	
	@RequestMapping("/getCollege.do")
	@ResponseBody
	public ArrayList<StudySoft_titleB> getCollege(){
		return studySoftDAO.getCollege();
		
	}
	
	@RequestMapping("/getMajor_college.do")
	@ResponseBody
	public boolean getMajor_college(int titleS_to_titleB){
		
		ArrayList<StudySoft_titleS> list=studySoftDAO.getMajor_college(titleS_to_titleB);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}
	
	@RequestMapping("/getMajor.do")
	@ResponseBody
	public ArrayList<StudySoft_titleS> getMajor(){
		return studySoftDAO.getMajor();
		
	}
	
	@RequestMapping("/getAllot_major.do")
	@ResponseBody
	public boolean getAllot_major(int soft_to_titleS){
		ArrayList<StudySoft> list=studySoftDAO.getAllot_major(soft_to_titleS);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}
	
	@RequestMapping("/getAllot_name.do")
	@ResponseBody
	public boolean getAllot_name(String softName){
		ArrayList<StudySoft> list=studySoftDAO.getAllot_name(softName);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}
	
	@RequestMapping("/getType.do")
	@ResponseBody
	public ArrayList<StudySoft> getType(){
		return studySoftDAO.getType();
		
	}
	
	@RequestMapping("/getSoft_Type.do")
	@ResponseBody
	public boolean getSoft_Type(int cid){
		ArrayList<StudySoft> list=studySoftDAO.getSoft_Type(cid);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}
	
	@RequestMapping("/addCollege.do")
	@ResponseBody
	public boolean addCollege(String titleBName){
		studySoftDAO.addCollege(titleBName);
		return true;
	}
	
	@RequestMapping("/delCollege.do")
	@ResponseBody
	public boolean delCollege(int id){
		studySoftDAO.delCollege(id);
		return true;
	}
	
	@RequestMapping("/addMajor.do")
	@ResponseBody
	public boolean addMajor(String titleSName,int titleS_to_titleB){
		studySoftDAO.addMajor(titleSName, titleS_to_titleB);
		return true;
	}
	
	@RequestMapping("/delMajor.do")
	@ResponseBody
	public boolean delMajor(int id){
		studySoftDAO.delMajor(id);
		return true;
	}
	
	@RequestMapping("/addType.do")
	@ResponseBody
	public boolean addType(String softType){
		studySoftDAO.addType(softType);
		return true;
	}
	
	@RequestMapping("/delType.do")
	@ResponseBody
	public boolean delType(int id){
		studySoftDAO.delType(id);
		return true;
	}
	
	@RequestMapping("/updateCollege.do")
	@ResponseBody
	public boolean updateCollege(String titleBName,int id){
		studySoftDAO.updateCollege(titleBName, id);
		return true;
	}
	
	@RequestMapping("/updateMajor.do")
	@ResponseBody
	public boolean updateMajor(String titleSName,int id){
		studySoftDAO.updateMajor(titleSName, id);
		return true;
	}
	
	@RequestMapping("/updateType.do")
	@ResponseBody
	public boolean updateType(String softType,int id){
		studySoftDAO.updateType(softType, id);
		return true;
	}
	
	@RequestMapping("/getStudySoft_b.do")
	@ResponseBody
	public ArrayList<StudySoft> getStudySoft_b(){
		return studySoftDAO.getStudySoft_b();
	}
	
	@RequestMapping("/updateStudySoft_b.do")
	@ResponseBody
	public boolean updateStudySoft_b(String ico,String jpg,int id){
		studySoftDAO.updateStudySoft_b(ico, jpg, id);
		return true;
	}
	
}
