<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<div id="corp">
			<%@ include file="header.jsp" %>
	        <%@ include file="menu.jsp" %>
	        
	        <div id=subject>
	        	<p>Ancien utilisateur <c:out value="${ nom }"/></p>
	        	<c:choose>
	        		<c:when test="${ !empty sessionScope.nameUser}">
	        			<p>Bonjour <c:out value="${ sessionScope.nameUser }"></c:out></p>
	        			<form method="post" action="bonjour">
	        				<input type="submit" value="Déconexion">
	        			</form>
	        		</c:when>
	        		
	        		<c:otherwise>
	        			<p>Bonjour à vous</p>
						<p>Afin de pouvoir vous offrir un service personalisé merci de nous indiquer votre prénom</p>
						<form method="post" action="bonjour">
							<p><label for="name">Votre prénom</label>
							<input type="input" name="name" id="name"></p>
							<p><label for="firstName">Votre nom   </label>
							<input type="input" name="firstName" id="firstName"></p>
							<p><input type="submit"></p>
						</form>
	        		</c:otherwise>
	        	</c:choose>
	        	
	        	<h3>Affichage des utilisateur connu dans la base</h3>
	        	<ul>
		        	<c:forEach items="${Utilisateurs }" var="utilisateur">
		        		<li><c:out value="${utilisateur.prenom }"></c:out> <c:out value="${utilisateur.nom }" /></li>
		        	</c:forEach>
	        	</ul>
			</div>
		</div>
	</body>
</html>