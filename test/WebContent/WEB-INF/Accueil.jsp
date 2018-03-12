<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

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
            <div id="subject">
            
            	<h2>Utilisation des JSTL</h2>
            	<p><a href="https://course.oc-static.com/ftp-tutos/cours/java-ee/jstl-1.2.jar">Télécharger le fichier jstl.jar</a></p>
                <p>
                    <c:out value="Bonjour !" />
                </p>
              
                <c:set var="age" value="40" scope="page" />
                
                <p>
                    <c:out value="Age de l'utilisateur ${ age }" />
                </p>
                <c:if test="${ age<35 }">
                    Age plus petit que 35
                </c:if>
                
                <h3>Utilisation des conditions avec c:if</h3>
                <img src="img/cCondition1.png" alt="image condition">
                <img src="img/cCondition.png" alt="image condition">
                
                <p>
                    <c:if test="${ 50< 70 }" var="variable">Test vrai</c:if>
                </p>
                <c:choose>
				    <c:when test="${ variable }">Variable contien vrai</c:when>
				    <c:when test="${ autreVariable }">Du texte</c:when>
				    <c:when test="${ encoreUneAutreVariable }">Du texte</c:when>
				    <c:otherwise></c:otherwise>
				</c:choose>
				                
                <h3>Utilisattion des boubles avec c:for</h3>
                
                <img src="img/cForEach1.png" alt="image condition">
                <c:forEach var="i" begin="0" end="10" step="2">
                	<p>Itération de la boucle forEach n° <c:out value="${ i  }"></c:out> !</p>
                </c:forEach>
                <br />
                <p>Utiliser une boucle dans une array</p>
                <img src="img/cForEach2.png" alt="image condition">
                <c:forEach items="${ news }" var="post" varStatus="status">
                	<p>Post n° <c:out value="${ status.count }"></c:out> : <c:out value="${ post }"></c:out></p>
                </c:forEach>
                
                <br />
                <p>Couper une chaine de charactère grace a c:forTokens</p>
                <p>La chaine de charactère sera <em>Une grande chaine de charactère</em> </p>
                <p>Le délimiteur sera les espaces</p>
                <img src="img/cForEach3.png" alt="image condition">
                <c:forTokens var="morceau" items="Une grande chaine de charactère" delims=" " varStatus="status">
                	<p>Mot N° <c:out value="${ status.count }"></c:out> : <c:out value="${ morceau }"></c:out></p>
                </c:forTokens>
            </div>
        </div>
    </body>

    </html>
