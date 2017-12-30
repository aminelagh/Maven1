<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/fragments/header.jsp" />
  
<div class="container">     
  
  
  
  <!-- Forms
  ================================================== -->
  <div class="bs-docs-section">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-header">
          <h1>Création d'un nouveau patient</h1>
          <c:if test="${errorMessage!=null}" >
            <div class="alert alert-warning alert-dismissible fade show" role="alert">${errorMessage}</div>
          </c:if>
            <c:if test="${successMessage!=null}" >
            <div class="alert alert-success alert-dismissible fade show" role="alert">${successMessage}</div>
          </c:if>
        </div>
      </div>
    </div>
      
    <div class="row">
      
      <div class="card col-lg-12">
        <div class="card-body">
          
          <!-- Form begin -->
          <form method="POST" action="<%=request.getContextPath()%>/patient/add">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              
            <legend>Patient</legend>   
              
            <div class="row">
              <div class="col-lg-6">                  
                <div class="form-group">
                  <label>Nom</label>
                  <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" value="${patient.nom}">
                  <small id="emailHelp" class="form-text text-muted">required</small>
                </div>              
                <div class="form-group">
                  <label>Prénom</label>
                  <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Prénom" value="${patient.prenom}">
                </div>  
                <div class="form-group">
                  <label>Date de naissance</label>
                  <input type="text" class="form-control" id="dob" name="dob" placeholder="Date de naissance" value="${patient.dob}">
                </div>                          
              </div>
              <div class="col-lg-6">                  
                <div class="form-group">
                  <label>CIN</label>
                  <input type="text" class="form-control" id="cin" name="cin" placeholder="CIN" value="${patient.cin}">
                </div>              
                <div class="form-group">
                  <label>Adresse</label>
                  <input type="text" class="form-control" id="adresse" name="adresse" placeholder="Adresse" value="${patient.adresse}">
                </div>  
                <div class="form-group col-lg-12">
                  <label class="custom-control custom-checkbox">
                    Fumeur
                    <input class="custom-control-input" type="checkbox" name="fumeur" <c:if test="${patient.fumeur==true}">checked</c:if>>
                    <span class="custom-control-indicator"></span>
                  </label>
                </div>            
    
              </div>              
              <button type="submit" class="btn btn-primary">Valider</button>  
            </div>
          </form>
          <!-- Form end -->
        </div>
      </div>
    </div>
    <div class="row">
      
      
    </div>
  </div>
  
  
</div>
<jsp:include page="/fragments/footer.jsp" />