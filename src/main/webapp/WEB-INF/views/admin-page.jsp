<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
  <title>Admin.jsp</title>
  <body>
    <h1>Admin.jsp</h1>
    
    <h1>Title : ${title}</h1>
    <h1>Message : ${message}</h1>
    
    <c:if test="${pageContext.request.userPrincipal.name != null}">
      <p>Name : ${pageContext.request.userPrincipal.name}</p>
      <p>authorities : ${pageContext.request.userPrincipal.authorities}</p>
      <p>| <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
      </p>
    </c:if>
    
    <hr><hr>
    <c:url value="/j_spring_security_logout" var="logoutUrl" />
    
    <!-- csrt for log out-->
    <form action="${logoutUrl}" method="post" id="logoutForm">
      <input type="hidden"
             name="${_csrf.parameterName}"
             value="${_csrf.token}" />
    </form>
    
    <script>
      function formSubmit() {
        document.getElementById("logoutForm").submit();
      }
    </script>
    
    <c:if test="${pageContext.request.userPrincipal.name != null}">
      <h2>
        Welcome : ${pageContext.request.userPrincipal.name} | <a
          href="javascript:formSubmit()"> Logout</a>
      </h2>
    </c:if>
  </body>
</html>
