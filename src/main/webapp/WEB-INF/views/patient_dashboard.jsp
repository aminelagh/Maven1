<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <jsp:include page="layouts/header.jsp" />
      
   <body class="skin-blue">
      <div class="wrapper">
         
         <jsp:include page="layouts/menu_1.jsp" />
            
         <jsp:include page="layouts/menu_2.jsp" />
            
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
               
               <!-- Main row -->
               <div class="row">
                  
                  <section class="col-lg-4 connectedSortable">
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
                                 <form method="POST" action="<%=request.getContextPath()%>/updatePatient">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="hidden" name="id_patient" value="${patient.id_patient}" />                     
                                       
                                    <div class="form-group">
                                       <label>Nom</label>
                                       <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" value="${patient.nom}" />
                                       <small id="emailHelp" class="form-text text-muted">required</small>
                                    </div>              
                                    <div class="form-group">
                                       <label>Pr�nom</label>
                                       <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Pr�nom" value="${patient.prenom}" />
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
                  </section>
                     
                  <section class="col-lg-4 connectedSortable">
                     <!-- Diagnostics  -->
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Diagnostics <span class="badge badge-info badge-pill"> ${diagnostics.size()}</span></h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">                           
                                    <li><a data-toggle="modal" data-target="#modalAddDiag"><i class="fa fa-fw fa-plus"></i> Cr�er un diagnostic</a></li>
                                    <li><a data-toggle="modal" data-target="#modalListDiag"><i class="fa fa-fw fa-bars"></i> Tous les diagnostics</a></li>
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
                                    <c:if test="${diagnostics.size() == 0}">
                                       <li class="list-group-item d-flex justify-content-between align-items-center">
                                          <i>Aucun Diagnostic</i>
                                       </li> 
                                    </c:if>
                                    <c:if test="${diagnostics.size() != 0}">
                                       <c:if test="${diagnostics.size() > 5}"> 
                                          <c:set var="diagnostics" value="${diagnostics.subList(0,5)}" />
                                       </c:if>
                                       <c:forEach items="${diagnostics}" var="diag">
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
                     <!-- Historique Medical  -->
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Historique m�dical <span class="badge badge-info badge-pill"> ${HMs.size()}</span></h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">                           
                                    <li><a data-toggle="modal" data-target="#modalAddHM"><i class="fa fa-fw fa-plus"></i> Ajouter</a></li>
                                    <li><a data-toggle="modal" data-target="#modalListHM"><i class="fa fa-fw fa-bars"></i> Historique complet</a></li>
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
                                          <i>Aucun Historique m�dical</i>
                                       </li> 
                                    </c:if>
                                    <c:if test="${HMs.size() != 0}">
                                       <c:if test="${HMs.size() > 5}"> 
                                          <c:set var="HMs" value="${HMs.subList(0,5)}" />
                                       </c:if>
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
                     </div>
                     <!-- /.box HM -->
                  </section>
                     
                  <section class="col-lg-4 connectedSortable">
                     <!-- Prescription  -->
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Pr�scriptions <span class="badge badge-info badge-pill"> ${prescriptions.size()==null ? '0' : prescriptions.size()}</span></h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">
                                    <li><a data-toggle="modal" data-target="#modelAddPrescription"><i class="fa fa-fw fa-plus"></i> Ajouter</a></li>                                    
                                    <li><a data-toggle="modal" data-target="#modalListPrescription"><i class="fa fa-fw fa-bars"></i> Pr�scriptions</a></li>
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
                                          <i>Aucune pr�scription</i>
                                       </li> 
                                    </c:if>
                                    <c:if test="${prescriptions.size() > 5}"> 
                                       <c:set var="prescriptions" value="${prescriptions.subList(0,5)}" />
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
                                    <c:if test="${imageries.size() == 0}">
                                       <li class="list-group-item d-flex justify-content-between align-items-center">
                                          <i>Imagerie vide</i>
                                       </li> 
                                    </c:if>
                                    <c:if test="${imageries.size() > 5}"> 
                                       <c:set var="imageries" value="${imageries.subList(0,5)}" />
                                    </c:if>
                                    <c:if test="${imageries.size() != 0}">
                                       <c:forEach items="${imageries}" var="item">
                                          <li class="list-group-item d-flex justify-content-between align-items-center">
                                             ${item.filename}
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
                  </section>
               </div>
                  
               <!-- Empty Row -->
               <div class="row">
                  <section class="col-lg-4 connectedSortable">                     
                  </section>                     
                  <section class="col-lg-4 connectedSortable">                     
                  </section>  
                  <section class="col-lg-4 connectedSortable">                     
                  </section>  
               </div>
               <!-- /.Empty Row -->
                  
            </section>
            <!-- /.content -->
         </div>
         <!-- /.content-wrapper -->
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- .............................................. Add Modals ....................................................................................... --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
            
         <!--  Model Add Diagnostic  -->
         <div class="modal fade" id="modalAddDiag" role="dialog">
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
                        <h4 class="modal-title">Cr�ation d'un diagnostic</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <label>Description</label>
                                 <textarea required="true" class="form-control" name="description" placeholder="Description" rows="2">${diagnostic.description}</textarea>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>Nombre de s�ances</label>
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
         <!--  /.Model Add Diagnostic  -->      
            
         <!--  Model Add Historique Medical  -->
         <div class="modal fade" id="modalAddHM" role="dialog">
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
                        <h4 class="modal-title">Cr�ation d'un diagnostic</h4>
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
         <!--  /.Model Add Historique Medical  -->
            
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
                        <h4 class="modal-title">Cr�ation d'une pr�scription</h4>
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
         <!--  /.Model Add Prescription  --> 
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- .............................................. List Modals ....................................................................................... --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <!--  Model All Diagnostic  -->
         <form id="formDeleteDiagnostic" method="POST" action="<%=request.getContextPath()%>/deleteDiagnostic">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />            
            <input type="hidden" id="id_diagnostic" name="id_diagnostic" />
            <input type="hidden" id="id_patient" name="id_patient" value="${patient.id_patient}" />            
         </form>   
         <script>         
            function deleteDiagnosticFunction(id_diag, description){
               var go = confirm('Vos �tes sur les points d\'effacer le diagnostic "'+description+'".\n voulez-vous continuer?');
               if(go){                  
                  document.getElementById("id_diagnostic").value = id_diag;
                  document.getElementById("formDeleteDiagnostic").submit();
               }
            }
         </script>         
            
         <div class="modal fade" id="modalListDiag" role="dialog">
            <div class="modal-dialog">
               
               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Diagnostics</h4>
                  </div>
                  <div class="modal-body">
                     <div class="row">
                        <div class="col-md-12">
                           <ul class="todo-list">                                                               
                              <c:if test="${diagnostics.size() == 0}">
                                 <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <i>Aucun Diagnostic</i>
                                 </li> 
                              </c:if>
                              <c:if test="${diagnostics.size() != 0}">                                 
                                 <c:forEach items="${diagnostics}" var="diag">                                    
                                    <li>
                                       <span class="text">${diag.description}</span>
                                       <small class="label label-info"> ${diag.nombre_seances} seance(s) </small>
                                       <div class="tools">
                                          <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdateDiag" onclick="updateDiag(${diag.id_diagnostic},'${diag.description}',${diag.nombre_seances});"></i>
                                          <i class="fa fa-trash-o" onclick="deleteDiagnosticFunction(${diag.id_diagnostic},'${diag.description}');" ></i>
                                       </div>
                                    </li>                                       
                                 </c:forEach>
                              </c:if>
                           </ul>
                              
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">                     
                     <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                  </div>
               </div>
            </div>
         </div>
         <!--  /.Model Add Diagnostic  -->    
            
         <!-- ..................................................................................... -->
            
         <!--  Model All HM  -->
         <form id="formDeleteHM" method="POST" action="<%=request.getContextPath()%>/deleteHM">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />            
            <input type="hidden" id="id_hm" name="id_hm" />
            <input type="hidden" id="id_patient" name="id_patient" value="${patient.id_patient}" />            
         </form>   
         <script>         
            function deleteHMFunction(id_hm, description){
               var go = confirm('Vos �tes sur les points d\'effacer l\'element: "'+description+'".\n voulez-vous continuer?');
               if(go){                  
                  document.getElementById("id_hm").value = id_hm;
                  document.getElementById("formDeleteHM").submit();
               }
            }
         </script>         
            
         <div class="modal fade" id="modalListHM" role="dialog">
            <div class="modal-dialog">
               
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Historique M�dical</h4>
                  </div>
                  <div class="modal-body">
                     <div class="row">
                        <div class="col-md-12">
                           <ul class="todo-list">                                 
                              <c:if test="${HMs.size() == 0}">
                                 <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <i>Aucun element</i>
                                 </li> 
                              </c:if>
                              <c:if test="${HMs.size() != 0}">                                 
                                 <c:forEach items="${HMs}" var="item">                                    
                                    <li>
                                       <span class="text">${item.description}</span>
                                       <small class="label label-success"> ${item.date} </small>
                                       <div class="tools">
                                          <i class="fa fa-edit"></i>
                                          <i class="fa fa-trash-o" onclick="deleteHMFunction(${item.id_hm},'${item.description}');" ></i>
                                       </div>
                                    </li>                                       
                                 </c:forEach>
                              </c:if>
                           </ul>
                              
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">                     
                     <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                  </div>
               </div>
            </div>
         </div>
         <!--  /.Model All HMs  -->
            
         <!-- ..................................................................................... -->
            
         <!--  Model All Prescription  -->
         <form id="formDeletePrescription" method="POST" action="<%=request.getContextPath()%>/deletePrescription">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />            
            <input type="hidden" id="id_prescription" name="id_prescription" />
            <input type="hidden" id="id_patient" name="id_patient" value="${patient.id_patient}" />            
         </form>   
         <script>         
            function deletePrescriptionFunction(id_prescription, description){
               var go = confirm('Vos �tes sur les points d\'effacer l\'element: "'+description+'".\n voulez-vous continuer?');
               if(go){                  
                  document.getElementById("id_prescription").value = id_prescription;
                  document.getElementById("formDeletePrescription").submit();
               }
            }
         </script>         
            
         <div class="modal fade" id="modalListPrescription" role="dialog">
            <div class="modal-dialog">
               
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Prescriptions</h4>
                  </div>
                  <div class="modal-body">
                     <div class="row">
                        <div class="col-md-12">
                           <ul class="todo-list">                                 
                              <c:if test="${prescriptions.size() == 0}">
                                 <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <i>Aucune prescription</i>
                                 </li> 
                              </c:if>
                              <c:if test="${prescriptions.size() != 0}">                                 
                                 <c:forEach items="${prescriptions}" var="item">                                    
                                    <li>
                                       <span class="text">${item.description}</span>
                                       <small class="label label-success"> ${item.date} </small>
                                       <div class="tools">
                                          <i class="fa fa-edit"></i>
                                          <i class="fa fa-trash-o" onclick="deletePrescriptionFunction(${item.id_prescription},'${item.description}');" ></i>
                                       </div>
                                    </li>                                       
                                 </c:forEach>
                              </c:if>
                           </ul>
                              
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">                     
                     <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                  </div>
               </div>
            </div>
         </div>
         <!--  /.Model All HMs  -->  
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- .............................................. Update Modals ....................................................................................... --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <!--  Model Update Diagnostic  -->
         <div class="modal fade" id="modalUpdateDiag" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin -->
               <form method="POST" action="<%=request.getContextPath()%>/updateDiag">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="id_patient" value="${patient.id_patient}" />
                  <input type="hidden" name="id_diagnostic" id="id_diagnostic" />
                     
                  <!-- Modal content-->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modification du diagnostic</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <label>Description</label>
                                 <textarea required="true" class="form-control" name="description" id="updateDiagDescription" placeholder="Description" rows="2"  required="true">${diagnostic.description}</textarea>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>Nombre de s�ances</label>
                                 <input type="number" class="form-control" name="nombre_seances" value="${diagnostic.nombre_seances}" id="updateDiagnombre_seances" required="true"/>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer">
                        <div class="col-md-2">
                           <div class="form-group">               
                              <button type="submit" class="btn btn-primary">Modifier</button>  
                           </div>  
                        </div>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
         <script>         
            function updateDiag(id_diagnostic, description,nombre_seances){                 
               document.getElementById("id_diagnostic").value = id_diagnostic;
               document.getElementById("updateDiagDescription").value = description;
               document.getElementById("updateDiagnombre_seances").value = nombre_seances;         
            }
         </script> 
         <!--  /.Model update Diagnostic  -->    
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <jsp:include page="layouts/footer.jsp" />
            
      </div>
      <!-- ./wrapper -->
         
         
      <jsp:include page="layouts/scripts.jsp" />
         
   </body>
</html>