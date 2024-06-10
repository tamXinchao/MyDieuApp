package asm.java5Nhom6.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//Class hứng dữ liệu từ truy vấn
public class dtoProduct {
    String image;
    String productName;
    Double price;
    Integer id;
    Integer cateId;
}
