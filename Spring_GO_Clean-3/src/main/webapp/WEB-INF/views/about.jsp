<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta ch Rs et="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
     <link rel="stylesheet" type="text/css" href="<c:url value='/css/about.css' />">
    <title>Car Cleaning App </title>
    <link rel="icon" type="images/png" href="images/logo2.png"/>
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
			        <%-- <a href="${pageContext.request.contextPath}/logout">Logout</a> --%>
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
        <h1>About Us</h1>
        <p>Welcome to The Cleaning Services Pvt. Ltd., your trusted partner in maintaining a clean and hygienic environment. With years of experience in the cleaning industry, we offer a wide range of services that cater to both residential and commercial needs. Our team of trained professionals is dedicated to delivering the highest standards of cleanliness, ensuring that your home or office remains spotless and inviting.</p>
        
        <p>At The Cleaning Services Pvt. Ltd., we take pride in using eco-friendly products that are safe for your family, pets, and the environment. Our services include home cleaning, office cleaning, carpet and upholstery cleaning, kitchen deep cleaning, and much more. Whether you need a one-time service or regular cleaning, we are here to make your space shine.</p>
        
        <p>We believe in building long-term relationships with our clients, providing personalized service that meets your unique needs. Let us handle the cleaning so you can focus on what matters most. Experience the difference with The Cleaning Services Pvt. Ltd. today!</p>
    </div>
    
    <footer>
        <div id="foot">
            <div>
                <img src="./images/logo.png" alt="logo">
            </div>
            <div class="footer">
                <span class="Location" onclick="openInMaps()" >Location : Sangamner (423402)</span>
                <span> Contect : <span class="Contact1"> 8390852029</span><span class="Contact1">8390852029 </span></span>
                <span> Email id : chetanpurkar8@gmail.com</span>
                <span> Email id : chetanpurkar8@gmail.com</span>
            </div>
            <div class="footer">
                <a href="/index">Home</a>
                <a href="/about">About</a>
                <a href="/contact">Contact</a>
            </div>
            <div class="footer">
                <a href="#">Terms of Service</a>
                <a href="#">Help</a>
                <a class="lasttitle" href="/index">&copyCopyright Go Clean Pvt. Ltd. in.</a>
            </div>
        </div>
    </footer>
</body>
</html>