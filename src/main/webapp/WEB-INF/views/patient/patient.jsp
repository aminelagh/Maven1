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
            
            <!-- Patient info/update -->
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
                              <button type="submit" class="btn btn-primary">Modifier</button>  
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
                  <h3 class="box-title">Diagnostics <span class="badge badge-info badge-pill"> ${diags.size()}</span></h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <div class="btn-group">
                        <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                        <ul class="dropdown-menu" role="menu">
                           <!--a href="<%=request.getContextPath()%>/patient/${patient.id_patient}/addDiag">
                              <i class="fa fa-fw fa-plus"></i> Créer un diagnostic
                           </a-->
                           <li><a data-toggle="modal" data-target="#modelAddDiag"><i class="fa fa-fw fa-plus"></i> Créer un diagnostic</a></li>
                           <li><a href=""><i class="fa fa-fw fa-bars"></i> Liste des diagnostics</a></li>
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
                     </div>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">
                  <div class="row">
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                  </div>
               </div>
            </div><!-- /.box -->
               
         </div><!-- /.col -->
            
            
            
         <div class="col-md-4">
            <!-- Historique Medical  -->
            <div class="box">
               <div class="box-header with-border">
                  <h3 class="box-title">Historique médical <span class="badge badge-info badge-pill"> ${HMs.size()}</span></h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <div class="btn-group">
                        <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                        <ul class="dropdown-menu" role="menu">
                           <!--a href="<%=request.getContextPath()%>/patient/${patient.id_patient}/addDiag">
                              <i class="fa fa-fw fa-plus"></i> Créer un diagnostic
                           </a-->
                           <li><a data-toggle="modal" data-target="#modelAddHM"><i class="fa fa-fw fa-plus"></i> Ajouter</a></li>
                           <li><a href=""><i class="fa fa-fw fa-bars"></i> Historique médical</a></li>
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
                           <c:if test="${HMs.size() == 0}">
                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                 <i>Aucun Historique médical</i>
                              </li> 
                           </c:if>
                           <c:if test="${HMs.size() != 0}">
                              <c:forEach items="${HMs}" var="item">
                                 <li class="list-group-item d-flex justify-content-between align-items-center">
                                    ${item.description}
                                    <span class="badge">${item.date}</span>
                                 </li>  
                              </c:forEach>
                           </c:if>
                        </ul>
                     </div>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">
                  <div class="row">
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                  </div>
               </div>
            </div><!-- /.box -->
               
               
            <!-- Prescription  -->
            <div class="box">
               <div class="box-header with-border">
                  <h3 class="box-title">Préscriptions <span class="badge badge-info badge-pill"> ${prescriptions.size()==null ? '0' : prescriptions.size()}</span></h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <div class="btn-group">
                        <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                        <ul class="dropdown-menu" role="menu">
                           <li><a data-toggle="modal" data-target="#modelAddPrescription"><i class="fa fa-fw fa-plus"></i> Ajouter</a></li>
                           <li><a href=""><i class="fa fa-fw fa-bars"></i> Préscriptions</a></li>
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
                           <c:if test="${prescriptions == null || prescriptions.size() == 0 }">
                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                 <i>Aucune préscription</i>
                              </li> 
                           </c:if>
                           <c:if test="${prescriptions != null || prescriptions.size() != 0}">
                              <c:forEach items="${prescriptions}" var="item">
                                 <li class="list-group-item d-flex justify-content-between align-items-center">
                                    ${item.description}
                                    <span class="badge">${item.date}</span>
                                 </li>  
                              </c:forEach>
                           </c:if>
                        </ul>
                     </div>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">
                  <div class="row">
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                  </div>
               </div>
            </div><!-- /.box -->            
               
         </div><!-- /.col -->
            
         <div class="col-md-4">
            <!-- Imagerie  -->
            <div class="box">
               <div class="box-header with-border">
                  <h3 class="box-title">Imagerie <span class="badge badge-info badge-pill"> ${imageries.size()}</span></h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
               </div>
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
                        <ul class="list-group">                     
                           <c:if test="${HMs.size() == 0}">
                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                 <i>Aucun Historique médical</i>
                              </li> 
                           </c:if>
                           <c:if test="${HMs.size() != 0}">
                              <c:forEach items="${HMs}" var="item">
                                 <li class="list-group-item d-flex justify-content-between align-items-center">
                                    ${item.description}
                                    <span class="badge">${item.date}</span>
                                 </li>  
                              </c:forEach>
                           </c:if>
                        </ul>
                     </div>
                  </div><!-- /.row -->
               </div><!-- ./box-body -->
               <div class="box-footer">
                  <div class="row">
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                     <div class="col-md-4"></div>
                  </div>
               </div>
            </div><!-- /.box -->
               
         </div>
            
      </div><!-- /.row -->      
         
   </section><!-- /.content -->
