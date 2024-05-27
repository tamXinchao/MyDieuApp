
package asm.java5Nhom6.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Product_Id")
    private int id;

    @Column(name = "Product_Name")
    private String name; 

    @Column(name = "Origin")
    private String origin;

    @Column(name = "Material")
    private String material;

    @Column(name = "Describe")
    private String describe;

    @Column(name = "ngaynhap")//
    
    private Date ngayNhap;

//    @Column(name = "Manu_Id")
//    private int manuId;

    @ManyToOne
    @JoinColumn(name = "Cate_Id")
    private Category category;
    
    @ManyToOne
	@JoinColumn(name = "Manu_Id")
	Manufacture manufacture;
}
