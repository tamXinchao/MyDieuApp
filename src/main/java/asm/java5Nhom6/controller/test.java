package asm.java5Nhom6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asm.java5Nhom6.entity.Product;
import jakarta.persistence.EntityManager;

@Controller
public class test {
	@Autowired
	EntityManager em;
	@ResponseBody
	@RequestMapping("/test")
	public List<Product> list(){
		SimpleJpaRepository<Product, Integer> repo 
		= new SimpleJpaRepository<>(Product.class, em);
		return repo.findAll();
	}
}
