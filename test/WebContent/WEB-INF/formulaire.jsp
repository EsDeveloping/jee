<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/style.css">
	</head>

	<body>
		<div id="corp">
            <%@ include file="header.jsp" %>
            <%@ include file="menu.jsp" %>
			
			<div id=subject>
				<h1>Utilisation des formulaires</h1>
				<form method="post" action="LesFormulaires" >
					<label for="nom">Nom</label>
					<input type="text" id="nom" name="nom" />
					
					<input type="submit" />
				</form>
				
				<br />
				<h3>Votre reponse</h3>
				<c:choose>
					<c:when test="${not empty  nom }"><c:out value="${ nom }"></c:out></c:when>
					<c:otherwise>La variable "nom" est null</c:otherwise>
				</c:choose>
				
				<!-- Envoi de fichier -->
				<h3>Upload de fichier</h3>
			    <c:if test="${ !empty fichier }"><p><c:out value="Le fichier ${ fichier } (${ description }) a été uploadé !" /></p></c:if>
			    <form method="post" action="LesFormulaires" enctype="multipart/form-data">
			        <p>
			            <label for="description">Description du fichier : </label>
			            <input type="text" name="description" id="description" />
			        </p>
			        <p>
			            <label for="fichier">Fichier à envoyer : </label>
			            <input type="file" name="fichier" id="fichier" />
			        </p>
			        
			        <input type="submit" />
			    </form>
			</div>
		</div>
	
	</body>
</html>