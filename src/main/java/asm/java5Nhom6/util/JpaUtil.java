package asm.java5Nhom6.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtil {
private static EntityManagerFactory factory;
	//Phương thức để lấy EntityManager
	public static EntityManager getEntityManager() {
		if(factory == null || !factory.isOpen() ) {
			factory = Persistence.createEntityManagerFactory("MyDieuApp");
		}
		return factory.createEntityManager();
	}
	public static void shutdown() {
		if(factory != null && factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}
}
