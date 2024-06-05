package asm.java5Nhom6.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import asm.java5Nhom6.dao.CartDAO;
import asm.java5Nhom6.entity.Cart;

@Controller
public class CartController {

	@Autowired
	CartDAO cartdao;
	
	@RequestMapping("/gio-hang")
//	, @RequestBody List<Integer> checkedIds
	public String Cart(Model model ) {
		Sort sort = Sort.by(Direction.DESC, "date");
		List<Cart> listProInCart = cartdao.findByUserId(3, sort);
		Cart item = listProInCart.get(0);
		System.out.println(item.getProductSizeColor().getColor().getName());
//		System.out.println("Received checked IDs: " + checkedIds);
		List<Integer> ids = new ArrayList<>();
        ids.add(24);
        ids.add(14);
        double amount=0;
        for (Integer id : ids) {
			amount += cartdao.getAmount(id);
		}
		
		model.addAttribute("listProInCart", listProInCart);
		model.addAttribute("Count", listProInCart.size());
		model.addAttribute("Amount",amount);
		model.addAttribute("view", "cart.jsp");
		return "layout";
	}

	//Thêm vào giỏ
	@RequestMapping("/cart/add/{id}")
	public String addToCart(@PathVariable("id") Integer id) {
		cartdao.deleteById(id);
		return "redirect:/gio-hang";
	}
	
	//thay đổi số lượng trong giỏ
	@RequestMapping("/gio-hang/update/{id}/{pre}")
	public String update(@PathVariable("id") Integer id, @PathVariable("pre") String pre) {
		Cart item = cartdao.getById(id);
		if (pre.equals("minus") && item.getQuality() > 0) {
			item.setQuality(item.getQuality() - 1);

		} else if (pre.equals("plus") && item.getQuality() < 100) {
			item.setQuality(item.getQuality() + 1);
		}
		cartdao.save(item);
		if (item.getQuality() == 0)
			cartdao.deleteById(id);
		return "redirect:/gio-hang";
	}

	//xóa sp khỏi giỏ
	@RequestMapping("/cart/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		cartdao.deleteById(id);
		return "redirect:/gio-hang";
	}

	//xem chi tiết(size, color) đã thêm vào giỏ
//	@RequestMapping("product-detail/{id}")
//	public String detail(@PathVariable("id") Integer id) {
//		Cart item = cartdao.getById(id);
//		System.out.println(item.getProductSizeColor().getPrice());
//		System.out.println(item.getProductSizeColor().getColor());
//		System.out.println(item.getProductSizeColor().getSize());
//		
//		return "redirect:/gio-hang";
//	}

}
