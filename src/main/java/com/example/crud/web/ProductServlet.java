package com.example.crud.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.crud.dao.IProductDao;
import com.example.crud.dao.ProductDaoImpl;
import com.example.crud.entities.Product;

// Here we map the servlet to a list of specific, distinct URLs.
@WebServlet(urlPatterns = {
    "/listProducts",
    "/addProduct",
    "/saveProduct",
    "/editProduct",
    "/updateProduct",
    "/deleteProduct",
    "/searchProducts"
})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IProductDao productDao;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // We use getServletPath() to find out which URL was called.
        String path = request.getServletPath();

        switch (path) {
            case "/addProduct":
                // Show the form to add a new product.
                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
                break;
            case "/editProduct":
                showEditForm(request, response);
                break;
            case "/deleteProduct":
                deleteProduct(request, response);
                break;
            case "/searchProducts":
                 searchProducts(request, response);
                 break;
            case "/":
            case "/listProducts":
            default:
                // The default action is to list all products.
                listProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/saveProduct":
                saveProduct(request, response);
                break;
            case "/updateProduct":
                updateProduct(request, response);
                break;
            default:
                // If a POST request is sent to an unhandled URL, just show the list.
                listProducts(request, response);
                break;
        }
    }

    // --- Private Helper Methods ---

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productDao.getAllProducts();
        request.setAttribute("productList", products);
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> products = productDao.findProductsByKeyword(keyword);
        request.setAttribute("productList", products);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productDao.getProductById(id);
        request.setAttribute("product", existingProduct);
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDao.deleteProductById(id);
        request.getSession().setAttribute("successMessage", "Product was successfully deleted!");
        response.sendRedirect(request.getContextPath() + "/listProducts");
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nom = request.getParameter("nom");
        double prix = Double.parseDouble(request.getParameter("prix"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        Product newProduct = new Product(nom, prix, quantite);
        productDao.save(newProduct);
        request.getSession().setAttribute("successMessage", "Product was successfully added!");
        response.sendRedirect(request.getContextPath() + "/listProducts");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        double prix = Double.parseDouble(request.getParameter("prix"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        Product productToUpdate = new Product(nom, prix, quantite);
        productToUpdate.setId(id);
        productDao.update(productToUpdate);
        request.getSession().setAttribute("successMessage", "Product was successfully updated!");
        response.sendRedirect(request.getContextPath() + "/listProducts");
    }
}