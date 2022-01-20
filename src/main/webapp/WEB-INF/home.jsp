<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div>	
		<div style="text-align:center; width:75%; margin-top:10px;margin-left:100px;border:solid"class="cantainer mt-4">
			<h1>Welcome, ${name}</h1>
			<p>Books from everyone's shelves:</p>
			<p><a href="/logout">Logout</a>
			<p><a href="/newBook">Add a book to my shelf</a>
			<table class="table table-striped">
				<thead>
					<tr>
						<td>ID</td>
						<td>Title</td>
						<td>Author Name</td>
						<td>Posted By</td>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="book" items="${books}">
					<tr>
						<%-- <td>${expense.id}</td> --%>
						<td><c:out value="${book.id}"></c:out></td>
						<td><a href="/oneBook/${book.id}"><c:out value="${book.title}"></c:out></a></td>
						<td><c:out value="${book.author}"></c:out></td>
						<td><c:out value="${book.user.firstName} ${book.user.lastName}"></c:out></td>
						<td style="display:flex;">
                            <form action="/editBook/${book.id}"><button type="submit" class="btndash">Edit</button></form>
                            <form action="/delete/${book.id}" method="post"><input type="hidden" name="_method" value="delete" class="btndash"/><input type="submit" value="Delete"/></form>
                        </td>
					</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
