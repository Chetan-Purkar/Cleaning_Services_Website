<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/booking.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <title>Car Cleaning App</title>
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

	<div id="discription">
        <div id="discmain">
            <div class="discmain">
                <h2 id="MainTitle">${product.name}</h2>
                <a href="/index"><img id="discClose" src="./Icone/xbutton.png" alt="close"></a>
                <span class="tooltiptext">Close</span>
                <img src="/images/${product.imageUrl}" alt="${product.name}">
            </div>
            <div class="discmain2">
                <h4 id="disc">${product.description}</h4>
            </div>
        </div>
       <div id="bookprice">
	        <span><h4 id="serviceprice">Price per 100 sq. ft: ₹${product.price}</h4></span>
	        <span><span class="diwali">Diwali Offer</span><h4 id="offers">Offer: ${product.discount}%</h4></span>
	        <span><h4 id="Price">Discounted Price per 100 sq. ft: <span id="discountedPriceDisplay"></span></h4></span> <!-- No more server-side formatting here -->
	    </div>
	    <div>
	        <form id="bookingForm" action="/book" method="post">
	            <input type="hidden" name="productName" value="${product.name}">
	            <input type="hidden" name="productImage" value="${product.imageUrl}">
	            <input type="hidden" name="productDescription" value="${product.description}">
	            <input type="hidden" name="productPrice" value="${product.price}">
	            <input type="hidden" name="productDiscount" value="${product.discount}">
	            <input type="hidden" id="discountedPrice" name="discountedPrice" value=""> <!-- Value to be updated by JavaScript -->
	            <input type="hidden" name="quantity" value="1">
	            <input type="hidden" name="status" value="In Progress">
	            <div id="userinfo">
	                <label>Sq / Liter</label>
	                <input type="number" id="bsize" name="bsize" placeholder="Enter Square foot" oninput="calculateTotalPrice()" required>
	                <label>District: </label>
	                <input type="text" name="dist" class="Address" placeholder="Enter District" required>
	                <label>City: </label>
	                <input type="text" name="city" class="Address" placeholder="Enter City" required>
	                <label>PIN: </label>
	                <input type="number" name="pin" class="Address" placeholder="Enter City PIN" required>
	                <label>Local Address, House Number, Near By: </label>
	                <input type="text" id="LAddress" name="localaddress" class="Address" placeholder="Enter Address" required><br>
	            </div>
	            <button type="submit" id="Booking" onclick="return confirmBooking('${product.name}')">Book Now</button>
	            <a href="/index" id="">Other Services</a>
	        </form>
	    </div>
	
	    <script>
	        // Use JavaScript to calculate and format prices
	        const pricePer100SqFt = ${product.price}; // Price per 100 sq. ft
	        const discount = ${product.discount}; // Discount percentage
	
	        // Calculate the discounted price per 100 sq. ft
	        const discountedPricePer100SqFt = pricePer100SqFt - (pricePer100SqFt * (discount / 100));
	
	        // Update the displayed discounted price for 100 sq. ft
	        document.getElementById('discountedPriceDisplay').innerText = discountedPricePer100SqFt.toFixed(2); // JavaScript formatting
	
	        function calculateTotalPrice() {
	            const bsize = document.getElementById('bsize').value; // User input square foot
	
	            // Calculate total price based on the square foot entered
	            const totalPrice = (bsize / 100) * discountedPricePer100SqFt; // Total price considering user input
	
	            // Update the hidden input and displayed price
	            document.getElementById('discountedPrice').value = totalPrice.toFixed(2); // Set the value in the form for submission
	            document.getElementById('discountedPriceDisplay').innerText = totalPrice.toFixed(2); // Display updated total price
	        }
	
	        function confirmBooking(productName) {
	            return confirm(`Are you sure you want to book the service for ${productName}?`);
	        }
	    </script>

	</div>
	
	

    
    <footer>
        <div id="foot">
            <div>
                <img src="./images/logo.png" alt="logo">
            </div>
            <div class="footer">
                <span class="Location" onclick="openInMaps()" >Location : Sangamner (423402)</span>
                <span> Contect : <span class="Contact1"> 8605842021</span><span class="Contact1">8390852029 </span></span>
                <span> Email id : deshprashant210@gmail.com</span>
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