<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
  <title>User.jsp</title>
  <body>
    <h1>User.jsp</h1>
      
    <h1>Title : ${title}</h1>
    <h1>Message : ${message}</h1>
    
    <c:if test="${pageContext.request.userPrincipal.name != null}">
      <p>Name : ${pageContext.request.userPrincipal.name}</p>
      <p>authorities : ${pageContext.request.userPrincipal.authorities}</p>
      <p>| <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
      </p>
    </c:if>
  </body>
</html>