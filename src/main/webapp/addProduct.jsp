<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp">
    <jsp:param name="title" value="Add New Product" />
</jsp:include>

<!-- The py-5 class is added here to create vertical padding -->
<div class="row justify-content-center py-5">
    <div class="col-md-8 col-lg-7">
        <div class="card">
            <div class="card-header">
                <h3 class="mb-0">Add a New Product</h3>
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
                    <div class="d-flex justify-content-end mt-4">
                        <a href="<c:url value='/listProducts'/>" class="btn btn-secondary me-2">Cancel</a>
                        <button type="submit" class="btn btn-primary">Save Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />