<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp">
    <jsp:param name="title" value="Product Dashboard" />
</jsp:include>

<div class="page-header">
    <h1>Products</h1>
    <a href="<c:url value='/addProduct'/>" class="btn btn-primary"><i class="fa-solid fa-plus me-2"></i>Add New Product</a>
</div>

<c:if test="${not empty sessionScope.successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fa-solid fa-check-circle"></i> ${sessionScope.successMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <c:remove var="successMessage" scope="session" />
</c:if>

<div class="table-card">
    <form action="searchProducts" method="get" class="row g-2 mb-4">
        <div class="col-md-4">
            <input type="text" name="keyword" class="form-control" placeholder="Search products..." value="<c:out value='${keyword}'/>">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-secondary"><i class="fa-solid fa-search"></i></button>
        </div>
    </form>

    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th class="text-center">Quantity</th> <%-- Header changed back to Quantity --%>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- varStatus="loop" is added to get the index of the current item --%>
                <c:forEach items="${productList}" var="p" varStatus="loop">
                    <%-- The inline style calculates a cascading animation delay for every row --%>
                    <tr style="animation-delay: ${loop.index * 0.05}s;">
                        <td>#<c:out value="${p.id}" /></td>
                        <td><strong><c:out value="${p.nom}" /></strong></td>
                        <td>$<c:out value="${p.prix}" /></td>
                        <td class="text-center"><c:out value="${p.quantite}" /></td> <%-- Status logic removed, now shows the quantity --%>
                        <td class="text-end">
                            <a href="<c:url value='/editProduct?id=${p.id}'/>" class="btn btn-sm btn-icon text-secondary" title="Edit"><i class="fa-solid fa-pencil-alt fa-lg"></i></a>
                            <a href="<c:url value='/deleteProduct?id=${p.id}'/>" class="btn btn-sm btn-icon text-danger" title="Delete" onclick="return confirm('Are you sure?')"><i class="fa-solid fa-trash-alt fa-lg"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp" />