package asm.java5Nhom6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import asm.java5Nhom6.dao.OrderDao;
import asm.java5Nhom6.dao.OrderDetailDao;
import asm.java5Nhom6.entity.Order;
import asm.java5Nhom6.entity.Order_Detail;

@Controller
public class AdminOrderController {
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	OrderDetailDao orderDetailDao;
	
	//Confirm
	@GetMapping("/admin/form-admin-order-confirm")
	public String confirm(Model model) {
		List<Order> listOrder = orderDao.findAll();
		System.out.println(listOrder.get(0).getUser().getFullname());
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("title", "Các đơn hàng chờ xác nhận");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
	
	@GetMapping("/admin/form-admin-order-confirm-detail/{id}")
	public String orderConfirmDetail(Model model, @PathVariable("id") Integer orderId) {
		Order order = orderDao.getById(orderId);
		List<Order_Detail> listOrderDetail = orderDetailDao.getListOrderDetail(orderId);
		
		model.addAttribute("order", order);
		model.addAttribute("listOrderDetail", listOrderDetail);
		model.addAttribute("view", "admin-order-detail.jsp");
		return "admin/layout";
	}
	
	//pending
	@GetMapping("/admin/form-admin-order-pending")
	public String pending(Model model) {

		model.addAttribute("title", "Các đơn hàng đang chuẩn bị");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
	
	@GetMapping("/admin/form-admin-order-delivering")
	public String delivering(Model model) {
		
		model.addAttribute("title", "Các đơn hàng đang giao");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
	
	@GetMapping("/admin/form-admin-order-delivered")
	public String delivered(Model model) {
		
		model.addAttribute("title", "Các đơn hàng giao thành công");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
	
	@GetMapping("/admin/form-admin-order-returned")
	public String returned(Model model) {

		model.addAttribute("title", "Các đơn hàng đã hàng");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
	
	@GetMapping("/admin/form-admin-order-canceled")
	public String canceled(Model model) {

		model.addAttribute("title", "Các đơn hàng đã hủy");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
	
	
	
	@GetMapping("/admin/form-admin-order-detail")
	public String orderDetail(Model model) {
		model.addAttribute("view", "admin-order-detail.jsp");
		return "admin/layout";
	}
}
