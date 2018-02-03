<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                     
                     <%-- @@@@@@@@@@@@@@@@@@@@ Patient info/update @@@@@@@@@@@@@@@@@@@@@ --%>
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
                     </div>
                     <%-- *************************************************************  --%>
                  </section>
                     
                  <section class="col-lg-4 connectedSortable">
                     
                     <%-- @@@@@@@@@@@@@@@@@@@@@@@@@ Diagnostic @@@@@@@@@@@@@@@@@@@@@@@@@ --%>
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Diagnostics <span class="badge badge-info badge-pill"> ${diagnostics.size()}</span></h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">                           
                                    <li><a data-toggle="modal" data-target="#modalAddDiag"><i class="fa fa-fw fa-plus"></i> Créer un diagnostic</a></li>
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
                                 <ul class="todo-list">                     
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
                                          <li>
                                             <span class="text"><p>${diag.description}</p></span>
                                             <small class="label label-success"> ${diag.nombre_seances} seance(s) </small>
                                             <div class="tools">
                                                <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdateDiag" onclick='updateDiag(${diag.id_diagnostic},"${diag.description}",${diag.nombre_seances});'></i>
                                                <i class="fa fa-trash-o" onclick="deleteDiagnosticFunction(${diag.id_diagnostic},'${diag.description}');" ></i>
                                             </div>
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
                     <%-- *************************************************************  --%>
                        
                     <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ HM @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Historique médical <span class="badge badge-info badge-pill"> ${HMs.size()}</span></h3>
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
                                 <ul class="todo-list">                     
                                    <c:if test="${HMs.size() == 0}">
                                       <li class="list-group-item d-flex justify-content-between align-items-center">
                                          <i>Aucun Historique médical</i>
                                       </li> 
                                    </c:if>
                                    <c:if test="${HMs.size() != 0}">
                                       <c:if test="${HMs.size() > 5}"> 
                                          <c:set var="HMs" value="${HMs.subList(0,5)}" />
                                       </c:if>
                                       <c:forEach items="${HMs}" var="item">
                                          <!--li class="list-group-item d-flex justify-content-between align-items-center">
                                          ${item.description}
                                          <span class="badge">${item.date}</span>
                                       </li-->
                                          <li>
                                             <span class="text"><p>${item.description}</p></span>
                                             <small class="label label-success">${item.date}</small>
                                             <div class="tools">
                                                <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdateHM" onclick='updateHM(${item.id_hm},"${item.description}","${item.date}");'></i>
                                                <i class="fa fa-trash-o" onclick="deleteHMFunction(${item.id_hm},'${item.description}');" ></i>
                                             </div>
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
                     <%-- *************************************************************  --%>
                        
                  </section>
                     
                  <section class="col-lg-4 connectedSortable">
                     
                     <%-- @@@@@@@@@@@@@@@@@@@@@@@@ Prescription @@@@@@@@@@@@@@@@@@@@@@@@ --%>                        
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Préscriptions <span class="badge badge-info badge-pill"> ${prescriptions.size()==null ? '0' : prescriptions.size()}</span></h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">
                                    <li><a data-toggle="modal" data-target="#modelAddPrescription"><i class="fa fa-fw fa-plus"></i> Ajouter</a></li>                                    
                                    <li><a data-toggle="modal" data-target="#modalListPrescription"><i class="fa fa-fw fa-bars"></i> Préscriptions</a></li>
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
                                 <ul class="todo-list">                     
                                    <c:if test="${prescriptions == null || prescriptions.size() == 0 }">
                                       <li class="list-group-item d-flex justify-content-between align-items-center">
                                          <i>Aucune préscription</i>
                                       </li> 
                                    </c:if>
                                    <c:if test="${prescriptions.size() > 5}"> 
                                       <c:set var="prescriptions" value="${prescriptions.subList(0,5)}" />
                                    </c:if>
                                    <c:if test="${prescriptions != null || prescriptions.size() != 0}">
                                       <c:forEach items="${prescriptions}" var="item">
                                          <li>
                                             <span class="text">${item.description}</span>
                                             <small class="label label-success"> ${item.date} </small>
                                             <div class="tools">
                                                <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdatePrescription" onclick='updatePrescription(${item.id_prescription},"${item.description}","${item.date}");'></i>
                                                <i class="fa fa-trash-o" onclick="deletePrescriptionFunction(${item.id_prescription},'${item.description}');" ></i>
                                             </div>
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
                     <%-- *************************************************************  --%>
                        
                     <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@ Imagerie @@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
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
                     </div>
                     <%-- *************************************************************  --%>
                        
                  </section>
               </div>
                  
                  
               <div class="row">
                  <section class="col-lg-12 connectedSortable">
                     <%-- @@@@@@@@@@@@@@@@@@@@@@@@@ Agenda @@@@@@@@@@@@@@@@@@@@@@@@@ --%>
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Rendez-vous <span class="badge badge-info badge-pill"> ${agendas.size()}</span></h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">                           
                                    <li><a data-toggle="modal" data-target="#modalAddAgenda"><i class="fa fa-fw fa-plus"></i> Nouveau rendez-vous</a></li>
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
                                 <ul class="todo-list">                     
                                    <c:if test="${agendas.size() == 0}">
                                       <li class="list-group-item d-flex justify-content-between align-items-center">
                                          <i>Aucun rendez-vous</i>
                                       </li> 
                                    </c:if>                                       
                                 </ul>
                              </div>
                           </div><!-- /.row -->
                        </div><!-- ./box-body -->
                        <div class="box-footer">
                           <div class="row">
                              <script>      
                                 $(document).ready(function() {         
                                    $('#agenda').fullCalendar({
                                       locale: 'fr',            
                                       header: {
                                          left: 'prev,next today',
                                          center: 'title',
                                          right: 'listDay,listWeek,listMonth, month'
                                       },
                                       views: {
                                          listDay: { buttonText: 'Journée' },
                                          listWeek: { buttonText: 'Semaine' },
                                          listMonth: { buttonText: 'Mois' }
                                       },            
                                       //defaultView: 'listWeek',
                                       //defaultDate: '2017-12-12',
                                       navLinks: true, // can click day/week names to navigate views
                                       editable: false,
                                       eventLimit: true, // allow "more" link when too many events
                                       events: [
                                 <c:if test="${agendas.size() != 0}">
                                    <c:forEach items="${agendas}" var="item">
                                                {
                                                   id:             ${item.id_agenda},
                                                   title:         '${item.description}',
                                                   start:         '${item.date_debut}T${item.heure_debut}',                                                   
                                                   end:           '${item.date_fin}T${item.heure_fin}',
                                                   
                                                   description:   '${item.description}',
                                                   date_debut:    '${item.date_debut}',
                                                   heure_debut:   '${item.heure_debut}',
                                                   date_fin:      '${item.date_fin}',
                                                   heure_fin:     '${item.heure_fin}',
                                                   etat:          '${item.etat}',
                                                },   
                                    </c:forEach>
                                 </c:if>
                                          ],                                          
                                          //On event Click
                                          eventClick: function(event, jsEvent, view) {
                                             
                                             fillUpdateAgendaForm(event.id,''+event.description+'',''+event.date_debut+'',''+event.heure_debut+'',''+event.date_fin+'',''+event.heure_fin+'',''+event.etat+'');
                                             $("#modalUpdateAgenda").modal();
                                             //alert("id: "+event.id +"\n date_debut "+event.date_debut+"\n start: "+event.start);
                                             $(this).css('border-color', 'red');                                             
                                          }
                                       });         
                                    });      
                              </script> 
                              <div class="col-md-12"><div id="agenda"></div></div>
                           </div>
                        </div>
                     </div>
                     <%-- *************************************************************  --%>                     
                  </section>                     
                  
                  <section class="col-lg-6 connectedSortable">
                     
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
               var go = confirm('Vos êtes sur les points d\'effacer le diagnostic "'+description+'".\n voulez-vous continuer?');
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
                                       <span class="text"><p>${diag.description}</p></span>
                                       <small class="label label-info"> ${diag.nombre_seances} seance(s) </small>
                                       <div class="tools">
                                          <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdateDiag" onclick='updateDiag(${diag.id_diagnostic},"${diag.description}",${diag.nombre_seances});'></i>
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
               var go = confirm('Vos êtes sur les points d\'effacer l\'element: "'+description+'".\n voulez-vous continuer?');
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
                     <h4 class="modal-title">Historique Médical</h4>
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
                                          <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdateHM" onclick='updateHM(${item.id_hm},"${item.description}","${item.date}");'></i>
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
               var go = confirm('Vos êtes sur les points d\'effacer l\'element: "'+description+'".\n voulez-vous continuer?');
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
                                          <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdatePrescription" onclick='updatePrescription(${item.id_prescription},"${item.description}","${item.date}");'></i>
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
         <!--  /.Model All Prescription  -->  
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- .............................................. Update Modals ....................................................................................... --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <!--  Model Update Diagnostic  -->
         <script>         
            function updateDiag(id_diagnostic, description,nombre_seances){
               /*var tokens = description.split(/\n/);
      var data = "";
      for(var x = 0; x < tokens.length; x++){
         data = data + tokens[x];
      }*/
               //alert("id: "+id_diagnostic+"\n desc: "+description+"\n nbre: "+nombre_seances);
               document.getElementById("updateID_diagnostic").value = id_diagnostic;               
               document.getElementById("updateDiagnombre_seances").value = nombre_seances;   
               //var desc = description.replace("\\"," - ");
               document.getElementById("updateDiagDescription").value = description;      
            }
         </script> 
         <div class="modal fade" id="modalUpdateDiag" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin -->
               <form method="POST" action="<%=request.getContextPath()%>/updateDiag/${patient.id_patient}">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="id_diagnostic" id="updateID_diagnostic" />
                     
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
                                 <textarea required="true" class="form-control" name="description" id="updateDiagDescription" placeholder="Description" rows="2"  required="true"></textarea>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>Nombre de séances</label>
                                 <input type="number" class="form-control" name="nombre_seances" id="updateDiagnombre_seances" required="true"/>
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
         <!--  /.Model update Diagnostic  -->
            
         <!-- .............................................................. -->
            
         <!--  Model Update HM  -->
         <script>         
            function updateHM(id_hm, description,date){
               document.getElementById("updateID_hm").value = id_hm;               
               document.getElementById("updateHMDate").value = date;
               document.getElementById("updateHMDescription").value = description;      
            }
         </script> 
         <div class="modal fade" id="modalUpdateHM" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin -->
               <form method="POST" action="<%=request.getContextPath()%>/updateHM/${patient.id_patient}">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="id_hm" id="updateID_hm" />
                     
                  <!-- Modal content-->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modification d'un element de l'historique medical</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <label>Description</label>
                                 <textarea required="true" class="form-control" name="description" id="updateHMDescription" placeholder="Description" rows="2"  required="true"></textarea>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>Date</label>
                                 <input type="date" class="form-control" name="date" id="updateHMDate" required="true"/>
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
         <!--  /.Model update HM  -->
            
         <!-- .............................................................. -->
            
         <!--  Model Update Prescription  -->
         <script>         
            function updatePrescription(id_prescription, description,date){
               document.getElementById("updateID_prescription").value = id_prescription;               
               document.getElementById("updatePrescriptionDate").value = date;
               document.getElementById("updatePrescriptionDescription").value = description;      
            }
         </script> 
         <div class="modal fade" id="modalUpdatePrescription" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin -->
               <form method="POST" action="<%=request.getContextPath()%>/updatePrescription/${patient.id_patient}">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="id_prescription" id="updateID_prescription" />
                     
                  <!-- Modal content-->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modification da la préscription</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <label>Description</label>
                                 <textarea required="true" class="form-control" name="description" id="updatePrescriptionDescription" placeholder="Description" rows="2"  required="true"></textarea>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>Date</label>
                                 <input type="date" class="form-control" name="date" id="updatePrescriptionDate" required="true"/>
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
         <!--  /.Model update Prescription  -->
            
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- .............................................. Agenda Modals ....................................................................................... --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
         <!--  Model Add Agenda  -->
         <script>         
            function setDate(){
               var date_debut = document.getElementById("date_debut").value;               
               document.getElementById("date_fin").value = date_debut; 
            }
            function setTime(){
               var heure_debut = document.getElementById("heure_debut").value;               
               document.getElementById("heure_fin").value = heure_debut; 
            }
         </script>
         <div class="modal fade" id="modalAddAgenda" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin -->
               <form method="POST" action="<%=request.getContextPath()%>/addAgenda">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="patienDashboard" />
                  <input type="hidden" name="id_patient" value="${patient.id_patient}" />
                     
                  <!-- Modal content-->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Création d'un rendez-vous</h4>
                     </div>
                     <div class="modal-body">                        
                        <div class="col-md-12">
                           <div class="row">
                              <div class="form-group">
                                 <label>Description</label>
                                 <textarea class="form-control" name="description" placeholder="Description" rows="2">${agenda.description}</textarea>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-lg-4"><hr></div>
                              <div class="col-lg-4"><b>Date de début</b></div>
                              <div class="col-lg-4"><hr></div>
                           </div>
                           <div class="row">                              
                              <div class="form-group col-md-4">
                                 <label>Date</label>                                    
                                 <input type="date" class="form-control pull-right" name="date_debut" id="date_debut" oninput="setDate();" />
                              </div>
                              <div class="col-lg-2"></div>
                              <div class="form-group col-md-4">
                                 <label>Heure</label>
                                 <input type="time" class="form-control pull-right" id="heure_debut" name="heure_debut" oninput="setTime();" />                                    
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-lg-4"><hr></div>
                              <div class="col-lg-4"><b>Date de fin</b></div>
                              <div class="col-lg-4"><hr></div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>Date</label>                                    
                                 <input type="date" class="form-control pull-right" name="date_fin" id="date_fin" />
                              </div>
                              <div class="col-lg-2"></div>
                              <div class="form-group col-md-4">
                                 <label>Heure</label>
                                 <input type="time" class="form-control pull-right" id="heure_fin" name="heure_fin" />                                    
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
         <!--  /.Model Add Agenda  -->
            
         <%-- ************************************************************* --%>
            
         <!--  Model Add Agenda  -->
         <script>
            function fillUpdateAgendaForm(id,description,date_debut,heure_debut,date_fin,heure_fin,etat){
               document.getElementById("rdv_id_agenda").value = id;
               document.getElementById("rdv_description").value = description;
               document.getElementById("rdv_date_debut").value = date_debut;
               document.getElementById("rdv_heure_debut").value = heure_debut;
               document.getElementById("rdv_date_fin").value = date_fin;
               document.getElementById("rdv_heure_fin").value = heure_fin;
               //document.getElementById("rdv_etat").value = etat; 
            }
         </script>
         <div class="modal fade" id="modalUpdateAgenda" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin -->
               <form method="POST" action="<%=request.getContextPath()%>/updateAgenda/${patient.id_patient}">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="patienDashboard" />
                  <input type="hidden" name="id_agenda" id="rdv_id_agenda" />
                     
                  <!-- Modal content-->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modification d'un rendez-vous</h4>
                     </div>
                     <div class="modal-body">                        
                        <div class="col-md-12">
                           <div class="row">
                              <div class="form-group">
                                 <label>Description</label>
                                 <textarea class="form-control" name="description" id="rdv_description" placeholder="Description" rows="2"><div id="rdv_description"></div></textarea>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-lg-4"><hr></div>
                              <div class="col-lg-4"><b>Date de début</b></div>
                              <div class="col-lg-4"><hr></div>
                           </div>
                           <div class="row">                              
                              <div class="form-group col-md-4">
                                 <label>Date</label>                                    
                                 <input type="date" class="form-control pull-right" name="date_debut" id="rdv_date_debut" />
                              </div>
                              <div class="col-lg-2"></div>
                              <div class="form-group col-md-4">
                                 <label>Heure</label>
                                 <input type="time" class="form-control pull-right" id="rdv_heure_debut" name="heure_debut"/>                                    
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-lg-4"><hr></div>
                              <div class="col-lg-4"><b>Date de fin</b></div>
                              <div class="col-lg-4"><hr></div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>Date</label>                                    
                                 <input type="date" class="form-control pull-right" name="date_fin" id="rdv_date_fin" />
                              </div>
                              <div class="col-lg-2"></div>
                              <div class="form-group col-md-4">
                                 <label>Heure</label>
                                 <input type="time" class="form-control pull-right" id="rdv_heure_fin" name="heure_fin" />                                    
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-lg-2"></div>
                              <div class="col-lg-4">
                                 <div class="form-group">
                                    <label>Etat</label>
                                    <select class="form-control" name="etat">
                                       <option value="nouveau">Nouveau</option>
                                       <option value="annulee">Annulée</option>
                                       <option value="autre">Autre</option>
                                    </select>
                                 </div>                                 
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
         <!--  /.Model update Agenda  -->    
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>  
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
            
         <jsp:include page="layouts/footer.jsp" />
            
      </div>
      <!-- ./wrapper -->
         
         
      <jsp:include page="layouts/scripts.jsp" />
         
   </body>
</html>