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

import asm.java5Nhom6.dao.AddressDao;
import asm.java5Nhom6.dao.Address_UserDao;
import asm.java5Nhom6.dao.RolesDao;
import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Address_User;
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
	private AddressDao addressDao;
	@Autowired
	private Address_UserDao address_UserDao;
	@Autowired
	RolesDao rolesDao;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;
	@Autowired
	CookieService cookie;
	//Gọi biến toàn cục
	Users user;
	Address address;

	// Lưu tài khoản và mật khẩu vào cookie
	private void SaveAccountByCookie(String username, String password, int days, HttpServletResponse resp) {
		cookie = new CookieService();
		cookie.create("username", username, 1, resp);
		cookie.create("password", password, 1, resp);
	}

	// Sử dụng hàm này để thêm dữ liệu vào cột address_User trong databse
	private void AddAddressUser() {
		Address_User address_User = new Address_User();
		Address Address_Id = addressDao.getById(address.getAddressId());
		Users User_Id = usersDao.getById(user.getUser_Id());
		address_User.setAddress(Address_Id);
		address_User.setUser(User_Id);
		address_UserDao.save(address_User);
	}

	// Đăng kí
	@GetMapping("/register")
	public String Register(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		return "account/register";
	}

	@PostMapping("/register")
	public String postRegister(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		String fullname = req.getParameter("fullname");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String rePassword = req.getParameter("rePassword");
		String genDer = req.getParameter("gender");
		if (password.equals(rePassword)) {
			user = new Users();
			Roles role = rolesDao.findById(1);
			user.setFullname(fullname);
			user.setUsername(username);
			user.setPassword(password);
			if ("male".equals(genDer)) {
				user.setGender(true);
			} else {
				user.setGender(false);
			}
			user.setRoles(role);
			Users successUser = usersDao.save(user); // lưu user thành công hay chưa
			if (successUser != null) {
				SaveAccountByCookie(username, password, 1, resp);
				session.setAttribute("userSession", user.getFullname());
				session.setAttribute("roleSession", user.getRoles().getRole_Id());
			}
			return "redirect:/information"; // Gọi hàm điền thông tin liên lạc của khách hàng
		}
		return "account/register";
	}

	// Quên mật khẩu
	@GetMapping("/forgot-password")
	public String ForgotPassword() {
		return "account/forgot-password";
	}

	@PostMapping("/information")
	public String postInfomation() {
		String PhoneNumber = req.getParameter("PhoneNumber");
		String Email = req.getParameter("Email");
		String Addresss = req.getParameter("Address");
		String Provincial = req.getParameter("Provincial");
		address = new Address();
		address.setPhoneNumber(PhoneNumber);
		address.setEmail(Email);
		address.setAddress(Addresss);
		address.setProvincial(Provincial);
		Address successAddAddress = addressDao.save(address);
		if (successAddAddress != null) {
			AddAddressUser();
			return "redirect:/trang-chu";

		}
		return "account/information";
	}

	// Thông tin địa chỉ của khách hàng
	@GetMapping("/information")
	public String getInfomation() {
		return "account/information";
	}

	// Đăng xuất
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userSession"); // Xóa dữ liệu đăng nhập của người dùng
		return "redirect:/trang-chu";
	}

	// Get đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() {
		return "account/login";
	}

	// Post Đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
		Users user = usersDao.login(username);
		if (user != null && user.getPassword().equals(password)) {
			SaveAccountByCookie(username, password, 1, resp);
			session.setAttribute("userSession", user.getFullname());
			session.setAttribute("roleSession", user.getRoles().getRole_Id());
			return "redirect:/trang-chu";
		}
		return "account/login";
	}

}