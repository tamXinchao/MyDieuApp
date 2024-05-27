package asm.java5Nhom6.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity // This marks the class as an entity to be managed by JPA
@Table(name = "product_image") 
public class Product_Image {
@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
	Integer Id;

	@Column(name = "name_img", nullable = false)
	String Name_Img;

	@Column(name = "pro_size_color_id")
	Integer Pro_Size_Color_Id;
	
}
