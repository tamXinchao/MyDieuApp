package asm.java5Nhom6.service;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class ExcelExportService {

	public <T> byte[] exportExcel(List<T> data, Function<T, String[]> dataMapper, String[] headers) throws IOException {
		// Create a new workbook
		Workbook workbook = new XSSFWorkbook();

		// Create a blank sheet
		Sheet sheet = workbook.createSheet("Data");
		for (int i = 0; i < 8; i++) {
			sheet.autoSizeColumn(i);
		}
		// Create header row
		Row headerRow = sheet.createRow(0);
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
		}

		// Create data rows
		int rowNum = 1;
		for (T item : data) {
			Row row = sheet.createRow(rowNum++);
			String[] rowData = dataMapper.apply(item);
			for (int i = 0; i < rowData.length; i++) {
				row.createCell(i).setCellValue(rowData[i]);
			}
		}

		// Write the workbook to a byte array
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		workbook.write(outputStream);
		workbook.close();

		return outputStream.toByteArray();
	}
}
