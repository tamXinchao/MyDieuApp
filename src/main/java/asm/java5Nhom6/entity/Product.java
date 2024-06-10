
package asm.java5Nhom6.entity;

import java.io.Serializable;
import java.util.Date;

import java.util.List;


import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import jakarta.persistence.OneToMany;
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

	@Column(name = "NgayNhap")
	private Date ngayNhap;

	private String material;

    @ManyToOne
    @JoinColumn(name = "Manu_id")
    private Manufacturer manufacturer;

	@ManyToOne
	@JoinColumn(name = "Cate_Id")
	Category category;

    @OneToMany(mappedBy = "product")
    private List<Product_Size_Color> productSizeColors;

}

