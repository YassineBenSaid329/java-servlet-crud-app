<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h3>Edit Product Information</h3>
            </div>
            <div class="card-body">
                <form action="updateProduct" method="post">
                    <!-- IMPORTANT: Hidden field to send the product ID -->
                    <input type="hidden" name="id" value="<c:out value='${product.id}'/>">

                    <div class="mb-3">
                        <label for="nom" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="nom" name="nom" value="<c:out value='${product.nom}'/>" required>
                    </div>
                    <div class="mb-3">
                        <label for="prix" class="form-label">Price</label>
                        <input type="number" step="0.01" class="form-control" id="prix" name="prix" value="<c:out value='${product.prix}'/>" required>
                    </div>
                    <div class="mb-3">
                        <label for="quantite" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="quantite" name="quantite" value="<c:out value='${product.quantite}'/>" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Product</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>