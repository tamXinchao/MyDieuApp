package asm.java5Nhom6.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import org.springframework.stereotype.Component;

import java.util.List;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Manufactures")
@Component
public class Manufacturer {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "manu_id")
    private int manuId;

	
    @Column(name = "manu_name", nullable = false)
    @NotBlank(message = "Vui lòng không để trống tên thương hiệu!")
    private String manuName;

    @Column(name = "info")
    @NotBlank(message = "Vui lòng không để trống thông tin thương hiệu!")
    private String info;
    
    @OneToMany(mappedBy = "manufacturer")
    List<Product> products;

}
