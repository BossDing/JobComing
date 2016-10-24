package com.job.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.job.ajax.AjaxSolute;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private AjaxSolute ajaxSolute = new AjaxSolute();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//异步url参数 判断哪个数据的异步方法
		String choose_action = request.getParameter("curr");
		//注册 用户名异步
		if(choose_action.equals("register_username")){
			ajaxSolute.registerUsernameValidate(request, response);
		}
	}

}
