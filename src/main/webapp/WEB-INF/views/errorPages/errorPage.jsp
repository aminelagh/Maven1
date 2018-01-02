   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/fragments/header.jsp" />

<link href="<c:url value="/resources/404-file/style-404.css" />" media="all" rel="stylesheet" type="text/css">
   
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/404-file/image-404.gif"/>">
   
   <div class="container">     
      
   <div class="bs-docs-section">    
      <div class="row">
       
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
      </div>
   </div>
      
</div>

<jsp:include page="/fragments/footer.jsp" />