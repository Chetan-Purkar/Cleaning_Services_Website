<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/manageservice.css' />">
</head>
<body>
    <h2>Products</h2>
    <a href="products/add">Add Product</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>image</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <th><img class="image" alt="${product.name}" src="/images/${product.imageUrl}"></th>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.discount}</td>
                <td>
                    <a href="products/edit/${product.id}">Edit</a>
                    <a href="products/delete/${product.id}" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
