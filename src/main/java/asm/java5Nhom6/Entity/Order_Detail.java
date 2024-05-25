package asm.java5Nhom6.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="Order_Detail")
public class Order_Detail {
	Integer Order_Detail_Id;
	Integer Quality;
	Integer Pro_Size_Color_Id;
	Integer Order_Id;
	
}
