package asm.java5Nhom6.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Manufactures")
public class Manufacture implements Serializable{
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name = "Manu_Id")
	 int manuId;
	 
	 @Column(name = "Manu_Name")
	 String manuName;

	 @Column(name = "Info")
	 String info;
	 
	 @OneToMany(mappedBy = "manufacture")
	    private List<Product> products;
}
