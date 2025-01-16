<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>User Information</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/Navigation.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/userinfo.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
    <title>Car Cleaning App User Login</title>
    <link rel="icon" type="images/png" href="images/logo2.png"/>
</head>
<body>
	<form action="/UserInfo" method="post">
    <div id="userdetails">
        <fieldset>
            <legend><h1 class="head">User Information </h1></legend>
   
        <lable for="FullName">Enter Full Name  : </lable>
        <input type="text" name="fullname" id="FullName" placeholder="Enter Full Name" required>

        <lable for="Number">Contact Number : </lable>
        <input type="number" name="number" id="Number" placeholder="Enter Contact Number" required>

        <div id="gender">
            <lable for="gender">Gender  : </lable>
            <input type="radio" name="gender" class="info" value="male" required>male
            <input type="radio" name="gender" class="info" value="female" required>female
        </div>


        <h2 for="Address">Address</h2>
            
        <label for="district">District:</label>
        <input type="text" name="dist" class="Address" placeholder="Enter District" required>

        <lable>City</lable>
        <input type="text" name="city" class="Address" placeholder="Enter City" required>
        
        <lable>PIN</lable>
        <input type="number" name="pin" class="Address" placeholder="Enter City PIN" required>

        <lable>Local Adderss, House Number, Near By,</lable>
        <input type="text" name="localadderss" class="Address" placeholder="Enter Adderss " required>

        <div id="checkbox">
            <input type="checkbox" name="check" class="info" id="information" >
        </div>
         <lable> All information write:</lable>
        <div id="button">
            <button> submit</button>
        </div>
        </fieldset>
    </div>
    </form>

</body>
</html>