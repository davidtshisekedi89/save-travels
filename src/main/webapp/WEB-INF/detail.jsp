<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> 
<meta charset="ISO-8859-1">
<title>Detail</title>
</head>
<body>
<div class="container mt-5">
<a href="/travels">Go back</a>
  <h1>Expense Details</h1>
	<p>Expense Name:<c:out value="${oneTravel.name }"></c:out></p>
	<p>Expense Description:<c:out value="${oneTravel.description }"></c:out></p>
	<p>Vendor:<c:out value="${oneTravel.vendor }"></c:out></p>
	<p>Amount Spent:<c:out value="${oneTravel.amount }"></c:out></p>
</div>
	
</body>
</html>