<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <title>Car Cleaning App User Login</title>
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

	<div id="registeration">
        <form class="inner" action="/adminregister" method="post">
            <span id="email_error">
            <c:if test="${not empty email_error}">
	               <div style="color: red;">${email_error}</div>
	            </c:if></span>
            <h2>Create New Admin</h2>

            <h4>Admin Name : </h4>
            <input type="text" class="user" name="username" placeholder="Enter User Name" required>

            <h4>Email : </h4>
            <input type="email" class="email" name="email" placeholder="Enter Email Address" required>
            
            <h4>Contact : </h4>
            <input type="number" class="number" name="number" placeholder="Enter Your Number" required>

            <h4> Password : </h4>
            <div>
                <input type="password" id="password" class="pass" name="password" placeholder="Enter Password" required>
                <input type="checkbox" id="showPassword" class="checkbox">
            </div>

            <button type="submit">Create New Admin</button>

            <a id="register" href="/admin"> Account already Created</a>
        </form>
    </div>
    
    <script>
		        const passwordField = document.getElementById("password");
		        const showPasswordCheckbox = document.getElementById("showPassword");
		
		        showPasswordCheckbox.addEventListener("change", function() {
		            if (showPasswordCheckbox.checked) {
		                passwordField.type = "text";
		            } else {
		                passwordField.type = "password";
		            }
		        });
		    </script>
    
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
                <a href="About.html">About</a>
                <a href="Contact.html">Contact</a>
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
