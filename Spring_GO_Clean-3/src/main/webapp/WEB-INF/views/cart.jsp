<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta ch Rs et="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/cart.css' />">
    <title>Car Cleaning My Bookings</title>
    <link rel="icon" type="images/png" href="images/logo2.png"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Script.js"></script>
</head>
<body>
<nav>
        <div id="logo">
            <img src="./images/logo2.png" alt="1">
        </div>
        <div id="title">
            <h4>Go Cleaning Services Pvt. Ltd.</h4>
        </div>
        <div id="Home">
            <a href="/index">Home</a>
        </div>
        <div class="user">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
			        <h4>Welcome, ${sessionScope.user.username}!</h4>
			        <a href="${pageContext.request.contextPath}/logout">Logout</a>
			    </c:when>
			    <c:otherwise>
		            <a href="${pageContext.request.contextPath}/login">Login</a>
		        </c:otherwise>
		    </c:choose>
        </div>
        <div>
            <a href="/cart" id="cart"><img  src="Icone/shopping-cart.png" alt="cart"></a>
        </div>
    </nav>
    
    <div id="cartmain">
    <h1>My Service Bookings</h1>
    <table>
        <thead>
            <tr>
            	<th>id</th>
                <th>Services Name</th>
                <th>Date / Time</th>
                <th>Price</th>
                <th>Discount</th>
                <th>Discounted Price</th>
                <th>Quantity</th>
                <th>Status</th>
                <th> <span></span>Payment</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${order}" var="order">
                <tr>
                	<td> <img src="/images/${order.productImage}"/></td>
                    <td>${order.productName}</td>
                    <td>${order.orderDateTime}</td>
                    <td>${order.productPrice}</td>
                    <td>${order.productDiscount}</td>
                    <td>${order.discountedPrice}</td>
                    <td>${order.quantity}</td>
                    
					<td>
                        <c:choose>
                            <c:when test="${order.status == 'completed'}">
                                <span class="status-completed">Completed</span>
                            </c:when>
                            <c:when test="${order.status == 'pending'}">
                                <span class="status-pending">Pending...</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-progress">In Progress</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <!-- Show the "Remove" button only if the status is "In Progress" -->
                    <td>
					    <c:choose>
					        <c:when test="${order.status == 'completed'}">
					            <form action="/pay" method="post">
					                <input type="hidden" name="price" value="${order.discountedPrice}">
					                <button type="submit">Proceed to Pay</button>
					            </form>
					        </c:when>
					        
					        <c:when test="${order.status == 'pending'}">
					            <form action="${pageContext.request.contextPath}/removeOrder" method="post" onsubmit="return confirmRemove();">
					                <input type="hidden" name="orderId" value="${order.id}">
					                <button type="submit">Cancel Booking</button>
					            </form>
					        </c:when>
					    
					        <c:otherwise>
					           <p>Working</p>
					        </c:otherwise>
					        
					    </c:choose>
					</td>
       
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    <script>
	function confirmRemove() {
	    return confirm("Are you sure you want to remove this Service?");
	}
	</script>
    
    
</body>
</html>