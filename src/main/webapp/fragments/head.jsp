<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta charset="UTF-8">
      <title>${empty pageTitle ? 'kiné-App' : pageTitle}</title>
      <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
      
      <!-- Bootstrap 3.3.2 -->
      <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" >         
      <!-- Font Awesome Icons -->
      <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" >  
      
      <!-- iCheck for checkboxes and radio inputs -->
      <link href="<c:url value="/resources/plugins/iCheck/all.css" />" rel="stylesheet" > 
      
      <!-- Ionicons --
      <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
      <!-- Theme style -->
      <link href="<c:url value="/resources/dist/css/AdminLTE.min.css" />" rel="stylesheet" > 
      <!-- AdminLTE Skins. -->
      <link href="<c:url value="/resources/dist/css/skins/_all-skins.min.css" />" rel="stylesheet" >  
      <!-- jQuery 2.1.3 -->
      <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js" />"></script>
      <!-- dataTables -->
      <script src="<c:url value="/resources/dataTables/datatables.min.js" />"></script>  
      <!-- Style for Table -->
      
      <style>
         td.highlight {
            font-weight: bold;
            color: blue;
         }
      </style>
   </head>
   
   <body class="skin-green">
      
      <!-- Site wrapper -->
      <div class="wrapper">
         
         <!-- Menu_1 -->
         <jsp:include page="menu_1.jsp" />
         
         <!-- Menu_2 -->
         <jsp:include page="menu_2.jsp" />
         
