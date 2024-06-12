package asm.java5Nhom6.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.swing.JFileChooser;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm.java5Nhom6.dao.OrderDao;
import asm.java5Nhom6.dao.OrderDetailDao;
import asm.java5Nhom6.entity.Order;
import asm.java5Nhom6.entity.Order_Detail;
import asm.java5Nhom6.model.OrderDetailModel;

@Controller
public class AdminOrderController {
	@Autowired
	OrderDao orderDao;

	@Autowired
	OrderDetailDao orderDetailDao;

// list Confirm
	@GetMapping("/admin/form-admin-order-confirm")
	public String confirm(Model model) {
		List<Order> listOrder = orderDao.findByStatusLike("Chờ xác nhận");
		List<OrderDetailModel> listCountOrderDetail = orderDetailDao.getListCountOrderDetail();
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("listCountOrderDetail", listCountOrderDetail);
		model.addAttribute("title", "Các đơn hàng chờ xác nhận");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}

//Order detail
	@GetMapping("/admin/form-admin-order-confirm-detail/{id}")
	public String orderConfirmDetail(Model model, @PathVariable("id") Integer orderId) {
		Order order = orderDao.getById(orderId);
		List<Order_Detail> listOrderDetail = orderDetailDao.getListOrderDetail(orderId);
		model.addAttribute("order", order);
		model.addAttribute("listOrderDetail", listOrderDetail);
		model.addAttribute("view", "admin-order-detail.jsp");
		return "admin/layout";
	}
	
// Xác nhận
	@GetMapping("/admin/confirm-to-pending/{id}")
	public String confirm(Model model, @PathVariable("id") Integer orderId) {
		Order order = orderDao.getById(orderId);
		order.setStatus("Đang chuẩn bị");
		orderDao.save(order);
		System.out.println("Đã cập nhật");
		model.addAttribute("view", "admin-order-detail.jsp");
		return "admin/layout";
	}
	
//search
	@PostMapping("/admin/order-confirm-search")
	public String searchComfirm(Model model, @RequestParam("search") String keyword) {
		List<Order> listOrder;
		try {
			Integer orderId = Integer.parseInt(keyword);
			 listOrder = orderDao.findOrderByKeyword(orderId, null);
		} catch (Exception e) {
			listOrder = orderDao.findOrderByKeyword(null, "%"+keyword+"%");
		}
		
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("search", keyword);
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
	
	@GetMapping("/admin/order-confirm-search-date")
	public String searchDateComfirm(Model model, @RequestParam("date1") Date date1, 
									@RequestParam("date2") Date date2) {
		
		List<Order> listOrder= orderDao.findByDateBetween(date1, date2);
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
//từ chối xác nhận
	@GetMapping("/admin/order-refuse/{id}")
	public String refuse(Model model, @PathVariable("id") Integer orderId) {
		
		model.addAttribute("view", "admin-order-detail.jsp");
		return "admin/layout";
	}
	
// pending
	@GetMapping("/admin/form-admin-order-pending")
	public String pending(Model model) {
		List<Order> listOrder = orderDao.findByStatusLike("Đang chuẩn bị");
		List<OrderDetailModel> listCountOrderDetail = orderDetailDao.getListCountOrderDetail();
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("listCountOrderDetail", listCountOrderDetail);
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

	@GetMapping("/export-to-excel")
	public String orderDetail(Model model) {
		try {
			XSSFWorkbook workbook = new XSSFWorkbook();

			XSSFSheet sheet = workbook.createSheet("Ds chờ xác nhận");
			sheet.setColumnWidth(0, 2000);
			sheet.setColumnWidth(1, 2000);
			sheet.setColumnWidth(2, 8000);
			sheet.setColumnWidth(3, 6000);
			sheet.setColumnWidth(4, 8000);
			sheet.setColumnWidth(5, 3000);
			sheet.setColumnWidth(6, 4000);
			Row header = sheet.createRow(0);

			CellStyle headerStyle = workbook.createCellStyle();
			headerStyle.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
			headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			XSSFFont font = ((XSSFWorkbook) workbook).createFont();
			font.setFontName("Arial");
			font.setFontHeightInPoints((short) 16);
			font.setBold(true);
			headerStyle.setFont(font);
			// Create header row in the excel

			Cell headerCell = header.createCell(0);
			headerCell.setCellValue("STT");
			headerCell.setCellStyle(headerStyle);

			headerCell = header.createCell(1);
			headerCell.setCellValue("Id");
			headerCell.setCellStyle(headerStyle);

			headerCell = header.createCell(2);
			headerCell.setCellValue("Họ tên");
			headerCell.setCellStyle(headerStyle);

			headerCell = header.createCell(3);
			headerCell.setCellValue("Số điện thoại");
			headerCell.setCellStyle(headerStyle);

			headerCell = header.createCell(4);
			headerCell.setCellValue("Ngày đặt");
			headerCell.setCellStyle(headerStyle);

			headerCell = header.createCell(5);
			headerCell.setCellValue("Mặt hàng");
			headerCell.setCellStyle(headerStyle);

			headerCell = header.createCell(6);
			headerCell.setCellValue("Tổng tiền");
			headerCell.setCellStyle(headerStyle);

			// Tạo CellStyle cho dòng chẵn
			CellStyle evenRowStyle = workbook.createCellStyle();
			evenRowStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			evenRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

//			// Tạo CellStyle cho dòng lẻ
//			CellStyle oddRowStyle = workbook.createCellStyle();
//			oddRowStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
//			oddRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			String pattern = "HH:mm:ss dd/MM/yyyy";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

			List<Order> listOrder = orderDao.findByStatusLike("Chờ xác nhận");
			List<OrderDetailModel> listCountOrderDetail = orderDetailDao.getListCountOrderDetail();

			for (int rowIndex = 1; rowIndex <= listOrder.size(); rowIndex++) {
				Row row = sheet.createRow(rowIndex);
				CellStyle rowStyle = (rowIndex % 2 == 0) ? evenRowStyle : null;
				Order p = listOrder.get(rowIndex - 1);

				int cellNum = 0;

				Cell cell = row.createCell(cellNum++);
				cell.setCellValue(rowIndex);
				cell.setCellStyle(rowStyle);

				cell = row.createCell(cellNum++);
				cell.setCellValue(p.getOrderId());
				cell.setCellStyle(rowStyle);

				cell = row.createCell(cellNum++);
				cell.setCellValue(p.getUser().getFullname());
				cell.setCellStyle(rowStyle);

				cell = row.createCell(cellNum++);
				cell.setCellValue(p.getAddress().getPhoneNumber());
				cell.setCellStyle(rowStyle);

				cell = row.createCell(cellNum++);
				cell.setCellValue(simpleDateFormat.format(p.getDate()));
				cell.setCellStyle(rowStyle);

				cell = row.createCell(cellNum++);
				for (OrderDetailModel orderDetailModel : listCountOrderDetail) {
					if (orderDetailModel.getOrderId() == p.getOrderId()) {
						cell.setCellValue(orderDetailModel.getCountOrderDetail());
					} else {
						cell.setCellValue(0);
					}
				}
				cell.setCellStyle(rowStyle);

				cell = row.createCell(cellNum++);
				cell.setCellValue(p.getTotalAmount());
				cell.setCellStyle(rowStyle);

			}

			String path = "Orders.xlsx";

			FileOutputStream outputStream = new FileOutputStream(path);
			workbook.write(outputStream);
			workbook.close();
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("sjbxkjzbx");
		model.addAttribute("view", "admin-order.jsp");
		return "admin/layout";
	}
}
