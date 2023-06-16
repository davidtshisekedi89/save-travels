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
<title>Edit</title>
</head>
<body>

<div class="container mt-5 ">

<h2 style="color:tomato;">Edit expense: </h2>
<a href="/travels">Go back</a>

<form:form action="/travels/edit/${oneTravel.id }"  method="put" modelAttribute="oneTravel" class="form">
<p>
<form:label path="name">Expense Name: </form:label>
<form:input type="text" path="name" class="form-control"/>
<form:errors path="name"/>
</p>

<p>
<form:label path="vendor">Vendor: </form:label>
<form:input type="text" path="vendor" class="form-control"/>
<form:errors path="vendor"/>
</p>

<p>
<form:label path="amount">Amount: </form:label>
<form:input type="number" path="amount" class="form-control"/>
<form:errors path="amount"/>
</p>

<p>
<form:label path="description">Description: </form:label>
<form:textarea path="description" class="form-control"></form:textarea>
<form:errors path="description"/>
</p>

<button class="btn btn-success" type="submit">Submit</button>

</form:form>
</div>


</body>
</html>

</body>
</html>