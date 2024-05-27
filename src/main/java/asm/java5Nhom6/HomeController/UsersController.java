package asm.java5Nhom6.HomeController;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import asm.java5Nhom6.dao.RolesDao;
import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Roles;
import asm.java5Nhom6.entity.Users;
import asm.java5Nhom6.service.CookieService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsersController {

    @Autowired
    private UsersDao usersDao;
    @Autowired
    RolesDao rolesDao;
    @Autowired
    HttpSession session;
    
    
    //Đăng kí
    @GetMapping("/register")
	public String Register(HttpSession session,HttpServletRequest req,HttpServletResponse resp) {
    	return "account/register"; 
	}
    
    @PostMapping("/register")
    public String postRegister(HttpSession session,HttpServletRequest req,HttpServletResponse resp) {
    	Users user = new Users();
    	String fullname = req.getParameter("fullname");
    	String username = req.getParameter("username");
    	String password = req.getParameter("password");
    	String rePassword = req.getParameter("rePassword");
    	if(password.equals(rePassword)) {
    		Roles role = rolesDao.findById(1);
        	user.setFullname(fullname);
        	user.setUsername(username);
        	user.setPassword(password);
        	user.setGender(true);
        	user.setRoles(role);
        	usersDao.save(user);
        	session.setAttribute("userSession", user.getFullname());
        	session.setAttribute("roleSession", user.getRoles().getRole_Id());
        	return "redirect:/trang-chu";
    	}
		return "account/register";
    }
    
    //Quên mật khẩu
    @GetMapping("/forgot-password")
	public String ForgotPassword() {
    	Users user = new Users();
    	user.setFullname(null);
		return "account/forgot-password";
	}
    
    //Đăng xuất
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("userSession"); //Xóa dữ liệu đăng nhập của người dùng
    	return "redirect:/trang-chu";
    }
    
    //Get đăng nhập
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin() {
    	return "account/login";
    }
    
    //Post Đăng nhập
    @RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(@RequestParam("username") String username,@RequestParam("password") String password, HttpSession session) {
		Users user = usersDao.login(username);
		if(user != null && user.getPassword().equals(password)) {
			CookieService cookie = new CookieService();
			cookie.create("username", username, 1);
			cookie.create("password", password, 1);
			session.setAttribute("userSession", user.getFullname());
			session.setAttribute("roleSession", user.getRoles().getRole_Id());
			return "redirect:/trang-chu";
		}
		return "account/login";
	}
}