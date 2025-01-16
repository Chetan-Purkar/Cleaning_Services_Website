<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta ch Rs et="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <title>Car Cleaning App</title>
    <link rel="icon" type="images/png" href="images/logo2.png"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Script.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
    <h2>${product.id == null ? 'Add' : 'Edit'} Product</h2>
	   <form action="/products/save" method="post" enctype="multipart/form-data">
		    <input type="hidden" name="id" value="${product != null ? product.id : ''}" /> <!-- Handle empty ID for new products -->
		    
		    <div>
		        <label>Name:</label>
		        <input type="text" name="name" value="${product.name}" required />
		    </div>
		
		    <div>
		        <label>Description:</label>
		        <input type="text" name="description" value="${product.description}" required />
		    </div>
		
		    <div>
		        <label>Price:</label>
		        <input type="number" step="0.01" name="price" value="${product.price}" required />
		    </div>
		
		    <div>
		        <label>Discount:</label>
		        <input type="number" name="discount" value="${product.discount}" required />
		    </div>
		
		   <div>
		        <label>Category:</label>
		        <select name="categoryId" required>
		            <option value="" disabled selected>Select a category</option>
		            <c:forEach items="${categories}" var="category">
		                <option value="${category.id}" ${product != null && product.category.id == category.id ? 'selected' : ''}>${category.catename}</option>
		            </c:forEach>
		        </select>
		    </div>
		
		    <div>
		        <label>Product Image:</label>
		        <input type="file" name="image" />
		    </div>
		
		    <div>
		        <button type="submit">Save</button>
		    </div>
		</form>


    <a href="/products">Back to List</a>
</body>
</html>
