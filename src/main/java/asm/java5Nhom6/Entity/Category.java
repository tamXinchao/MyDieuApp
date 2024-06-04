package asm.java5Nhom6.entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Categories")

public class Category {
	  @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cate_id")
    private int cateId;
<<<<<<< HEAD
=======

    @Column(name = "name", nullable = false)
>>>>>>> 0e01b0b7cd608b7434b4559a7a4c306590955112
    private String name;
    private String image;
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
