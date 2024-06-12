package asm.java5Nhom6.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import asm.java5Nhom6.dao.OrderDao;
import asm.java5Nhom6.dao.OrderDetailDao;
import asm.java5Nhom6.dao.RolesDao;
import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Address_User;
import asm.java5Nhom6.entity.Order;
import asm.java5Nhom6.entity.Roles;
import asm.java5Nhom6.entity.Users;
import asm.java5Nhom6.model.OrderDetailModel;
import asm.java5Nhom6.service.CookieService;
import asm.java5Nhom6.service.MailerService;
import asm.java5Nhom6.service.PasswordHashingService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

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
	//my.
	@Autowired
	OrderDao orderDao; 
	@Autowired
	OrderDetailDao orderDetailDao;//my

	// Gọi biến toàn cục
	Users user;
	Address address;
	List<Address> listAddress;
	Address_User address_User;

	int MaXacNhan = OTP();
	int MatKhauMoi = OTP();
	String sendOTP = "Đây là mã OTP của bạn: " + MaXacNhan + " Vui lòng không chia sẽ cho bất kì ai";
	String sendMatKhauMoi = "Đây là mật khẩu mới của bạn: " + MatKhauMoi + " Vui lòng không chia sẽ cho bất kì ai";
	String NameOfApp = "Mỹ Diệu App";
	private static final Logger logger = LogManager.getLogger(UsersController.class);

	// Lưu tài khoản và mật khẩu vào cookie
	private void SaveAccountByCookie(String username, String password, int days, HttpServletResponse resp) {
		cookie = new CookieService();
		cookie.create("username", username, 1, resp);
		cookie.create("password", password, 1, resp);
	}

	// Hàm hiện ra ngẫu nhiên 6 chữ số bất kì
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
	public String Register(Model model) {
		model.addAttribute("view", "account/register.jsp");
		return "layout";
	}

	@PostMapping("/register")
	public String postRegister(Model model) {
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
		if (password != null && password.equals(rePassword)) {
			user = new Users();
			Roles role = rolesDao.findById(1);
			String MatKhauMaHoa = passHashingService.MaHoa(rePassword); // Mã hóa mật khẩu muốn lưu
			user.setFullname(fullname);
			user.setUsername(username);
			user.setPassword(MatKhauMaHoa); // Lưu lại mật khẩu mã hóa
			if ("male".equals(genDer)) {
				user.setGender(true);
			} else {
				user.setGender(false);
			}
			user.setRoles(role);
			System.out.println("Luu thanh cong 1");
			addressDao.save(address);
			usersDao.save(user);
			if (addressDao.save(address) != null && usersDao.save(user) != null) {
				// lưu user thành công hay chưa
				System.out.println("Luu thanh cong 2");
				MailerService mailerService = new MailerService();
				mailerService.sendEmail(address.getEmail(), NameOfApp, sendOTP);
				System.out.println(String.valueOf(MaXacNhan));
				model.addAttribute("view", "account/OTP.jsp");
				return "layout";
			}
		}
		usersDao.delete(user);
		addressDao.delete(address);
		model.addAttribute("view", "account/register.jsp");
		return "layout";
	}

	// Quên mật khẩu
	@GetMapping("/forgot-password")
	public String ForgotPassword(Model model) {
		model.addAttribute("view", "account/forgot-password.jsp");
		return "layout";

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

	// Đổi mật khẩu
	@GetMapping("/change-password")
	public String getChangePassword(Model model) {
		model.addAttribute("view", "account/change-password.jsp");
		return "layout";
	}

	@PostMapping("/change-password")
	public String postChangePassword(Model model) {
		String username = req.getParameter("username");
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		String reNewPassword = req.getParameter("reNewPassword");
		String MatKhauMaHoa = passHashingService.MaHoa(oldPassword); // Mã hóa mật khẩu cũ để so sánh
		Users user = usersDao.findByUsername(username);
		if (user.getUsername().equals(username) && user.getPassword().equals(MatKhauMaHoa)) {
			if (newPassword.equals(reNewPassword)) {
				String MatKhauMaHoaMoi = passHashingService.MaHoa(reNewPassword); // Mã hóa mật khẩu muốn đổi lại để lưu
				user.setPassword(MatKhauMaHoaMoi);
				usersDao.save(user);
			} else {
				System.out.println("Mật khẩu mới không trùng khớp");
			}
			return "redirect:/trang-chu";
		}
		model.addAttribute("view", "account/change-password.jsp");
		return "layout";

	}

	// Mã xác nhận mật khẩu
	@GetMapping("/maxacnhan")
	public String getOTP(Model model) {
		model.addAttribute("view", "account/OTP.jsp");
		return "layout";
	}

	@PostMapping("/maxacnhan")
	public String postOTP(Model model) {
		String confirmOTP = req.getParameter("MaXacNhan");
		if (confirmOTP != null && confirmOTP.equals(String.valueOf(MaXacNhan))) {
			AddAddress_User();
			SaveAccountByCookie(user.getUsername(), user.getPassword(), 1, resp);
			session.setAttribute("userSession", user);
			session.setAttribute("addressSession", address);
			session.setAttribute("roleSession", user.getRoles().getRole_Id());
			return "redirect:/trang-chu";
		} else {
			System.out.println(MaXacNhan);
			usersDao.delete(user);
			addressDao.delete(address);
			model.addAttribute("view", "account/register.jsp");
			return "layout";
		}
	}

	// Xem thông tin khách hàng
	@GetMapping("/information")
	public String getInformation(Model model) {
		//mỵ thêm
		user = (Users) session.getAttribute("userSession");
		List<Order> listOrder = orderDao.findByUserId(user.getUser_Id());
		List<OrderDetailModel> listCountOrderDetail = orderDetailDao.getListCountOrderDetail();
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("listCountOrderDetail", listCountOrderDetail);
		System.out.println(listOrder.size());
		//my.
		model.addAttribute("view", "account/information.jsp");
		return "layout";
	}

	@PostMapping("/information")
	public String postInformation(Model model) {
		model.addAttribute("view", "account/information.jsp");
		return "layout";
	}

	// Đăng xuất
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userSession"); // Xóa dữ liệu đăng nhập của người dùng
		session.invalidate();
		cookie.clearCookies(req, resp);
		return "redirect:/trang-chu";
	}

	// Cập nhận thông tin người dùng
	@GetMapping("/updateInformation")
	public String updateInformation(Model model) {
		user = (Users) session.getAttribute("userSession");
		listAddress = (List<Address>) session.getAttribute("addressSession");
		String Fullname = req.getParameter("fullname");
		String genDer = req.getParameter("gender");
		String PhoneNumber = req.getParameter("PhoneNumber");
		String Email = req.getParameter("email");
		String Address = req.getParameter("address");
		String Provincial = req.getParameter("provincial");
		if ("male".equals(genDer)) {
			user.setGender(true);
		} else {
			user.setGender(false);
		}
		address = listAddress.get(0);
		user.setFullname(Fullname);
		address.setPhoneNumber(PhoneNumber);
		address.setEmail(Email);
		address.setAddress(Address);
		address.setProvincial(Provincial);
		usersDao.save(user);
		addressDao.save(address);
		model.addAttribute("view", "account/information.jsp");
		return "layout";
	}

	/**
	 * @param model
	 * @param phoneNumber
	 * @param email
	 * @param addressStr
	 * @param provincial
	 * @return
	 */

	// Thêm địa chỉ mới
	@GetMapping("/new-address")
	public String newAddress(Model model, @RequestParam("PhoneNumber") String phoneNumber,
			@RequestParam("email") String email, @RequestParam("address") String addressStr,
			@RequestParam("provincial") String provincial) {
		user = (Users) session.getAttribute("userSession");
		address = new Address();
		address.setPhoneNumber(phoneNumber);
		address.setEmail(email);
		address.setAddress(addressStr);
		address.setProvincial(provincial);
		addressDao.save(address);
		AddAddress_User();
		List<Address> updatedAddressList = addressDao.findInformationByUserName(user.getUsername());
		session.setAttribute("addressSession", updatedAddressList);
		model.addAttribute("view", "account/information.jsp");
		return "layout";
	}

	// Xóa địa chỉ
	@PostMapping("/delete-address")
	public String deleteAddress(@RequestParam("addressId") int addressId, Model model) {
		user = (Users) session.getAttribute("userSession");
		Address_User address_UserDelete = address_UserDao.findAllByUserIdAndAddressId(user.getUser_Id(), addressId);
		address_UserDao.delete(address_UserDelete);
		addressDao.deleteById(addressId);
		List<Address> updatedAddressList = addressDao.findInformationByUserName(user.getUsername());
		session.setAttribute("addressSession", updatedAddressList);
		model.addAttribute("view", "account/information.jsp");
		return "layout";
	}

	// Get đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(@ModelAttribute("user") Users user, Model model) {
		model.addAttribute("user", user);
		model.addAttribute("view", "account/login.jsp");
		return "layout";
	}

	// Post Đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.POST)

	public String postLogin(@Valid @ModelAttribute("user") Users user, @RequestParam("username") String username,
			@RequestParam("password") String password, Model model, HttpServletResponse resp, HttpSession session) {

		String message = "Vui lòng nhập chính xác tài khoản và mật khẩu!";
		model.addAttribute("user", user);
		user = usersDao.findByUsername(username);
		String MatKhauMaHoa = passHashingService.MaHoa(password); // Mã hóa mật khẩu để so sánh

		listAddress = addressDao.findInformationByUserName(username);
		if (user != null && user.getPassword().equals(MatKhauMaHoa)) {
			SaveAccountByCookie(username, password, 1, resp);
			session.setAttribute("userSession", user);
			session.setAttribute("addressSession", listAddress);
			session.setAttribute("roleSession", user.getRoles().getRole_Id());
			logger.info(user.getUsername() + " " + "Đăng nhập thành công");
			return "redirect:/trang-chu";
		} else {
			logger.warn("đăng nhập thất bại");
			model.addAttribute("message", message);
			model.addAttribute("view", "account/login.jsp");
			return "layout";
		}
	}
}