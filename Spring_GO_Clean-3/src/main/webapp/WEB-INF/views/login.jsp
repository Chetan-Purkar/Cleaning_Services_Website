<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <title>Car Cleaning App User Login</title>
    <link rel="icon" type="images/png" href="images/logo2.png"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
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
		           <%--  <a href="${pageContext.request.contextPath}/login" onclick="logout()">Login</a> --%>
		           <a href="#" onclick="return confirmLogout();">Login</a>
		        </c:otherwise>
		    </c:choose>
        </div>
        <div>
            <a href="/cart" id="cart"><img  src="Icone/shopping-cart.png" alt="cart"></a>
        </div>
    </nav>

      
    <div id="Userlogin">
        <form class="inner" action="/login" method="post">
            <span id="Error">
	            <c:if test="${not empty error}">
	               <div style="color: red;">${error}</div>
	            </c:if>
            </span>
            <h2>Login User</h2>

            <h4>User Name</h4>
            <input type="text" class="username" name="username" placeholder="Enter UserName" required>

            <h4> Password : </h4>
            <div>
                <input type="password" id="password" class="pass" name="password" placeholder="Enter Password" required>
                <input type="checkbox" id="showPassword" class="checkbox">
            </div>

            <button type="submit">Login</button>
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


            <a href="/register" id="Login"> Create New Account</a>
        </form>
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
                <a href="/About">About</a>
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
