package com.example.crud.dao;

import java.util.List;
import com.example.crud.entities.Product;

/**
 * The interface for Product Data Access Object (DAO).
 * This defines the standard operations to be performed on a Product model object.
 */
public interface IProductDao {

    /**
     * Persists a new Product entity in the database.
     * @param product The Product object to be saved.
     */
    void save(Product product);

    /**
     * Deletes a product from the database by its ID.
     * @param id The ID of the product to be deleted.
     */
    void deleteProductById(int id);

    /**
     * Updates an existing Product's information in the database.
     * @param product The Product object with updated information.
     * @return The updated Product object managed by the persistence context.
     */
    Product update(Product product);

    /**
     * Retrieves a list of all products from the database.
     * @return A List of all Product objects.
     */
    List<Product> getAllProducts();

    /**
     * Finds and retrieves a single product by its unique ID.
     * @param id The ID of the product to find.
     * @return The found Product object, or null if no product is found with that ID.
     */
    Product getProductById(int id);

    /**
     * Searches for products whose name contains a specific keyword.
     * @param keyword The string to search for within product names.
     * @return A List of Product objects that match the keyword.
     */
    List<Product> findProductsByKeyword(String keyword);
}