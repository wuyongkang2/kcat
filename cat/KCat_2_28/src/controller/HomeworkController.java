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
import dao.HomeworkDAO;

import model.Homework;
import model.PlaySoft;

@Controller
public class HomeworkController {
	HomeworkDAO homeworkDAO;

	public HomeworkDAO getHomeworkDAO() {
		return homeworkDAO;
	}
	@Resource
	public void setHomeworkDAO(HomeworkDAO homeworkDAO) {
		this.homeworkDAO = homeworkDAO;
	}
	
	/**
	 * 跳转到作业辅助
	 * @param request
	 * @param response
	 */
	@RequestMapping("/homework.do")
	public void toAdminIndex(HttpServletRequest request,HttpServletResponse response){
		try {
			request.getRequestDispatcher("/visitor/zyfz.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//获取所有字段
	@RequestMapping("/getHomework.do")
	@ResponseBody
	public ArrayList<Homework> getHomework(int cid){
		ArrayList<Homework> list=homeworkDAO.getHomework(cid);
		return list;
	}
	
		//获取指定分类的所有字段
		@RequestMapping("/getHomework_All.do")
		public void getHomework_All(Homework homework,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
			
			ArrayList<Homework> list=homeworkDAO.getHomework_All(homework.getCid());
			
			request.setAttribute(Global.HOMEWORK_DATA_MORE, list);
			request.getRequestDispatcher("/visitor/zyfz_cg.jsp").forward(request, response);
			return;    //跳转到bang.jsp页面，jsp已经补全
		}
		
	
		@RequestMapping("/getAllHomework.do")
		@ResponseBody
		public ArrayList<Homework> getAllHomework(){
			ArrayList<Homework> list=homeworkDAO.getAllHomework();
			return list;
		}
		
		@RequestMapping("/addHomework.do")
		@ResponseBody
		public boolean addHomework(Homework homework){
			homeworkDAO.addHomework(homework);;
			return true;
		}
		
		@RequestMapping("/deleteHomework.do")
		@ResponseBody
		public boolean deleteHomework(int id){
			homeworkDAO.deleteHomework(id);;
			return true;
		}
		
		@RequestMapping("/updateHomework.do")
		@ResponseBody
		public boolean updateHomework(Homework homework){
			homeworkDAO.updateHomework(homework);;
			return true;
		}
		
		@RequestMapping("/getHomework_Type.do")
		@ResponseBody
		public ArrayList<Homework> getHomework_Type(){
			return homeworkDAO.getHomework_Type();
		}
		
		@RequestMapping("/addHomework_Type.do")
		@ResponseBody
		public boolean addHomework_Type(String category){
			homeworkDAO.addHomework_Type(category);
			return true;
		}
		
		@RequestMapping("/delHomework_Type.do")
		@ResponseBody
		public boolean delHomework_Type(int id){
			homeworkDAO.delHomework_Type(id);
			return true;
		}
		
		@RequestMapping("/updateHomework_Type.do")
		@ResponseBody
		public boolean updateHomework_Type(String category,int id){
			homeworkDAO.updateHomework_Type(category, id);
			return true;
		}
		
		@RequestMapping("/getHomework_Type_title.do")
		@ResponseBody
		public boolean getHomework_Type_title(int cid){
			ArrayList<Homework> list=homeworkDAO.getHomework_Type_title(cid);
			if(list.size()>0){    
				return false;    
			}
			return true;
		}
		
		@RequestMapping("/getHomework_b.do")
		@ResponseBody
		public ArrayList<Homework> getHomework_b(){
			return homeworkDAO.getHomework_b();
		}
		
		@RequestMapping("/updateHomework_b.do")
		@ResponseBody
		public boolean updateHomework_b(String jpg,int id){
			homeworkDAO.updateHomework_b(jpg, id);
			return true;
		}
		
		
}
