<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><c:out value="${ pageTitle }" default="Kiné-App"  /></title>    
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" media="screen">
    <link href="<c:url value="/resources/assets/css/custom.min.css" />" rel="stylesheet">    
  </head>  
  
  <body>
    
    <jsp:include page="nav.jsp" />