package asm.java5Nhom6.util;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

public abstract class JpaRepository<T,ID> {
	
	@PersistenceContext
    protected EntityManager entityManager;

    public T findById(Class<T> clazz, ID id) {
        return entityManager.find(clazz, id);
    }

    public List<T> findAll(Class<T> clazz) {
        return entityManager.createQuery("FROM " + clazz.getSimpleName(), clazz).getResultList();
    }

    public T save(T entity) {
        entityManager.getTransaction().begin();
        entityManager.persist(entity);
        entityManager.getTransaction().commit();
        return entity;
    }

    public T update(T entity) {
        entityManager.getTransaction().begin();
        entityManager.merge(entity);
        entityManager.getTransaction().commit();
        return entity;
    }

    public void delete(Class<T> clazz, ID id) {
        entityManager.getTransaction().begin();
        T entity = entityManager.find(clazz, id);
        if (entity != null) {
            entityManager.remove(entity);
        }
        entityManager.getTransaction().commit();
    }

}
