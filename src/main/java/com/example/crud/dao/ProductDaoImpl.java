package com.example.crud.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import com.example.crud.entities.Product;

public class ProductDaoImpl implements IProductDao {

    private EntityManagerFactory emf;

    // The constructor initializes the EntityManagerFactory.
    // This is where we apply the "Singleton" pattern.
    public ProductDaoImpl() {
        // "ProductPU" is the name of the persistence-unit from persistence.xml
        emf = Persistence.createEntityManagerFactory("ProductPU");
    }

    @Override
    public void save(Product product) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(product); // persist() is used to save a new entity
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public void deleteProductById(int id) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Product productToDelete = em.find(Product.class, id);
        if (productToDelete != null) {
            em.remove(productToDelete); // remove() deletes the entity
        }
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public Product update(Product product) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        // merge() is used to update an existing entity
        Product updatedProduct = em.merge(product);
        em.getTransaction().commit();
        em.close();
        return updatedProduct;
    }

    @Override
    public List<Product> getAllProducts() {
        EntityManager em = emf.createEntityManager();
        // We use JPQL (Java Persistence Query Language), which is similar to SQL
        Query query = em.createQuery("SELECT p FROM Product p");
        List<Product> products = query.getResultList();
        em.close();
        return products;
    }

    @Override
    public Product getProductById(int id) {
        EntityManager em = emf.createEntityManager();
        // find() is the simplest way to get an entity by its primary key
        Product product = em.find(Product.class, id);
        em.close();
        return product;
    }

    @Override
    public List<Product> findProductsByKeyword(String keyword) {
        EntityManager em = emf.createEntityManager();
        // Using a named parameter (:kw) to prevent SQL injection
        Query query = em.createQuery("SELECT p FROM Product p WHERE p.nom LIKE :kw");
        query.setParameter("kw", "%" + keyword + "%"); // The % are wildcards
        List<Product> products = query.getResultList();
        em.close();
        return products;
    }
}