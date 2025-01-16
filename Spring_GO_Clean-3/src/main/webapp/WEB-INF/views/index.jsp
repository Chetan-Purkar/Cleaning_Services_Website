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
    <nav>
        <div id="logo">
            <img src="./images/logo2.png" alt="1">
        </div>
        <div id="title">
            <h4>The Cleaning Services Pvt. Ltd.</h4>
        </div>
        <div id="Home">
            <a href="/index">Home</a>
        </div>
        <div id="about" >
       		<a href="/about">About Us</a>
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

   
    
    <div id="main">
        <div id="intro">
            <div class="head">
                <h1>PURKAR CHETAN</h1>
                <p>&</p>
                <h1>DESHMUKH PRASHANT</h1>
                <span>Location:</span>
                <h2 class="Location" onclick="redirectToLocation()">Sangamner (422605)</h2>
                <span>Contact:</span>
				
	                <div class="options" id="OptionsContact1">
	                	<h3 id="Contact1">8390952029</h3>
	                    <a href="tel:8390952029">Call</a>
	                    <a href="https://wa.me/8390952029" target="_blank">WhatsApp</a>
	                </div>
	            
	                <div class="options" id="OptionsContact2">
	                	<h3 id="Contact2">8605842021</h3>
	                    <a href="tel:8605842021">Call</a>
	                    <a href="https://wa.me/8605842021" target="_blank">WhatsApp</a>
	                </div>
               
                
                <span>Email id :</span> 
                <h3 class="Email">chetanpurkar8@gmail.com</h3>
                <h3 class="Email">deshprashant210@gmail.com</h3>
                
            </div>
            <div class="img">
                <img src="./images/car.png" alt="2">
            </div>
        </div>    

        <div id="book">
            <h2>Special Service</h2>
            <p>Car Service</p>
        </div>
            
       	<div id="offer">
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numbertext">1 / 3</div>
                    <img class="offimage" id="13" src="./images/car.png" style="width:100%">
                    <div class="text">Full Car Wash</div>
                </div>
            
                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img class="offimage" id="14" src="./images/Car SPA.png" style="width:100%" height="400px">
                    <div class="text">Interior Wash</div>
                </div>
            
                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img class="offimage" id="15" src="./images/Car SPA.png" width="100%" height="80%">
                    <div class="text">Car SPA</div>
                </div>
            </div>
            <br>
            
            <div class="doted" >
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
        </div>
        <script>
        	let slideIndex = 0;
			showSlides();
			
			function showSlides() {
			    let i;
			    let slides = document.getElementsByClassName("mySlides");
			    let dots = document.getElementsByClassName("dot");
			    for (i = 0; i < slides.length; i++) {
			        slides[i].style.display = "none";  
			    }
			    slideIndex++;
			    if (slideIndex > slides.length) {slideIndex = 1}    
			    for (i = 0; i < dots.length; i++) {
			        dots[i].className = dots[i].className.replace(" active", "");
			    }
			    slides[slideIndex-1].style.display = "block";  
			    dots[slideIndex-1].className += " active";
			    setTimeout(showSlides, 2000); // Change image every 2 seconds
			}
        	
        </script>

	 	<div class="container">
	        <div class="category-container">
	        <h1>Categories</h1><br>
	            <c:forEach items="${categories}" var="category">
	                <div class="category-card" onclick="showProducts(${category.id})">
	                    <p>${category.catename}</p>
	                </div>
	            </c:forEach>
	        </div>
			<div id="product-list" class="product-list">
			<h1>Services</h1>
	            <c:forEach items="${products}" var="product">
	                <div class="product-item" data-category-id="${product.category.id}">
	                	<a href="/booking/${product.id}">
	                    <h3>${product.name}</h3>
	                    <p>${product.description}</p>
	                    <p >Price: ${product.price} Per 100sqft </p>
	                    <div class="offer"><spam class="diwali">Diwali Offer</spam><spam>Discount: ${product.discount}%</spam></div>
						<p>Discounted Price: ${product.price - (product.price * (product.discount / 100))}</p>
	                    <img src="/images/${product.imageUrl}" alt="${product.name}">
	                    </a>
	                </div>
	            </c:forEach>
	        </div>
    	</div>
		
		
		
		
        <div id="service">
        <h2>All Services</h2>
	        <section class="conteniar" id="section">
	            <c:forEach var="product" items="${products}">
	                <a href="/booking/${product.id}">
	                    <div class="services">
	                        <img src="/images/${product.imageUrl}" class="img" alt="${product.name}">
	                        <h4 class="title">${product.name}</h4>
	                    </div>
	                </a>
	            </c:forEach>
	        </section>
	    </div> 

        <div id="stats">
            <h2>Stats</h2>
            <div class="conteniar">
                <div class="staters">
                    <img src="./images/serives.png" alt="Service">
                    <p>10+</p>
                    <p>Services</p>
                </div>
                <div class="staters">
                    <img src="./images/booking.png" alt="Bookings">
                    <p>2000+</p>
                    <p>Bookings</p>
                </div>
                <div class="staters">
                    <img src="./images/custmer.png" alt="Customer">
                    <p>4000+</p>
                    <p>Customer</p>
                </div>
            </div>
        </div>

        <div id="about">
			   <h2>About Us</h2>
               <div class="container">
			        
			        <div class="section">
			            <h3>Welcome to- Go Clean Private Limited!</h3>
			            <p>We are passionate about exploring the intersections of technology, philosophy, and web development. Our journey began with a fascination for creating and managing databases for personal projects, which naturally led us to delve deeper into the world of web development and application design.
						<a href="/about" >more</a></p>
			        </div>
            </div>
        </div>
    </div>
    
   

    
    
    <footer>
        <div id="foot">
            <div>
                <img src="./images/logo.png" alt="logo">
            </div>
            <div class="footer">
                <span class="Location" onclick="openInMaps()" >Location : Sangamner (423402)</span>
                <span> Contect : <span class="Contact1"> 8390852029</span><span class="Contact1">8390852029 </span></span>
                <h3 class="Email">chetanpurkar8@gmail.com</h3>
                <h3 class="Email">deshprashant210@gmail.com</h3>
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
