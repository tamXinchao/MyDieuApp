package asm.java5Nhom6.Interceptor;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import asm.java5Nhom6.entity.Users;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class AuthInterceptor implements HandlerInterceptor {

	@Autowired
	private HttpSession session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {
		String uri = request.getRequestURI();
		Users user = (Users) session.getAttribute("userSession");

		if (user == null) { // Chưa đăng nhập
			response.sendRedirect("/login");
			return false; // Ngăn không cho request tiếp tục được xử lý
		} else if (user.getRoles().getRole_Id() != 2 && user.getRoles().getRole_Id() != 3
				&& !uri.startsWith("/admin/")) {
			response.sendRedirect("/login");
			return false; // Ngăn không cho request tiếp tục được xử lý
		}

		return true; // Cho phép request tiếp tục được xử lý
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {
		// Không cần triển khai gì trong phương thức này
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// Không cần triển khai gì trong phương thức này
	}
}
