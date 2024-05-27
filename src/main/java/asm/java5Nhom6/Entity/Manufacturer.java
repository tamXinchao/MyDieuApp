package asm.java5Nhom6.Entity;

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
@Entity
@Table(name = "Manufactures")
public class Manufacturer {
	 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "manu_id")
    private Long manuId;

    @Column(name = "manu_name", nullable = false)
    private String manuName;

    @Column(name = "info")
    private String info;

}
