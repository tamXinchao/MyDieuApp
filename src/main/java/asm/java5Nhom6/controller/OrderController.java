package asm.java5Nhom6.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import asm.java5Nhom6.dao.AddressDao;
import asm.java5Nhom6.dao.CartDAO;
import asm.java5Nhom6.dao.OrderDao;
import asm.java5Nhom6.dao.OrderDetailDao;
import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Address;
import asm.java5Nhom6.entity.Cart;
import asm.java5Nhom6.entity.Order;
import asm.java5Nhom6.entity.Order_Detail;
import asm.java5Nhom6.entity.Users;
import asm.java5Nhom6.service.SessionService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@Autowired
	CartDAO cartdao;

	List<Cart> listProInCart;
	
	@Autowired
	SessionService session;

	@Autowired
	UsersDao userDao;

	double amount = 0;

	@Autowired
	AddressDao addressDao;

	Users user;
	List<Address> listAddress;
	List<Cart> listCheckOut ;
	@Autowired
	OrderDao orderDao;

	@Autowired
	OrderDetailDao orderDetailDao;

	public Users getUser() {
		user = session.getAttribute("userSession");
		if (user!=null) {
			return user;
		}
		return null;
	}

	// số lượng sản phẩm trong giỏ hàng
	public void getCount(Model model) {
		Sort sort = Sort.by(Direction.DESC, "date");
		Users user = session.getAttribute("userSession");
		if (user == null) {
			model.addAttribute("Count", 0);
		} else {
			List<Cart> listProInCart = cartdao.findByUserId(user.getUser_Id(), sort);
			model.addAttribute("Count", listProInCart.size());
		}
	}

	// List Address
	public List<Address> getAddress() {
		
		listAddress = addressDao.findALLAddressByUserId(user.getUser_Id());
		return listAddress;
	}

	// check out
	@GetMapping("/checkout")
	public String checkout(Model model, @RequestParam(value = "selectedItems") List<Integer> selectedItems,
			@RequestParam(value = "address", required = false) String address) {
		// Sản phẩm
		List<Integer> ids = new ArrayList<>();
		if (selectedItems != null) {
			for (Integer l : selectedItems) {
				ids.add(l);
			}
		}
		amount=0;
		listCheckOut = new ArrayList<Cart>();
		for (Integer id : ids) {
			Cart item = cartdao.getById(id);
			amount += cartdao.getAmount(item.getProductSizeColor().getProSizeColorId());
			listCheckOut.add(item);
		}
		// địa chỉ
		getUser();
		if (user != null) {
			model.addAttribute("user", user);
			model.addAttribute("diachi", getAddress().get(0));
		} else {
			return "redirect:/login";
		}
		// attribute
		getCount(model);
		model.addAttribute("listCheckOut", listCheckOut);
		model.addAttribute("sp", listCheckOut.size());
		model.addAttribute("Amount", amount);
		model.addAttribute("view", "checkout.jsp");
		return "layout";
	}

	@PostMapping("/checkout")
	public String checkoutPost(Model model, @RequestParam(value = "address", required = false) String address) {
		Order orderNew = new Order();
		// date
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
		String today = dateFormat.format(new Date());
		Date date = null;
		try {
			date = dateFormat.parse(today);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// insert ỏder
		orderNew.setDate(date);
		orderNew.setStatus("Chờ xác nhận");
		orderNew.setTotalAmount(amount);
		orderNew.setUser(user);
		orderNew.setAddress(getAddress().get(0));

		orderDao.save(orderNew);
//		int orderId = orderNew.getOrderId();
//		System.out.println("Đã tạo hóa đơn mới ID: "+ orderId);

		// insert orderDetail
		for (Cart item : listCheckOut) {
			Order_Detail orderDetail = new Order_Detail();
			orderDetail.setOrder(orderNew);
			orderDetail.setProductSizeColor(item.getProductSizeColor());
			orderDetail.setQuality(item.getQuality());
			orderDetailDao.save(orderDetail);
//			System.out.println("Đã thêm OrderDetail Id: " + orderDetail.getOrderDetailId());
		}
		model.addAttribute("view", "thankyou.jsp");
		return "layout";
	}

}
