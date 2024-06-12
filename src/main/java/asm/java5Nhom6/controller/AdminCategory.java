package asm.java5Nhom6.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import asm.java5Nhom6.dao.CategoryDAO;
import asm.java5Nhom6.entity.Category;
import jakarta.servlet.ServletContext;

@Controller
public class AdminCategory {
	@Autowired
	CategoryDAO daoCate;
	@Autowired
	ServletContext app;

	@RequestMapping("/admin/edit-category")
	public String editCategory(Model model, @ModelAttribute("category") Category category) {
		List<Category> categories = daoCate.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("view", "admin-category.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/category/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Category category, Model model) {
		category = daoCate.findById(id).get();
		List<Category> categories = daoCate.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("category", category);
		model.addAttribute("view", "admin-category.jsp");
		return "admin/layout";
	}

	@RequestMapping("/admin/category/create")
	public String create(@ModelAttribute("category") @Validated Category category, BindingResult binding, Model model,
			@RequestParam("file") MultipartFile image, @RequestParam("image") String nameImages,
			RedirectAttributes redirectAttributes) throws IllegalStateException, IOException {

		if (category.getName() == null || category.getName().isEmpty()) {
			redirectAttributes.addFlashAttribute("Message", "Vui lòng không để trống tên danh mục");
			return "redirect:/admin/edit-category";
		} else if (category.getImage() == null || category.getImage().isEmpty()) {
			redirectAttributes.addFlashAttribute("Message", "Vui lòng không để trống ảnh danh mục");
			return "redirect:/admin/edit-category";
		}

		if (!image.isEmpty()) {
			String filePath = app.getRealPath("/user/img/");
			File file = new File(filePath + nameImages);
			try {
				image.transferTo(file);
				if (binding.hasErrors()) {
					redirectAttributes.addFlashAttribute("alert", "Vui lòng không để trống thông tin!");
					return "redirect:/admin/edit-category";
				} else {
					daoCate.save(category);
					redirectAttributes.addFlashAttribute("category", category);
					return "redirect:/admin/edit-category";
				}
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("alert", "Không thể tải ảnh từ hệ thống! " + e.getMessage());
				return "redirect:/admin/edit-category";
			}
		}

		return "redirect:/admin/edit-category";
	}

	@RequestMapping("/admin/category/delete/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {
		daoCate.deleteById(id);
		return "redirect:/admin/edit-category";
	}

	@RequestMapping("/admin/category/update")
	public String update(Model model, @ModelAttribute("category") Category category) {
		daoCate.save(category);
		return "redirect:/admin/edit-category";
	}
}
