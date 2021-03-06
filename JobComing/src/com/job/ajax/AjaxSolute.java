package com.job.ajax;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.job.bean.User;
import com.job.dao.UserDao;
import com.job.daoImpl.UserDaoImpl;

/**
 * 异步提交处理类
 * 
 * @author h
 *
 */
public class AjaxSolute {

	private UserDao userDao = new UserDaoImpl();

	/**
	 * 验证注册用户名
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public void registerUsernameValidate(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		response.setContentType("text/html; charset=utf-8");
		User user = userDao.getUser(username);
		// 用户名不存在
		try {
			if (user == null) {
				response.getWriter().write("");
			}
			// 用户名存在
			else {
				response.getWriter().write("用户名已存在");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证邮箱
	 * 
	 * @param request
	 * @param response
	 */
	public void registerEmailValidate(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		response.setContentType("text/html; charset=utf-8");
		User user = userDao.getUserByEmail(email);
		// 邮箱不存在
		try {
			if (user == null) {
				response.getWriter().write("");
			}
			// 邮箱存在
			else {
				response.getWriter().write("邮箱已注册");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证手机
	 * 
	 * @param request
	 * @param response
	 */
	public void registerPhoneValidate(HttpServletRequest request, HttpServletResponse response) {
		String phoneString = request.getParameter("phone");
		long phone = Long.parseLong(phoneString);		
		response.setContentType("text/html; charset=utf-8");
		User user = userDao.getUserByPhone(phone);
		// 手机没绑定
		try {
			if (user == null) {
				response.getWriter().write("");
			}
			// 手机已经绑定
			else {
				response.getWriter().write("该号码已经绑定");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void chooseAction(String choose_action, AjaxSolute ajaxSolute, HttpServletRequest request,
			HttpServletResponse response) {
		// 注册 用户名异步
		if (choose_action.equals("register_username")) {
			ajaxSolute.registerUsernameValidate(request, response);
		} else if (choose_action.equals("register_email")) {
			ajaxSolute.registerEmailValidate(request, response);
		} else if (choose_action.equals("register_phone")) {
			ajaxSolute.registerPhoneValidate(request, response);
		}
	}
}
