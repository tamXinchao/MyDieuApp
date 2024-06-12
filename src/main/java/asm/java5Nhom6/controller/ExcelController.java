package asm.java5Nhom6.controller;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import asm.java5Nhom6.dao.CategoryDAO;
import asm.java5Nhom6.dao.ManufacturesDAO;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.entity.Category;
import asm.java5Nhom6.entity.Manufacturer;
import asm.java5Nhom6.entity.Product;
import asm.java5Nhom6.service.ExcelExportService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ExcelController {

	@Autowired
	ManufacturesDAO manuDao;
	@Autowired
	ProductDAO proDao;
	@Autowired
	CategoryDAO cateDao;
	@Autowired
	ExcelExportService excelService;

	@GetMapping("/product/exportToExcel")
	public ResponseEntity<byte[]> exportToExcelProduct() throws IOException {
		String patten = "dd-MM-yyyy";
		SimpleDateFormat fortmat = new SimpleDateFormat(patten);
		List<Product> products = proDao.findAll();

		String[] headers = { "STT", "Tên Sản Phẩm", "Xuất Xứ", "Chất Liệu", "Thể Loại", "Thương Hiệu", "Ngày Nhập",
				"Miêu tả" };

		byte[] excelContent = excelService.exportExcel(products, product -> {
			return new String[] { String.valueOf(products.indexOf(product) + 1), // STT
					product.getProductName(), 
					product.getOrigin(),
					product.getMaterial(),
					product.getCategory().getName(), 
					product.getManufacturer().getManuName(), 
					fortmat.format(product.getNgayNhap()),
					product.getDescribe()};
		}, headers);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=products.xlsx");
		responseHeaders.add(HttpHeaders.CONTENT_TYPE,
				"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

		return ResponseEntity.ok().headers(responseHeaders).body(excelContent);
	}
	
	@GetMapping("/category/exportToExcel")
	public ResponseEntity<byte[]> exportToExcelCategory() throws IOException {
		List<Category> categories = cateDao.findAll();

		String[] headers = { "STT", "Tên Loại", "Mã Loại", "Ảnh"};

		byte[] excelContent = excelService.exportExcel(categories, category -> {
			return new String[] { String.valueOf(categories.indexOf(category) + 1), // STT
					category.getName(),
					String.valueOf(category.getCateId()),
					category.getImage()};
		}, headers);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=products.xlsx");
		responseHeaders.add(HttpHeaders.CONTENT_TYPE,
				"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

		return ResponseEntity.ok().headers(responseHeaders).body(excelContent);
	}
	
	
	@GetMapping("/manufacture/exportToExcel")
	public ResponseEntity<byte[]> exportToExcelManufacture() throws IOException {
		List<Manufacturer> manufactures = manuDao.findAll();

		String[] headers = { "STT", "Tên Thương Hiệu", "Mã Thương Hiệu", "Thông Tin"};

		byte[] excelContent = excelService.exportExcel(manufactures, manu -> {
			return new String[] { String.valueOf(manufactures.indexOf(manu) + 1), // STT
					manu.getManuName(),
					String.valueOf(manu.getManuId()),
					manu.getInfo()};
		}, headers);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=products.xlsx");
		responseHeaders.add(HttpHeaders.CONTENT_TYPE,
				"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

		return ResponseEntity.ok().headers(responseHeaders).body(excelContent);
	}
}
