<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h3>Product List</h3>
            </div>
            <div class="card-body">
                <!-- Search Form -->
                <form action="searchProducts" method="get" class="row g-3 mb-3">
                    <div class="col-auto">
                        <input type="text" name="keyword" class="form-control" placeholder="Search by name..." value="<c:out value='${keyword}'/>">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>

                <!-- Add Product Button -->
                <a href="addProduct" class="btn btn-success mb-3">Add New Product</a>

                <!-- Products Table -->
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${productList}" var="p">
                            <tr>
                                <td><c:out value="${p.id}" /></td>
                                <td><c:out value="${p.nom}" /></td>
                                <td><c:out value="${p.prix}" /></td>
                                <td><c:out value="${p.quantite}" /></td>
                                <td>
                                    <a href="<c:url value='/editProduct?id=${p.id}'/>" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="<c:url value='/deleteProduct?id=${p.id}'/>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>