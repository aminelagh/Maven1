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
    
    <div class="navbar navbar-expand-lg fixed-top navbar-light bg-primary">
      <div class="container">
        <a href="../WebApplication1" class="navbar-brand">App-Kiné</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Themes <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="themes">
                <a class="dropdown-item" href="../default/">Default</a>
                <div class="dropdown-divider"></div>                
                <a class="dropdown-item" href="">Cerulean</a>
                <div class="dropdown-toggle-split"></div>
                <a class="dropdown-item" href="">Cerulean2</a>
                <a class="dropdown-item" href="">Cosmo</a>                
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../help/">Help</a>
            </li>            
          </ul>
          
          <ul class="nav navbar-nav ml-auto">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="autre">autre <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="autre">
                <a class="dropdown-item" href="">item 1</a>
                <a class="dropdown-item" href="">item 2</a>                
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="compte">Compte <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="compte">
                <a class="dropdown-item" href="">Profil</a>
                <a class="dropdown-item" href="">Deconnexion</a>                
              </div>
            </li>
          </ul>
          
        </div>
      </div>
    </div>   
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


