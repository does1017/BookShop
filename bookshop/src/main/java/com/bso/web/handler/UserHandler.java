package com.bso.web.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bso.entity.User;
import com.bso.service.UserService;

@Controller
@RequestMapping("/user")
public class UserHandler {
	@Autowired
	private UserService userService;

	@RequestMapping("/register")
	public String register(User user) {
		LogManager.getLogger().debug(
				"Userhandler处理register请求， 请求参数对象user ==> " + user);
		if (userService.register(user) != null) {
			return "forward:/mail/active?Usid=" + user.getUsid();
		} else {
			return "redirect:/page/register.html";
		}

	}
	
	@RequestMapping("/login")
	public String login(User user, HttpSession session) {
		LogManager.getLogger().debug(
				"Userhandler处理login请求， 请求参数对象user ==> " + user);
		user = userService.login(user);
		if (user != null) {
			if (user.getStatus() == 0) { // 是否是未激活用户
				return "forward:/mail/active?email=" + user.getEmail()
						+ "&usid=" + user.getUsid();
			} else {
				session.setAttribute("userLogin", user);
				return "redirect:/index.html";
			}

		} else {
			return "redirect:/page/login.html";
		}

	}
	
	@RequestMapping("/active/{usid}/{activeCode}")
	public String active(@PathVariable("usid") Integer usid,
			@PathVariable("activeCode") String activeCode, HttpSession session) {
		LogManager.getLogger().debug(
				"Userhandler处理active请求， 请求参数activeCode, usId ==> " + activeCode
						+ ", " + usid);
		String srcActiveCode = (String) session.getAttribute("activeCode");
		if (srcActiveCode.intern() == activeCode.intern()) {
			if (userService.activeUser(usid)) {
				return "redirect:/page/login.html";
			}
		}
		return "redirect:/page/regok.html";
	}
	
}
