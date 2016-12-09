package com.bso.web.handler;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bso.entity.User;

@Controller
@RequestMapping("/mail")
public class MailHandler {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/active")
	public String activeAccount(HttpServletRequest request, User user) {
		LogManager.getLogger().debug("MailHandler处理activeAccount请求， 请求参数对象user ==> " + user);
		String activeCode = UUID.randomUUID().toString(); //发送随机激活码
		request.getSession().setAttribute("activeCode", activeCode); //把原始激活码存放到session中
		//发送到邮箱的激活路径
		String activePath = request.getRequestURL().toString().replace("mail/active", "user/active/" + user.getUsid() + "/" + activeCode);
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom("studymail_test@163.com");
			helper.setTo(user.getEmail());
			helper.setSubject("文轩网会员激活");
			helper.setText("<a href='" + activePath + "'>文轩网会员激活 </a><br>如果连接无效请求把激活地址" + activePath + " 复制到地址栏激活！！！", true);
			mailSender.send(message);
			LogManager.getLogger().debug("MailHandler处理activeAccount请求，发送激活码成功..." + activePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/page/registersuccess.html?1";
	}
}
