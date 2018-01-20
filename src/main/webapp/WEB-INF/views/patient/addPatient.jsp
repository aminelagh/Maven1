<jsp:include page="/fragments/head.jsp" />
<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>Bienvenue</h1>
      <ol class="breadcrumb">
         <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
         <li class="">Patients</li>
         <li class="active">Nouveau patient</li>
      </ol>
   </section>
   
   <!-- Main content -->
   <section class="content">
      
      <!-- Info boxes -->
      <div class="row">
         
      </div><!-- /.row -->
      
      <div class="row">
         <div class="col-md-12">
            <div class="box">
               <div class="box-header with-border">
                  <h3 class="box-title">Mes patients</h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <div class="btn-group">
                        <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                        <ul class="dropdown-menu" role="menu">
                           <li><a href="<%=request.getContextPath()%>/patient/list">Mes patients</a></li>
                           <li class="divider"></li>
                           <li><a href="#">Imprimer la liste</a></li>
                        </ul>
                     </div>
                     <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
               </div><!-- /.box-header -->
               <div class="box-body">
                  <div class="row">
                     
                     <!-- Form begin -->
                     <form method="POST" action="<%=request.getContextPath()%>/patient/add">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                        <div class="col-lg-6">                  
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
                        </div>
                        
                        <div class="col-lg-6">                  
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
                                 <input class="custom-control-input" type="checkbox" name="fumeur" <c:if test="${patient.fumeur==true}">checked</c:if>
                                 <span class="custom-control-indicator"></span>                                 
                              </label>
                           </div> 
                           <div class="form-group">                              
                              <button type="submit" class="btn btn-primary">Valider</button>  
                           </div>                              
                        </div>                        
                        <!-- first Diagnostic -->
                        <div class="col-lg-6">                        
                           <div class="form-group">
                              <label class="custom-control custom-checkbox">
                                 Créer un premier diagnostic
                                 <input class="custom-control-input" type="checkbox" name="withDiagnostic" data-toggle="collapse" data-target="#collapseDiagnosticForm" aria-expanded="true">
                                 <span class="custom-control-indicator"></span>
                              </label>
                           </div>                              
                           <div class="collapse" id="collapseDiagnosticForm">
                              <div class="card card-block">
                                 <legend>Diagnostic</legend> 
                                 <div class="form-group">
                                    <label>Description</label>
                                    <input type="text" class="form-control" id="description" name="description" placeholder="Description" value="${diagnostic.description}" />
                                    <small id="diagnostiDescriptionHelp" class="form-text text-muted">required</small>
                                 </div>
                                 <div class="form-group">
                                    <label>Nombre de séances</label>
                                    <input type="number" class="form-control col-3" id="nombre_seances" name="nombre_seances" placeholder="Nombre de Séances" value="${diagnostic.nombre_seances}" />
                                 </div>
                              </div>              
                              
                           </div>
                        </div>
                        
                     </form>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">
                  
               </div><!-- /.box-footer -->
            </div><!-- /.box -->
         </div><!-- /.col -->
      </div><!-- /.row -->
      
         
   </section>
   <!-- /.content -->
</div><!-- /.content-wrapper -->


<jsp:include page="/fragments/foot.jsp" />