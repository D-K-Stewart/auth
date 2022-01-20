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
   <header>
		<div class="navbar navbar-light bg-light box-shadow">
			<div class="container d-flex justify-content-between">
				<a href="/" class="navbar-brand d-flex align-items-center"> <strong
					class="text-warning">Add a Book to Your Shelf!</strong>
				</a>
				<p><a class="btn" href="/home">back to the shelves</a>
			</div>
		</div>
	</header>
	 <div style="display:flex;margin-top:50px">   
	    <div style="width:35%; margin-top:10px;margin-left:100px;border:solid;padding:15px;"class="cantainer mt-4">
		    <form:form action="/createBook" method="post" modelAttribute="book">
		    <form:hidden path="user" value="${user }"/>
		        
		        <div class="form-group">
		            <label>Title:</label>
		            <form:input path="title" class="form-control" />
		            <form:errors path="title" class="text-danger" />
		        </div>
		        <div class="form-group">
		            <label>Author:</label>
		            <form:input path="author" class="form-control" />
		            <form:errors path="author" class="text-danger" />
		        </div>
		        <div class="form-group">
		            <label>My thoughts:</label>
		            <form:input path="thoughts" class="form-control" />
		            <form:errors path="thoughts" class="text-danger" />
		        </div>
		        <input type="submit" value="submit" class="btn btn-primary" />
		    </form:form>
	 	</div>
	 </div>
</body>
</html>
