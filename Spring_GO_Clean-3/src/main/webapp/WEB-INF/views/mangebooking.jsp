<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <title>Car Cleaning App-Dashboard</title>
    <link rel="icon" type="images/png" href="images/logo2.png"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Script.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
    
</head>
<body>

<div class="dashboard">
    <!-- Filter Form -->
    <form method="get" action="mangebooking">
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
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${user.orders}">
                            <c:if test="${status == null || order.status == status}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.productName}</td>
                                    <td>${order.orderDateTime}</td>
                                    <td>${order.dist},${order.city},${order.localadderss},(${order.pin})</td>
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
                                        <a href="/updateBookingStatus?id=${order.id}&status=completed">Mark as Completed</a>|<br> <br>
                                        <a href="/updateBookingStatus?id=${order.id}&status=pending">Booking Accepted</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <hr/> <!-- Add a line to separate each user's section for clarity -->
    </c:forEach>
</div>



</body>
</html>