</div><!-- /.content-wrapper -->
   
   
   
<!--  Model Add Diagnostic  -->
<div class="modal fade" id="modelAddDiag" role="dialog">
   <div class="modal-dialog">
      <!-- Form begin -->
      <form method="POST" action="<%=request.getContextPath()%>/addDiag">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         <input type="hidden" name="form" value="patienDashboard" />
         <input type="hidden" name="id_patient" value="${patient.id_patient}" />
            
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Création d'un diagnostic</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-group">
                        <label>Description</label>
                        <textarea required="true" class="form-control" name="description" placeholder="Description" rows="2">${diagnostic.description}</textarea>
                     </div>
                     <div class="form-group col-md-4">
                        <label>Nombre de séances</label>
                        <input type="number" class="form-control" name="nombre_seances" value="${diagnostic.nombre_seances}" required="true"/>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <div class="col-md-2">
                  <div class="form-group">               
                     <button type="submit" class="btn btn-primary">Ajouter</button>  
                  </div>  
               </div>
               <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
            </div>
         </div>
      </form>
   </div>
</div>
   
<!--  Model Add Historique Medical  -->
<div class="modal fade" id="modelAddHM" role="dialog">
   <div class="modal-dialog">
      <!-- Form begin -->
      <form method="POST" action="<%=request.getContextPath()%>/addHM" name="formHM">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         <input type="hidden" name="form" value="patienDashboard" />
         <input type="hidden" name="id_patient" value="${patient.id_patient}" />
            
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Création d'un diagnostic</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-group">
                        <label>Description</label>
                        <textarea required="true" class="form-control" name="description" placeholder="Description" rows="2">${diagnostic.description}</textarea>
                     </div>
                     <div class="form-group col-md-4">
                        <label>Date</label>
                        <input type="date" class="form-control" name="date" value="${diagnostic.date}" required="true"/>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <div class="col-md-2">
                  <div class="form-group">               
                     <button type="submit" class="btn btn-primary">Ajouter</button>  
                  </div>  
               </div>
               <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
            </div>
         </div>
      </form>
   </div>
</div>
   
<!--  Model Add Prescription  -->
<div class="modal fade" id="modelAddPrescription" role="dialog">
   <div class="modal-dialog">
      <!-- Form begin  addPrescription -->
      <form method="POST" action="<%=request.getContextPath()%>/addPrescription" enctype="multipart/form-data">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         <input type="hidden" name="form" value="patienDashboard" />
         <input type="hidden" name="id_patient" value="${patient.id_patient}" />
            
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Création d'une préscription</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-group">
                        <label>Description</label>
                        <textarea required="true" class="form-control" name="description" placeholder="Description" rows="2">${diagnostic.description}</textarea>
                     </div>
                     <div class="form-group col-md-4">
                        <label>Date</label>
                        <input type="date" class="form-control" name="date" value="${diagnostic.date}" required="true"/>
                     </div>
                     <div class="col-md-2"></div>
                     <div class="form-group col-lg-6">
                        <label>Fichier</label>
                        <input type="file" class="form-control" name="file" value="" multiple="true"/>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <div class="col-md-2">
                  <div class="form-group">               
                     <button type="submit" class="btn btn-primary">Ajouter</button>  
                  </div>  
               </div>
               <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
            </div>
         </div>
      </form>
   </div>
</div>
   
<jsp:include page="/fragments/foot.jsp" />