package com.bso.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bso.entity.User;
import com.bso.util.AttributeData;

@WebServlet("/UserServlet")
public class UserServlet extends BasicServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op=request.getParameter("op");
		
		if("getLoginInfo".equals(op)){
			getLoginInfo(request,response);
		}
	}

	private void getLoginInfo(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		Object obj=session.getAttribute(AttributeData.CURRENTUSERLOGIN);
		if(obj==null){	//说明用户没有登录
			this.out(response, obj);
		}else{
			this.out(response,(User)obj );
		}
		
	}

	
}
