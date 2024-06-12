package asm.java5Nhom6.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm.java5Nhom6.dao.AddressDao;
import asm.java5Nhom6.dao.Address_UserDao;
import asm.java5Nhom6.dao.RolesDao;
import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Address_User;
import asm.java5Nhom6.entity.Roles;
import asm.java5Nhom6.entity.Users;
import asm.java5Nhom6.service.MailerService;
import asm.java5Nhom6.service.PasswordHashingService;
import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminUser {
	@Autowired
	UsersDao usersDao;
	@Autowired
	Address_UserDao address_UserDao;
	@Autowired
	AddressDao address_Dao;
	@Autowired
	RolesDao rolesDao;
	@Autowired
	HttpServletRequest req;
	@Autowired
	PasswordHashingService passHashingService;
	@Autowired
	HttpSession session;

	Users users;
	Address_User address_User;
	Address address;

	private void AddAddress_User(Users users, Address address) {
		address_User = new Address_User();
		Address Address_Id = address_Dao.getById(address.getAddressId());
		Users User_Id = usersDao.getById(users.getUser_Id());
		address_User.setAddress(Address_Id);
		address_User.setUser(User_Id);
		address_UserDao.save(address_User);
	}

	@RequestMapping("admin/users")
	public String adminUsers(Model model) {
		List<Users> listUser = usersDao.findAll();
		List<Address_User> listAddress_User = address_UserDao.findAll();
		List<Roles> roles = rolesDao.findAll();
		List<String> genders = List.of("Nam", "Nữ");

		model.addAttribute("listUser", listUser);
		model.addAttribute("listAddress_User", listAddress_User);
		model.addAttribute("roles", roles);
		model.addAttribute("genders", genders);
		model.addAttribute("view", "adminUser.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/edit-user/{username}")
	public String edit(Model model, @PathVariable("id") String username) {
		Users user = usersDao.findByUsername(username);
		model.addAttribute("item", user);
		List<Users> users = usersDao.findAll();
		model.addAttribute("items", users);
		model.addAttribute("view", "adminUser.jsp");
		return "admin/layout";
	}

	@PostMapping("/admin/edit-user")
	public String editUser(Model model, @RequestParam("action") String action,
			@RequestParam("fullname") String fullname, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("gender") String gender,
			@RequestParam("role") Integer roleId, @RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email, @RequestParam("address") String addressStr,
			@RequestParam("provincial") String provincial) {

		System.out.println(roleId);
		if ("create".equals(action)) {
			Address address = new Address();
			address.setPhoneNumber(phoneNumber);
			address.setEmail(email);
			address.setAddress(addressStr);
			address.setProvincial(provincial);
			address_Dao.save(address);
			Users users = new Users();
			users.setFullname(fullname);
			String MatKhauMaHoa = passHashingService.MaHoa(password);
			users.setPassword(MatKhauMaHoa);
			users.setUsername(username);
			Roles role = rolesDao.getById(roleId);
			System.out.println(role);
			users.setRoles(role);
			if ("Nam".equals(gender)) {
				users.setGender(true);
			} else {
				users.setGender(false);
			}
			usersDao.save(users);
			AddAddress_User(users, address);
			model.addAttribute("view", "adminUser.jsp");
			return "redirect:/admin/users";
		} else if ("update".equals(action)) {

		}
		model.addAttribute("view", "adminUser.jsp");
		return "admin/layout";
	}
}
