<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <title><c:out value="${ pageTitle }" default="Kiné-App"  /></title> 
         
      <!-- bootstrap template -->
      <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" >
      <link href="<c:url value="/resources/assets/css/custom.min.css" />" rel="stylesheet">   
      
      <!-- for alerts -->
      <link href="<c:url value="/resources/alerts/animate.min.css" />" rel="stylesheet">
      
      <!-- datatables -->
      <link href="<c:url value="/resources/datatables/datatables.min.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/datatables/jquery.datatable.min.css" />" rel="stylesheet">
      
         
      <!-- For All js -->
      <script src="<c:url value="/resources/datatables/jquery.min.js" />"></script>
   
   
   
      <!-- JsGrid
      <link rel="stylesheet" href="<c:url value="/resources/jsgrid/demos.css" />" >
      <link rel="stylesheet" href="<c:url value="/resources/jsgrid/css/jsgrid.css" />">
      <link rel="stylesheet" href="<c:url value="/resources/jsgrid/css/theme.css" />" >
      <script src="<c:url value="/resources/jsgrid/external/jquery/jquery-1.8.3.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/jsgrid.core.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/jsgrid.load-indicator.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/jsgrid.load-strategies.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/jsgrid.sort-strategies.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/jsgrid.field.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/fields/jsgrid.field.text.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/fields/jsgrid.field.number.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/fields/jsgrid.field.select.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/fields/jsgrid.field.checkbox.js" />"></script>
      <script src="<c:url value="/resources/jsgrid/src/fields/jsgrid.field.control.js" />"></script>
         
      -->
      
   </head>  
   
   <body>
      
      <jsp:include page="nav.jsp" />