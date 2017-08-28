package controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import constan.Global;
import dao.AdminDAO;
import model.Admin;
import model.First;
@Controller
public class AdminController {
	AdminDAO adminDAO;

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}
	@Resource
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	/**
	 * ��ת������Ա��¼ҳ��
	 * @param request
	 * @param response
	 */
	@RequestMapping("/adminPage.do")
	public void toAdminIndex(HttpServletRequest request,HttpServletResponse response){
		try {
			request.getRequestDispatcher("/admin/adminLogin.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	/**
	 * ����û�����
	 * @param admin
	 * @param session
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/checkAdmin.do")
	public void checkAdmin(Admin admin,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		System.out.println("������checkAmin��controller����");
		String path="/error.jsp";
		if(adminDAO.checkAdmin(admin)){
			session.setAttribute(Global.ADMIN,admin);  //�������������ADMIN��session��
			path="/admin/adminIndex.jsp";     //ͨ��.do��ת���ܷ���������
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	public void modifyUser(First first){
		
		
	}
	

}
