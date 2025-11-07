<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h3>Add a New Product</h3>
            </div>
            <div class="card-body">
                <form action="saveProduct" method="post">
                    <div class="mb-3">
                        <label for="nom" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="nom" name="nom" required>
                    </div>
                    <div class="mb-3">
                        <label for="prix" class="form-label">Price</label>
                        <input type="number" step="0.01" class="form-control" id="prix" name="prix" required>
                    </div>
                    <div class="mb-3">
                        <label for="quantite" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="quantite" name="quantite" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Product</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>