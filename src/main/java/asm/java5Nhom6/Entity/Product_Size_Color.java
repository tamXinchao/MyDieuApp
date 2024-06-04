package asm.java5Nhom6.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Component
@Table(name = "Product_Size_Color")
public class Product_Size_Color {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pro_size_color_id")
	private int productSizeColorId;
<<<<<<< HEAD

=======
>>>>>>> 0e01b0b7cd608b7434b4559a7a4c306590955112

	@Column(name = "status", nullable = false)
	private String status;

	@Column(name = "quality", nullable = false)
	private int quality;

	@Column(name = "price", nullable = false)
	private double price;

	@ManyToOne
	@JoinColumn(name = "color_id", nullable = false)
	private Color color;

	@ManyToOne
	@JoinColumn(name = "size_id", nullable = false)
	private Size size;

	@ManyToOne
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;

	@OneToMany(mappedBy = "productSizeColor")
    private List<Cart> cart;
}