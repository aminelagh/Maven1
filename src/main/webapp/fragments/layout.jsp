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
      <!-- /menu -->
      
      
      
      <div class="container">     
         
         <div class="bs-docs-section">    
            <div class="row">
               <div class="col-lg-12">
                  <div class="page-header">
                     <h1 id="tables">Tables</h1>
                  </div>
                  
                  <div class="bs-component">
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th scope="col">Type</th>
                              <th scope="col">Column heading</th>
                              <th scope="col">Column heading</th>
                              <th scope="col">Column heading</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr class="table-active">
                              <th scope="row">Active</th>
                              <td>Column content</td>
                              <td>Column content</td>
                              <td>Column content</td>
                           </tr>                
                        </tbody>
                     </table> 
                  </div>
               </div>
            </div>
         </div>
         
      </div>
      
      
      
      <script src="<c:url value="/resources/vendor/jquery/dist/jquery.min.js" />"></script>
      <script src="<c:url value="/resources/vendor/popper.js/dist/umd/popper.min.js" />"></script>
      <script src="<c:url value="/resources/vendor/bootstrap/dist/js/bootstrap.min.js" />"></script>
      <script src="<c:url value="/resources/assets/js/custom.js" />"></script>

      
   </body>
</html>


