package asm.java5Nhom6.dao;

import asm.java5Nhom6.util.JpaUtil;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

public class AbstractDao<T> {
	public static final EntityManager entityManager = JpaUtil.getEntityManager();

	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}

	public T findById(Class<T> clazz, Integer id) { // Tìm và trả về một thực thể có ID cụ thể
		return entityManager.find(clazz, id);
	}
	
	//Tìm và trả về tất cả các thực thể
	public List<T> findAll(Class<T> clazz) {
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");

		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		return query.getResultList();
	}
	
	//Tìm và trả về tất cả các thực thể có phân trang (Có 15 user nếu bạn muốn hiển thị 10 user trong 1 trang còn không thì sẽ hiển thị tất cả 15 user)
	public List<T> findAll(Class<T> clazz, int PageNumber, int PageSize){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		
		TypedQuery<T> query = entityManager.createQuery(sql.toString(),clazz);
		query.setFirstResult((PageNumber - 1) * PageSize);
		query.setMaxResults(PageSize);
		return query.getResultList();
	}
	
	

	// Hàm tạo ra một thực thể mới
	public T create(T entity) {
		try {
			entityManager.getTransaction().begin(); // Bắt đầu thực hiện kết nối
			entityManager.persist(entity);// Lưu thực thể vào cơ sở dữ liệu
			entityManager.getTransaction().commit();// Commit giao dịch (Xác nhận thay đổi)
			System.out.println("Thêm mới thành công");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Không thể thêm Entity này: " + entity.getClass().getSimpleName() + " vào dữ liệu");
			throw new RuntimeException(e);
		}
	}
	
	
	//Hàm cập nhật thực thể mới
	public T update(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(entity); // Cập nhật thực thể vào cơ sở dữ liệu
			entityManager.getTransaction().commit();
			System.out.println("Cập nhật thành công");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Không cập nhật thành công: " + entity.getClass().getSimpleName() + " vào dữ liệu");
			throw new RuntimeException();
		}
	}
	//Hàm xóa thực thể mới
	public T delete(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(entity); // Xóa thực thể
			entityManager.getTransaction().commit();
			System.out.println("Xóa thành công");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Xóa không thành công: " + entity.getClass().getSimpleName() + " vào dữ liệu");
			throw new RuntimeException();
		}
	}

}
