package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BangDAO;
import model.Bang;
import model.BangTitle;
import model.Bang;
import model.Bang;

@Controller
public class BangController {

	BangDAO bangDAO;

	public BangDAO getBangDAO() {
		return bangDAO;
	}
	@Resource
	public void setBangDAO(BangDAO bangDAO) {
		this.bangDAO = bangDAO;
	}
/**
 * 跳转到帮帮帮页面
 * @param request
 * @param response
 */
	@RequestMapping("/bang.do")
	public void toAdminIndex(HttpServletRequest request,HttpServletResponse response){
		try {
			request.getRequestDispatcher("/visitor/bang.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}		
	

/**
 * 标题获取
 * @param session
 * @throws IOException
 * @throws ServletException 
 */
	@RequestMapping("/getTitle.do")
	@ResponseBody
	public ArrayList<BangTitle> getTitle(){
		return bangDAO.getTitle();      //获取对象的数组
	}
	
	/**
	 * 内容具体信息获取
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/getBang.do")
	@ResponseBody
	public ArrayList<Bang> getBang(Bang bang) throws IOException{
		System.out.println("获取bang的类型"+bang.getVideoType());
		return bangDAO.getBang(bang.getVideoType());

	}
	
	@RequestMapping("/getAllBang.do")
	@ResponseBody
	public ArrayList<Bang> getAllBang(){
		ArrayList<Bang> list=bangDAO.getAllBang();
		return list;
	}
	
	@RequestMapping("/addBang.do")
	@ResponseBody
	public boolean addBang(Bang bang){
		bangDAO.addBang(bang);;
		return true;
	}
	
	@RequestMapping("/deleteBang.do")
	@ResponseBody
	public boolean deleteBang(int id){
		bangDAO.deleteBang(id);;
		return true;
	}
	
	@RequestMapping("/updateBang.do")
	@ResponseBody
	public boolean updateBang(Bang bang){
		bangDAO.updateBang(bang);;
		return true;
	}
	
	@RequestMapping("/getBang_Type.do")
	@ResponseBody
	public ArrayList<Bang> getBang_Type(){
		return bangDAO.getBang_Type();
	}
	
	@RequestMapping("/addBang_Type.do")
	@ResponseBody
	public boolean addBang_Type(String titleName){
		bangDAO.addBang_Type(titleName);
		return true;
	}
	
	@RequestMapping("/delBang_Type.do")
	@ResponseBody
	public boolean delBang_Type(int id){
		bangDAO.delBang_Type(id);
		return true;
	}
	
	@RequestMapping("/updateBang_Type.do")
	@ResponseBody
	public boolean updateBang_Type(String titleName,int id){
		bangDAO.updateBang_Type(titleName, id);
		return true;
	}
	
	@RequestMapping("/getBang_Type_title.do")
	@ResponseBody
	public boolean getBang_Type_title(int videoType){
		ArrayList<Bang> list=bangDAO.getBang_Type_title(videoType);
		if(list.size()>0){    
			return false;    
		}
		return true;
	}
	
	@RequestMapping("/getBang_b.do")
	@ResponseBody
	public ArrayList<Bang> getBang_b(){
		return bangDAO.getBang_b();
	}
	
	@RequestMapping("/updateBang_b.do")
	@ResponseBody
	public boolean updateBang_b(String jpg,int id){
		bangDAO.updateBang_b(jpg, id);
		return true;
	}
	
}
