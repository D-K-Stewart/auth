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
				<a href="/home" class="col-8 navbar-brand"> <strong
					class="text-warning">LOGIN AND REGISTRATION</strong>
				</a>
				<div class="col-4 row align-items-center">
					<h1 class="col m-2">${ user.firstName }</h1>
					<p><a href="/home" class="btn">Home</a></p>
					<p><a href="/logout" class="btn">Logout</a></p>
				</div>
			</div>
		</div>
		<main role="main">
		
		<div style="margin-top:10px; margin-left:400px">
			<p>${book.title}</p>
			<p>${ user.firstName } read ${book.title} by ${book.author}</p>
			<p>Here are ${ user.firstName }'s thoughts:</p>
			<p>How I felt about this book - ${book.thoughts}</p>
			<p style="display:flex;">
            	<form action="/editBook/${book.id}"><button type="submit" class="button">Edit</button></form>
            	<form action="/delete/${book.id}" method="post"><input type="hidden" name="_method" value="delete" class="button"/><input type="submit" value="Delete"/></form>
        	<p/>
		</div>
	</main>
	</header>
</body>
</html>
