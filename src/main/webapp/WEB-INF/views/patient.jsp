<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/fragments/header.jsp" />

<div class="container">     
   
   <div class="bs-docs-section">  
      <div class="row">
         <div class="page-header">
            <h1>Dossier patient: ${patient.nom} ${patient.prenom}</h1>
         </div>
      </div>
      
      <div class="row">
         <div class="col-4">
            <div class="card border-primary">
               <div class="card-header">Info Patient</div>
               <div class="card-body text-primary">
                  
                  <!-- Form begin -->
                  <form method="POST" action="<%=request.getContextPath()%>/patient/update">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     <input type="hidden" name="id_patient" value="${patient.id_patient}" />                     
                     
                     <div class="form-group">
                        <label>Nom</label>
                        <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" value="${patient.nom}" />
                        <small id="emailHelp" class="form-text text-muted">required</small>
                     </div>              
                     <div class="form-group">
                        <label>Prénom</label>
                        <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Prénom" value="${patient.prenom}" />
                     </div>  
                     <div class="form-group">
                        <label>Date de naissance</label>
                        <input type="text" class="form-control" id="dob" name="dob" placeholder="Date de naissance" value="${patient.dob}" />
                     </div>                          
                     
                     <div class="form-group">
                        <label>CIN</label>
                        <input type="text" class="form-control" id="cin" name="cin" placeholder="CIN" value="${patient.cin}" />
                     </div>              
                     <div class="form-group">
                        <label>Adresse</label>
                        <input type="text" class="form-control" id="adresse" name="adresse" placeholder="Adresse" value="${patient.adresse}" />
                     </div>  
                     <div class="form-group">
                        <label class="custom-control custom-checkbox">
                           Fumeur
                           <input class="custom-control-input" type="checkbox" name="fumeur" <c:if test="${patient.fumeur==true}">checked</c:if> >
                              <span class="custom-control-indicator"></span>                                 
                           </label>
                        </div> 
                        <div class="form-group">                              
                           <button type="submit" class="btn btn-primary">Valider</button>  
                        </div>
                        
                     </form>
                  </div>
                  <!-- Form end -->
               </div>
               <br> 
               
               <div class="card border-primary">
                  <div class="card-header">Diagnostics</div>
                  
                  <ul class="list-group">                     
                  <c:if test="${diags.size() == 0}">
                     <li class="list-group-item d-flex justify-content-between align-items-center">
                        <i>Aucun Diagnostic</i>
                     </li> 
                  </c:if>
                  <c:if test="${diags.size() != 0}">
                     <c:forEach items="${diags}" var="diag">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           ${diag.description}
                           <span class="badge badge-primary badge-pill">${diag.nombre_seances}</span>
                        </li>  
                     </c:forEach>
                  </c:if>                  
               </ul>
               <a href="<%=request.getContextPath()%>/diagnostic/add">Créer un diagnostic</a>
            </div>
            
            
         </div>
         <div class="col-4">
            <div class="card border-info">
               <div class="card-header">Historique Médical</div>
               <div class="card-body text-info">
                  <h4 class="card-title">Info card title</h4>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               </div>
            </div>         
         </div>
         <div class="col-4">
            <div class="card border-success">
               <div class="card-header">Prescriptions</div>
               <div class="card-body text-info">
                  <h4 class="card-title">Info card title</h4>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               </div>
            </div>         
         </div>
      </div>
   </div>
</div>



<jsp:include page="/fragments/footer.jsp" />

