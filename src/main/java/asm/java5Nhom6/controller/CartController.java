package asm.java5Nhom6.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import asm.java5Nhom6.dao.CartDAO;
import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Cart;
import asm.java5Nhom6.entity.Product_Size_Color;
import asm.java5Nhom6.entity.Users;
import asm.java5Nhom6.service.SessionService;


@Controller
public class CartController {
	private static final Logger logger = LogManager.getLogger(CartController.class);
	@Autowired
	CartDAO cartdao;

	List<Cart> listProInCart;

	@Autowired
	SessionService session;

	@Autowired
	UsersDao userDao;

	Users user;
	Sort sort = Sort.by(Direction.DESC, "date");
	// số lượng sản phẩm trong giỏ hàng
	public void getCount(Model model) {
		
		Users user = session.getAttribute("userSession");
		if (user==null) {
			model.addAttribute("Count", 0);
		}else {
			List<Cart> listProInCart = cartdao.findByUserId(user.getUser_Id(), sort);
			model.addAttribute("Count", listProInCart.size());
		}
	}
		
	//Giỏ hàng
	@RequestMapping("/gio-hang")
	public String Cart(Model model) {
		Sort sort = Sort.by(Direction.DESC, "date");
		 user = session.getAttribute("userSession");

		if (user==null) {
			listProInCart = new ArrayList<Cart>();
		}else {
			listProInCart = cartdao.findByUserId(user.getUser_Id(), sort);
		}
//		listProInCart = cartdao.findByUserId(3, sort);
		List<Integer> ids = new ArrayList<>();
		for (Cart item : listProInCart) {
			ids.add(item.getProductSizeColor().getProSizeColorId());
		}

		double amount = 0;
		for (Integer id : ids) {
			amount += cartdao.getAmount(id);
		}

		System.out.println(amount);
		model.addAttribute("listProInCart", listProInCart);
		model.addAttribute("Count", listProInCart.size());
		model.addAttribute("Amount", amount);
		model.addAttribute("view", "cart.jsp");
		return "layout";
	}

	// Thêm vào giỏ
	@PostMapping("/cart/add")
	public String addToCart(Model model, @RequestParam(value = "color") String color, @RequestParam("size") String size,
			@RequestParam("productId") Integer productId, @RequestParam("quality") Integer quality) {
		getCount(model);
		Product_Size_Color psc = cartdao.PSC(productId, color, size);

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
		String today = dateFormat.format(new Date());
		Date date = null;
		try {
			date = dateFormat.parse(today);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		user = session.getAttribute("userSession");
		if (user==null) {
			return "redirect:/login";
		} 
		Cart item = new Cart();
		item.setDate(date);
		item.setProductSizeColor(psc);
		item.setQuality(quality);
		item.setUser(user);

		boolean itemExists = false;
		
		 listProInCart = cartdao.findByUserId(user.getUser_Id(), sort);
		if (listProInCart!=null) {
			for (Cart cart : listProInCart) {
				if (cart.getProductSizeColor().equals(item.getProductSizeColor())) {
					// Increase quantity by 1
					cart.setQuality(cart.getQuality() + 1);
					cartdao.save(cart);
			        logger.info("User: "+ user.getUsername()+" tăng số lượng +1 Product_Size_Color "+ psc.getProSizeColorId()+" vào giỏ hàng");
					itemExists = true;
				}
			}
		}
		
		if (!itemExists) {
			// Add new item to the cart
			cartdao.save(item);
	        logger.info("User: "+ user.getUsername()+" thêm Product_Size_Color "+ psc.getProSizeColorId()+" vào giỏ hàng");

		}

		String contextPath = session.getAttribute("contextPath");

		return "redirect:" + contextPath;
	}

	// thay đổi số lượng trong giỏ
	@RequestMapping("/gio-hang/update/{id}/{pre}")
	public String update(@PathVariable("id") Integer id, @PathVariable("pre") String pre) {
		Cart item = cartdao.getById(id);
		if (pre.equals("minus") && item.getQuality() > 1) {
			item.setQuality(item.getQuality() - 1);

		} else if (pre.equals("plus") && item.getQuality() < 10) {
			item.setQuality(item.getQuality() + 1);
		}
		cartdao.save(item);
		if (item.getQuality() == 0)
			cartdao.deleteById(id);
		return "redirect:/gio-hang";
	}

	// xóa sp khỏi giỏ
	@RequestMapping("/cart/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		cartdao.deleteById(id);
		return "redirect:/gio-hang";
	}

}