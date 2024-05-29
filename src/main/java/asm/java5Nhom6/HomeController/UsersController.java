package asm.java5Nhom6.HomeController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import asm.java5Nhom6.dao.AddressDao;
import asm.java5Nhom6.dao.Address_UserDao;
import asm.java5Nhom6.dao.RolesDao;
import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Address_User;
import asm.java5Nhom6.entity.Roles;
import asm.java5Nhom6.entity.Users;
import asm.java5Nhom6.service.CookieService;
import asm.java5Nhom6.service.MailerService;
import asm.java5Nhom6.service.PasswordHashingService;
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
	@Autowired
	PasswordHashingService passHashingService;
	
	// Gọi biến toàn cục
	Users user;
	Address address;
	Address_User address_User;
	

	int MaXacNhan = OTP();
	int MatKhauMoi = OTP();
	String sendOTP = "Đây là mã OTP của bạn: " + MaXacNhan + " Vui lòng không chia sẽ cho bất kì ai";
	String sendMatKhauMoi = "Đây là mật khẩu mới của bạn: " + MatKhauMoi + " Vui lòng không chia sẽ cho bất kì ai";
	String NameOfApp = "Mỹ Diệu App";
	
	// Lưu tài khoản và mật khẩu vào cookie
	private void SaveAccountByCookie(String username, String password, int days, HttpServletResponse resp) {
		cookie = new CookieService();
		cookie.create("username", username, 1, resp);
		cookie.create("password", password, 1, resp);
	}
	//Hàm hiện ra ngẫu nhiên 6 chữ số bất kì
	public int OTP() {
		Random random = new Random();
		int min = 100000; // Số nhỏ nhất có 6 chữ số
		int max = 999999; // Số lớn nhất có 6 chữ số
		return random.nextInt(max - min + 1) + min;
	}

	// Sử dụng hàm này để thêm dữ liệu vào cột address_User trong databse
	private void AddAddress_User() {
		address_User = new Address_User();
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
		String PhoneNumber = req.getParameter("PhoneNumber");
		String Email = req.getParameter("Email");
		String Addresss = req.getParameter("Address");
		String Provincial = req.getParameter("Provincial");
		address = new Address();
		address.setPhoneNumber(PhoneNumber);
		address.setEmail(Email);
		address.setAddress(Addresss);
		address.setProvincial(Provincial);
		if (password.equals(rePassword)) {
			user = new Users();
			Roles role = rolesDao.findById(1);
			String MatKhauMaHoa = passHashingService.MaHoa(rePassword); //Mã hóa mật khẩu muốn lưu
			user.setFullname(fullname);
			user.setUsername(username);
			user.setPassword(MatKhauMaHoa); // Lưu lại mật khẩu mã hóa
			if ("male".equals(genDer)) {
				user.setGender(true);
			} else {
				user.setGender(false);
			}
			user.setRoles(role);
			Address successAddAddress = addressDao.save(address);
			Users successUser = usersDao.save(user); // lưu user thành công hay chưa
			if (successUser != null && successAddAddress != null) {
				MailerService mailerService = new MailerService();
				mailerService.sendEmail(address.getEmail(), NameOfApp, sendOTP);
				System.out.println(String.valueOf(MaXacNhan));
			}
			return "redirect:/maxacnhan";
		}
		return "account/register";
	}

	// Quên mật khẩu
	@GetMapping("/forgot-password")
	public String ForgotPassword() {
		return "account/forgot-password";
	}
	@PostMapping("/forgot-password")
	public String postForgotPassword() {
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		Address address = addressDao.findEmailBy(username, email);
		if (address.getEmail() != null && address.getEmail().equals(email)) {
			MailerService mailerService = new MailerService();
			Users user = usersDao.findByUsername(username);
			String MatKhauMaHoa = passHashingService.MaHoa(String.valueOf(MatKhauMoi));
			user.setPassword(MatKhauMaHoa);
			usersDao.save(user);
			mailerService.sendEmail(address.getEmail(), NameOfApp, sendMatKhauMoi);
		}
		return "redirect:/login";
	}
	
	//Đổi mật khẩu
	@GetMapping("/change-password")
	public String getChangePassword() {
		return "account/change-password";
	}
	@PostMapping("/change-password")
	public String postChangePassword() {
		String username = req.getParameter("username");
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		String reNewPassword = req.getParameter("reNewPassword");
		String MatKhauMaHoa = passHashingService.MaHoa(oldPassword); //Mã hóa mật khẩu cũ để so sánh
		Users user = usersDao.findByUsername(username);
		if(user.getUsername().equals(username) && user.getPassword().equals(MatKhauMaHoa)) {
			if(newPassword.equals(reNewPassword)) {
				String MatKhauMaHoaMoi = passHashingService.MaHoa(reNewPassword); //Mã hóa mật khẩu muốn đổi lại để lưu
				user.setPassword(MatKhauMaHoaMoi);
				usersDao.save(user);
			}
			else {
				System.out.println("Mật khẩu mới không trùng khớp");
			}
			return "redirect:/trang-chu";
		}
		
		return "account/change-password";
	}

	
	//Mã xác nhận mật khẩu
	@GetMapping("/maxacnhan")
	public String getOTP() {
		return "account/OTP";
	}
	@PostMapping("/maxacnhan")
	public String postOTP() {
		String confirmOTP = req.getParameter("MaXacNhan");
		if (confirmOTP != null && confirmOTP.equals(String.valueOf(MaXacNhan))) {
			AddAddress_User();
			SaveAccountByCookie(user.getUsername(), user.getPassword(), 1, resp);
			session.setAttribute("userSession", user);
			session.setAttribute("addressSession",address );
			session.setAttribute("roleSession", user.getRoles().getRole_Id());
			return "redirect:/trang-chu";
		} else {
			System.out.println(MaXacNhan);
			usersDao.delete(user);
			addressDao.delete(address);
			return "account/register";
		}
	}
	
	
	
	//Thông tin khách hàng
	@GetMapping("/information")
	public String getInformation() {
		return "account/information";
	}
	@PostMapping("/information")
	public String postInformation() {
		return "account/information"; 
	}

	// Đăng xuất
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userSession"); // Xóa dữ liệu đăng nhập của người dùng
		session.invalidate();
		return "redirect:/trang-chu";
	}
	//Cập nhận thông tin người dùng
	@GetMapping("/updateInformation")
	public String updateInformation() {
			String Fullname = req.getParameter("fullname");
			String genDer = req.getParameter("gender");
			String PhoneNumber = req.getParameter("PhoneNumber");
			String Email = req.getParameter("Email");
			
			if ("male".equals(genDer)) {
				user.setGender(true);
			} else {
				user.setGender(false);
			}
			user.setFullname(Fullname);
			address.setPhoneNumber(PhoneNumber);
			address.setEmail(Email);
			usersDao.save(user);
			addressDao.save(address);
		return "redirect:/information";
	}

	// Get đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() {
		
		return "account/login";
	}

	// Post Đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
		user = usersDao.findByUsername(username);
		String MatKhauMaHoa = passHashingService.MaHoa(password); //Mã hóa mật khẩu để so sánh
		address = addressDao.findInformationByUserName(username);
		if (user != null && user.getPassword().equals(MatKhauMaHoa)) {
			SaveAccountByCookie(username, password, 1, resp);
			session.setAttribute("userSession", user);
			session.setAttribute("addressSession",address );
			session.setAttribute("roleSession", user.getRoles().getRole_Id());
			return "redirect:/trang-chu";
		}
		return "account/login";
	}        

}