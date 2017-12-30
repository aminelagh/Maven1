<div class="navbar navbar-expand-lg fixed-top navbar-light bg-primary">
  <div class="container">
    <a href="<%=request.getContextPath()%>" class="navbar-brand">App-Kiné</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      
      <ul class="navbar-nav">
        <!-- Patient item -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="patients">patient<span class="caret"></span></a>
          <div class="dropdown-menu" aria-labelledby="patients">             
            <a class="dropdown-item" href="<%=request.getContextPath()%>/patient/">/index</a>  
            <a class="dropdown-item" href="<%=request.getContextPath()%>/patient/add">/add</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/patient/list">/list</a>         
          </div>
        </li>
        
        <!-- Menu item -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="Menu">Menu<span class="caret"></span></a>
          <div class="dropdown-menu" aria-labelledby="Menu">             
            <a class="dropdown-item" href="Maven1/patient/">/index</a>  
            <a class="dropdown-item" href="Maven1/patient/add">/add</a>
            <a class="dropdown-item" href="Maven1/patient/list">/list</a>         
          </div>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="#">Help</a>
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