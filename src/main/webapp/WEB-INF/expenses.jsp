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
<title>Save Travels</title>
</head>
<body>

<div class="container mt-5">

<h1 style="color:tomato;">Save Travels</h1>

<table class="table table-success table-striped">
  <thead>
    <tr>
      <th>Expense</th>
      <th>Vendor</th>
      <th>Amount</th>
      <th colspan="2">Actions</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="eachTravel" items="${travelList}">
  <tr>
      <td><a href="/travels/${eachTravel.id }"> <c:out value="${eachTravel.name}" /></a> </td>
      <td><c:out value="${eachTravel.vendor}" /></td>
      <td><c:out value="${eachTravel.amount}" /></td>
      <td><a href="/travels/edit/${eachTravel.id }">Edit</a> </td>
      <td>
	      <form action="/travels/${eachTravel.id }" method="Post">
		      <input type="hidden" name="_method" value="delete"/>
		      <button type="submit">Delete</button>
		           
	      
	      </form>
       </td>
  </tr>
  </c:forEach>
    
  </tbody>
</table>

</div>

<p></p>



<div class="container ">

<h2 style="color:tomato;">Add an expense: </h2>

<form:form action="/travels"  method="post" modelAttribute="newTravel" class="form">
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
<form:input type="number" path="amount" class="form-control mt-0"/>
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