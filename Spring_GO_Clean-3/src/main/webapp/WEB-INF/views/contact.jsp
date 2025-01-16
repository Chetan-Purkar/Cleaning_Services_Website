<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/booking.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/contact.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <title>Car Cleaning App-contact</title>
    <link rel="icon" type="imges/png" href="images/logo2.png"/>
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
			        <a href="#" onclick="return confirmLogout();">Logout</a>
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

	
	 <div class="container">
        <h2>Contact Us</h2>
        <form action="contactinfo" method="get">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="contactname" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="contactemail" required>
            </div>
            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" required></textarea>
            </div>
            <div class="form-group">
                <button type="submit">Submit</button>
            </div>
        </form>
        
        <div class="contact-info">
            <p>If you have any questions, feel free to reach out to us directly:</p>
            <p>Email: <a href="mailto:chetanpurkar8@gmail.com">chetanpurkar8@gmail.com</a></p>
            <p>Phone: 8390952029</p>
            <p>Address: Sangamnear</p>
        </div>
    </div>
	
</body>
</html>