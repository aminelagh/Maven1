<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>KinéApp - Error</title>
      
    <link href="<c:url value="/resources/404-file/style-404.css" />" media="all" rel="stylesheet" type="text/css">
      
    <link rel="shortcut icon" type="image/x-icon" href="https://a1.muscache.com/airbnb/static/logotype_favicon_pretzel-114df7f43fae7dd6dbc4ab074d934da5.ico">
      
  </head>
    
  <body>
    <header class="page-container page-container-responsive space-top-4">
      <a href="./" class="icon icon-airbnb link-icon h2">
        <span class="screen-reader-only">
          KinéApp
        </span>
      </a>
    </header>
      
    <div class="page-container page-container-responsive">
      <div class="row space-top-8 space-8 row-table">
        <div class="col-5 col-middle">
          <h1 class="text-jumbo text-ginormous">Oops!</h1>
          <h2>We can't seem to find the page you're looking for.</h2>
            
          <c:if test="${errorMessage!=null}">
            <p>${errorMessage}</p>
          </c:if>
        </div>
        <div class="col-5 col-middle text-center">
          <img src="<c:url value="/resources/404-file/image-404.gif"/>" alt="Girl has dropped her ice cream." width="313" height="428">
        </div>
      </div>
    </div>
      
      
      
  </body></html>