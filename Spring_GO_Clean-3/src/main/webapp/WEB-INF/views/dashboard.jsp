<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css' />">
     <link rel="stylesheet" type="text/css" href="<c:url value='/css/manageservice.css' />">
</head>
<body>

    <!-- Top Navbar -->
    <div class="navbar">
        <div class="navbar-brand">
            <h1>Admin Dashboard</h1>
        </div>
        <div class="navbar-links">
          <div>
            <a href="#">Profile</a>
          </div>
          <div>
            <a href="#">Notifications</a>
          </div>
        </div>
    </div>

    <!-- Main Container -->
    <div class="dashboard-container">
        <!-- Left Sidebar/Menu -->
        <div class="sidebar">
            <ul>
                <li><a href="#" onclick="showContent('dashboard')">Dashboard</a></li>
                <li><a href="#" onclick="showContent('users')">Users</a></li>
                <li><a href="#" onclick="showContent('orders')">Orders</a></li>
                <li><a href="#" onclick="showContent('products')">Products</a></li>
                <li><a href="#" onclick="showContent('settings')">Settings</a></li>
                <li><a href="#" onclick="showContent('reports')">Reports</a></li>
            </ul>
        </div>
        
        
        
        <!-- Right Content Area -->
        <div class="content">
            <div id="dashboard" class="content-section">
               <div id="profile">
	            <c:choose>
	              <c:when test="${not empty sessionScope.admin}">
	                <h4>Welcome, ${sessionScope.admin.username}!</h4>
	                <a href="/logout">Logout</a>
	              </c:when>
	              <c:otherwise>
	                <a href="${pageContext.request.contextPath}/admin">admin Login</a>
	              </c:otherwise>
	            </c:choose>
	          </div>
            </div>

            <div id="users" class="content-section" style="display: none;">
                <h2>All Users</h2>
			    <table border="1">
			        <tr>
			            <th>ID</th>
			            <th>Username</th>
			            <th>Email</th>
			            <th>Number</th>
			            <th>Total Orders</th>
			        </tr>
			        <c:forEach var="user" items="${users}">
			            <tr>
			                <td>${user.id}</td>
			                <td>${user.username}</td>
			                <td>${user.email}</td>
			                <td>${user.number}</td>
			                <td>${user.orders.size()}</td>
			            </tr>
			        </c:forEach>
			    </table>
            </div>


            <div id="orders" class="content-section" style="display: none;">
			    <div>
			        <!-- Filter Form -->
			        <form method="get" action="/dashboard">
			            <label for="status">Filter by Booking Status:</label>
			            <select id="status" name="status">
			                <option value="" ${status == '' || status == null || status == 'all' ? 'selected' : ''}>All</option>
			                <option value="completed" ${status == 'completed' ? 'selected' : ''}>Completed</option>
			                <option value="pending" ${status == 'pending' ? 'selected' : ''}>Pending</option>
			                <option value="In Progress" ${status == 'In Progress' ? 'selected' : ''}>In Progress</option>
			            </select>
			            <button type="submit">Apply Filters</button>
			        </form>
			
			        <!-- Display User Info and Bookings -->
			        <c:forEach var="user" items="${users}">
			            <div class="info">
			                <div class="user-info">
			                    <h2>Name: ${user.username}</h2>
			                    <p><strong>Email:</strong> ${user.email}</p>
			                    <p><strong>Contact Number:</strong> ${user.number}</p>
			                </div>
			
			                <div class="bookings">
			                    <h2>${user.username}'s Bookings</h2>
			                    <table>
			                        <thead>
			                            <tr>
			                                <th>Booking ID</th>
			                                <th>Service Name</th>
			                                <th>Booking Date</th>
			                                <th>Location</th>
			                                <th>Price</th>
			                                <th>Status</th>
			                                <th>Actions</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <c:forEach var="order" items="${user.orders}">
			                                <tr>
			                                    <td>${order.id}</td>
			                                    <td>${order.productName}</td>
			                                    <td>${order.orderDateTime}</td>
			                                    <td>${order.dist}, ${order.city}, ${order.localadderss}, (${order.pin})</td>
			                                    <td>${order.discountedPrice }
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
			                                    <td>
			                                        <a href="/dashboard?action=updateBookingStatus&orderId=${order.id}&newStatus=completed">Mark as Completed</a> |
			                                        <a href="/dashboard?action=updateBookingStatus&orderId=${order.id}&newStatus=pending">Booking Accepted</a>
			                                    </td>
			                                </tr>
			                            </c:forEach>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			            <hr/>
			        </c:forEach>
			    </div>
			</div>
			
			<div id="products" class="content-section" style="display: none;">
			    <h2>Products</h2>
			    <a href="products/add">Add Product</a>
			    <table border="1">
			        <tr>
			            <th>ID</th>
			            <th>Image</th>
			            <th>Name</th>
			            <th>Description</th>
			            <th>Price</th>
			            <th>Discount</th>
			            <th>Actions</th>
			        </tr>
			        <c:forEach var="product" items="${products}">
			            <tr>
			                <td>${product.id}</td>
			                <td><img class="image" alt="${product.name}" src="/images/${product.imageUrl}"></td>
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
			</div>


            <div id="settings" class="content-section" style="display: none;">
                <h2>Settings</h2>
                <p>Update your account and system settings here.</p>
            </div>
            
            
            <div id="reports" class="content-section">
			    <div>
			        <h1>Order Reports</h1>
			
			        <h2>Selected Date Summary</h2>
			        <p>Day: <c:out value="${selectedDay != null ? selectedDay : 'N/A'}" /></p>
			        <p>Month: <c:out value="${selectedMonth}" /></p>
			        <p>Year: <c:out value="${selectedYear}" /></p>
			
			        <h3>Order Counts</h3>
			        <ul>
			            <li>Orders on Selected Day: <c:out value="${dayCount}" /></li>
			            <li>Orders in Selected Month: <c:out value="${monthCount}" /></li>
			            <li>Orders in Selected Year: <c:out value="${yearCount}" /></li>
			            <li>Total Orders: <c:out value="${totalOrderCount}" /></li>
			        </ul>
			
			        <form action="/dashboard/reports" method="get">
			            <!-- Day Selection -->
			            <label for="day">Day:</label>
			            <select name="day" id="day">
			                <c:forEach var="i" begin="1" end="31">
			                    <option value="${i}" <c:if test="${i == selectedDay}">selected</c:if>>${i}</option>
			                </c:forEach>
			            </select>
			
			            <!-- Month Selection -->
			            <label for="month">Month:</label>
			            <select name="month" id="month">
			                <c:forEach var="i" begin="1" end="12">
			                    <option value="${i}" <c:if test="${i == selectedMonth}">selected</c:if>>${i}</option>
			                </c:forEach>
			            </select>
			
			            <!-- Year Selection -->
			            <label for="year">Year:</label>
			            <select name="year" id="year">
			                <c:forEach var="i" begin="2020" end="2030">
			                    <option value="${i}" <c:if test="${i == selectedYear}">selected</c:if>>${i}</option>
			                </c:forEach>
			            </select>
			
			            <button type="submit">Show Orders</button>
			        </form>
			        <c:if test="${not empty orders}">
		        <h2>Orders for ${day}-${month}-${year}</h2>
		        <table>
		            <thead>
		                <tr>
		                    <th>ID</th>
		                    <th>Product Name</th>
		                    <th>Price</th>
		                    <th>Quantity</th>
		                    <th>Status</th>
		                    <th>Order Date</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="order" items="${orders}">
		                    <tr>
		                        <td>${order.id}</td>
		                        <td>${order.productName}</td>
		                        <td>${order.productPrice}</td>
		                        <td>${order.quantity}</td>
		                        <td>${order.status}</td>
		                        <td>${order.orderDateTime}</td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		    </c:if>
			    </div>
			    
			</div>
            
		
		    
            </div>
            
            <script>
		        function showOrders() {
		            const day = document.getElementById("day").value;
		            const month = document.getElementById("month").value;
		            const year = document.getElementById("year").value;
		
		            if (day && month && year) {
		                window.location.href = `//dashboard?day=${day}&month=${month}&year=${year}`;
		            } else {
		                alert("Please select day, month, and year.");
		            }
		        }
		        
		        function showOrders() {
				    const reportsSection = document.getElementById("reports");
				    reportsSection.style.display = "block";
				}
						        
		    </script>
        </div>
    </div>

    <script>
     function showContent(sectionId) {
	    // Hide all content sections
	    const sections = document.getElementsByClassName('content-section');
	    for (let i = 0; i < sections.length; i++) {
	        sections[i].style.display = 'none';
	    }
	
	    // Show the selected section
	    const selectedSection = document.getElementById(sectionId);
	    if (selectedSection) {
	        selectedSection.style.display = 'block';
	    }
	
	    // Optional: Store the selected section in local storage to persist the state on page refresh
	    localStorage.setItem('selectedSection', sectionId);
	}
	
	// Optional: Load the last selected section from local storage on page load
	window.onload = function() {
	    const savedSection = localStorage.getItem('selectedSection');
	    if (savedSection) {
	        showContent(savedSection);
	    } else {
	        showContent('dashboard'); // Default to the dashboard if no section is saved
	    }
	}


    </script>
</body>
</html>
