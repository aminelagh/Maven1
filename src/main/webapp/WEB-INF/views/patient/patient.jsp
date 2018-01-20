<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/fragments/head.jsp" />
<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>Dossier patient: <b>${patient.nom} ${patient.prenom}</b></h1>
      <ol class="breadcrumb">
         <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Accueil</a></li>
         <li class="">Patients</li>
         <li class=""><a href="<%=request.getContextPath()%>/patient/list">Mes patients</a></li>
         <li class="active">${patient.nom} ${patient.prenom}</li>
      </ol>
   </section>
   
   <!-- Main content -->
   <section class="content">
      
      <div class="row">
         <div class="col-md-4">
            
            <div class="box">
               
               <div class="box-header with-border">
                  <h3 class="box-title">Patient</h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
               </div><!-- /.box-header -->
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
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
                                 <input class="custom-control-input" type="checkbox" name="fumeur" 
                                        ${patient.fumeur==true ? 'checked' : ''} >
                                 <span class="custom-control-indicator"></span>                                 
                              </label>
                           </div> 
                           <div class="form-group">                              
                              <button type="submit" class="btn btn-primary">Valider</button>  
                           </div>
                        </form>
                     </div>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">                     
               </div>
               
            </div><!-- /.box -->
            
            <!-- Diagnostics  -->
            <div class="box">
               <div class="box-header with-border">
                  <h3 class="box-title">Mes patients</h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <div class="btn-group">
                        <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                        <ul class="dropdown-menu" role="menu">
                           <li><a href="<%=request.getContextPath()%>/patient/add">Créer un nouveau patient</a></li>
                           <li class="divider"></li>
                           <li><a href="#">Imprimer la liste</a></li>
                        </ul>
                     </div>
                     <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
               </div>
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
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
                                    <span class="badge badge-info badge-pill">${diag.nombre_seances} seance(s)</span>
                                 </li>  
                              </c:forEach>
                           </c:if>
                        </ul>
                        <a href="<%=request.getContextPath()%>/patient/${patient.id_patient}/addDiag">Créer un diagnostic</a>
                     </div>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">      
               </div>
            </div><!-- /.box -->
               
         </div><!-- /.col -->
            
            
            
         <div class="col-md-4">
            <div class="box">
               <div class="box-header with-border">
                  <h3 class="box-title">Patient</h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
               </div><!-- /.box-header -->
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
                        
                     </div>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">                     
               </div>
            </div><!-- /.box -->
         </div><!-- /.col -->
            
            
      </div><!-- /.row -->
      
      
   </section><!-- /.content -->
</div><!-- /.content-wrapper -->


<jsp:include page="/fragments/foot.jsp" />