package asm.java5Nhom6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.entity.Product;
import asm.java5Nhom6.service.ExcelService;

@Controller
public class ExcelController {
	private List<Product> products;
	@Autowired
	ProductDAO proDao;
	@Autowired
	ExcelService excelService;

	@GetMapping("/product/exportToExcel")
	public ResponseEntity<byte[]> exportToExcel() {
		if (products == null || products.isEmpty()) {
			products = proDao.findAll();
		}

		byte[] excelContent = excelService.exportToExcel(products);

		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=products.xlsx");
		headers.add(HttpHeaders.CONTENT_TYPE, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

		return ResponseEntity.ok().headers(headers).body(excelContent);
	}
}
