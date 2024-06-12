package asm.java5Nhom6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import asm.java5Nhom6.dao.ManufacturesDAO;
import asm.java5Nhom6.entity.Manufacturer;
import jakarta.validation.Valid;

@Controller
public class AdminManufature {
	@Autowired
	ManufacturesDAO daoManufacture;

	@RequestMapping("/admin/edit-manufature")
	public String editManufacture(@ModelAttribute("manufacture") Manufacturer manufacture, Model model) {
		List<Manufacturer> manufactures = daoManufacture.findAll();
		model.addAttribute("manufactures", manufactures);
		model.addAttribute("manufacture", manufacture);
		model.addAttribute("view", "admin-manufature.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/manufacture/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model, Manufacturer manufacture) {
		manufacture = daoManufacture.findById(id).get();
		List<Manufacturer> manufactures = daoManufacture.findAll();
		model.addAttribute("manufactures", manufactures);
		model.addAttribute("manufacture", manufacture);
		model.addAttribute("view", "admin-manufature.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/manufacture/create")
	public String create(@Validated @ModelAttribute("manufacture") Manufacturer manufacture,
			BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {

		if (manufacture.getManuName() == null || manufacture.getManuName().isEmpty()) {
			redirectAttributes.addFlashAttribute("Message", "Vui lòng không để trống tên danh mục");
			return "redirect:/admin/edit-manufature";
		} else if (manufacture.getInfo() == null || manufacture.getInfo().isEmpty()) {
			redirectAttributes.addFlashAttribute("Message", "Vui lòng không để trống thông tin danh mục");
			return "redirect:/admin/edit-manufature";
		}

		if (bindingResult.hasErrors()) {
			List<Manufacturer> manufactures = daoManufacture.findAll();
			model.addAttribute("manufactures", manufactures);
			model.addAttribute("errors", "Vui lòng kiểm tra lại thông tin đã nhập");
			return "redirect:/admin/edit-manufature"; 
		} else {
			daoManufacture.save(manufacture);
			redirectAttributes.addFlashAttribute("success", "Thêm nhà sản xuất thành công");
			return "redirect:/admin/edit-manufature";
		}
	}

	@RequestMapping("/admin/manufacture/update")
	public String update(@ModelAttribute("manufacture") Manufacturer manufacture, Model model) {
		daoManufacture.save(manufacture);
		return "redirect:/admin/edit-manufature";
	}

	@RequestMapping("/admin/manufacture/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		daoManufacture.deleteById(id);
		return "redirect:/admin/edit-manufature";
	}
}
