package asm.java5Nhom6.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "employees") 
public class Employees {
  @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "em_id")
	Integer Em_Id;
 @Column(name = "position", nullable = false)
	String Position;
   @Column(name = "startday", nullable = false)
	Date Startday;
	  @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users user;
}
