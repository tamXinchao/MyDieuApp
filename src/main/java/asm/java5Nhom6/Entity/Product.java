package asm.java5Nhom6.entity;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;

	private String productName;

	private String origin;

	private String describe;
	
	private String image;

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayNhap") // Đảm bảo tên cột khớp với tên trong cơ sở dữ liệu
	private Date ngayNhap;

	private String material;

	@ManyToOne
	@JoinColumn(name = "Manu_id")
	Manufacturer manufacturer;

	@ManyToOne
	@JoinColumn(name = "Cate_Id")
	Category category;

<<<<<<< HEAD
=======
	private String image;
>>>>>>> 0e01b0b7cd608b7434b4559a7a4c306590955112
}
