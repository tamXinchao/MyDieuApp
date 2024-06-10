//package asm.java5Nhom6.service;
//
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.text.SimpleDateFormat;
//import java.util.List;
//
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.CellStyle;
//import org.apache.poi.ss.usermodel.FillPatternType;
//import org.apache.poi.ss.usermodel.Font;
//import org.apache.poi.ss.usermodel.HorizontalAlignment;
//import org.apache.poi.ss.usermodel.IndexedColors;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.VerticalAlignment;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import asm.java5Nhom6.dao.ProductDAO;
//import asm.java5Nhom6.entity.Product;
//
//@Service
//public class ExcelServie {
//	@Autowired
//	private ProductDAO productDAO;
//	XSSFWorkbook workbook;
//
//	public byte[] exportToExcel(List<Product> products) {
//		workbook = new XSSFWorkbook(); // Tạo workbook mới
//		XSSFSheet sheet = workbook.createSheet("Products"); // Tạo sheet mới
//
//		CellStyle headerStyle = workbook.createCellStyle();
//		headerStyle.setFillForegroundColor(IndexedColors.LIGHT_CORNFLOWER_BLUE.getIndex());
//		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER.ordinal()); // Chuyển đổi thành kiểu short
//		headerStyle.setAlignment(HorizontalAlignment.CENTER);
//		Font headerFont = workbook.createFont();
//		headerFont.setBold(true);
//		headerStyle.setFont(headerFont);
//
//		int rownum = 0;
//		Row headerRow = sheet.createRow(rownum++); // Tạo hàng tiêu đề
//		createHeaderRow(headerRow, headerStyle); // Gọi phương thức tạo hàng tiêu đề
//
//		CellStyle dataStyle = workbook.createCellStyle();
//		dataStyle.setVerticalAlignment(VerticalAlignment.CENTER);
//		dataStyle.setAlignment(HorizontalAlignment.LEFT);
//		Font dataFont = workbook.createFont();
//		dataFont.setFontHeightInPoints((short) 11); // Thiết lập kích thước font cho dữ liệu
//		dataStyle.setFont(dataFont);
//
//		// màu cho dòng chẳn
//		CellStyle evenRowStyle = workbook.createCellStyle();
//		evenRowStyle.setFillForegroundColor(IndexedColors.WHITE.getIndex());
//		evenRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//		// Tạo CellStyle cho dòng lẻ
//		CellStyle oddRowStyle = workbook.createCellStyle();
//		oddRowStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
//		oddRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//
//		int count = 1; // Biến đếm số thứ tự
//		for (int i = 1; i <= products.size(); i++) { // Duyệt qua danh sách sản phẩm
//			Row row = sheet.createRow(i); // Tạo hàng mới cho mỗi sản phẩm
//			CellStyle rowStyle = (i % 2 == 0) ? evenRowStyle : oddRowStyle;
//			Product product = products.get(i - 1);
//			createProductRow(product, row, count++, rowStyle); // Điền dữ liệu sản phẩm vào hàng
//		}
//
//		// Tự động điều chỉnh kích thước cột cho phù hợp với nội dung
//		for (int i = 0; i < 6; i++) {
//			sheet.autoSizeColumn(i);
//		}
//
//		try (ByteArrayOutputStream out = new ByteArrayOutputStream()) { // Dùng ByteArrayOutputStream để lưu dữ liệu
//			workbook.write(out); // Ghi dữ liệu workbook vào stream
//			return out.toByteArray(); // Trả về mảng byte chứa dữ liệu
//		} catch (IOException e) {
//			e.printStackTrace();
//			return null; // Trả về null nếu có lỗi xảy ra
//		}
//	}
//
//	private void createHeaderRow(Row row, CellStyle headerStyle) {
//		String[] headers = { "STT", "ID", "Name", "Price", "Category", "CreateDay" };
//		for (int i = 0; i < headers.length; i++) {
//			Cell cell = row.createCell(i);
//			cell.setCellValue(headers[i]);
//			cell.setCellStyle(headerStyle);
//		}
//	}
//
//	private void createProductRow(Product product, Row row, int count, CellStyle dataStyle) {
//		String pattern = "dd/MM/yyyy";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//
//		Cell cell = row.createCell(0); // Ô đầu tiên cho STT
//		cell.setCellValue(count);
//		cell.setCellStyle(dataStyle);
//
//		cell = row.createCell(1); // Ô thứ hai cho ID
//		cell.setCellValue(product.getp);
//		cell.setCellStyle(dataStyle);
//
//		cell = row.createCell(2); // Ô thứ ba cho tên sản phẩm
//		cell.setCellValue(product.getName());
//		cell.setCellStyle(dataStyle);
//
//		cell = row.createCell(3); // Ô thứ tư cho giá sản phẩm
//		cell.setCellValue(product.getPrice());
//		cell.setCellStyle(dataStyle);
//
//		cell = row.createCell(4); // Ô thứ năm cho tên danh mục sản phẩm
//		cell.setCellValue(product.getCategory().getName());
//		cell.setCellStyle(dataStyle);
//
//		cell = row.createCell(5); // Ô thứ sáu cho ngày tạo
//		cell.setCellValue(simpleDateFormat.format(product.getCreateDate()));
//		cell.setCellStyle(dataStyle);
//	}
//}
