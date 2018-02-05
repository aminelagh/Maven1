<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <jsp:include page="layouts/header.jsp" />
   
   <body class="skin-blue">
      <div class="wrapper">
         
         <jsp:include page="layouts/menu_1.jsp" />
         
         <jsp:include page="layouts/menu_2.jsp" />
         
         
         <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
               <h1>Mon agenda<small></small></h1>
               <ol class="breadcrumb">
                  <li><a href="<%=request.getContextPath()%>/"><i class="fa fa-dashboard"></i> Accueil</a></li>
                  <li class="active"><a href="<%=request.getContextPath()%>/agenda">Mes rendez-vous</a></li>
               </ol>
            </section>
            
            <!-- Main content -->
            <section class="content">
               
               <!-- Main row -->
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
                                    <c:if test="${agendas.size() != 0}">
                                       <script>      
                                          function getColor(id_patient)
                                          {
                                             switch(id_patient){
                                                case 0: return '#237DC8';break;
                                                case 1: return '#322075';break;
                                                case 2: return '#5FB04D';break;
                                                case 3: return '#84403E';break;
                                                case 4: return '#9D2772';break;
                                                case 5: return '#739480';break;
                                                case 6: return '#8B8346';break;
                                                case 7: return '#2D205E';break;
                                                case 8: return '#463C6A';break;
                                                case 9: return '#F4D80A';break;
                                                case 10: return '#10CF5D';break;
                                                case 11: return '#C590B2';break;
                                                case 12: return '#D40E07';break;
                                                default : return '#000000'; break;
                                             }
                                          }
                                          
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
                                                displayEventTime : true,
                                                events: [
                                          <c:if test="${agendas.size() != 0}">
                                             <c:forEach items="${agendas}" var="item">
                                                            {
                                                               id:             ${item.id_agenda},
                                                               title:         '${item.description}',
                                                               start:         '${item.date_debut}T${item.heure_debut}',                                                   
                                                               end:           '${item.date_fin}T${item.heure_fin}',
                                                               
                                                               //info patient:
                                                               id_patient:    ${item.id_patient},
                                                               nom:           '${mapPatients.get(item.id_patient).nom}',
                                                               prenom:        '${mapPatients.get(item.id_patient).prenom}',
                                                               dob:           '${mapPatients.get(item.id_patient).dob}',
                                                               
                                                               //info agenda
                                                               description:   '${item.description}',
                                                               date_debut:    '${item.date_debut}',
                                                               heure_debut:   '${item.heure_debut}',
                                                               date_fin:      '${item.date_fin}',
                                                               heure_fin:     '${item.heure_fin}',
                                                               etat:          '${item.etat}',
                                                               color:         getColor(${item.id_patient}),
                                                            },   
                                             </c:forEach>
                                          </c:if>
                                                   ],                                          
                                                   //On event Click
                                                   eventClick: function(event, jsEvent, view) {                                             
                                                      fillUpdateAgendaForm(event.id,event.id_patient,event.description,event.date_debut,event.heure_debut,event.date_fin,event.heure_fin,event.etat);
                                                      fillPatientInfo(event.id_patient,event.nom,event.prenom,event.dob);
                                                      $("#modalUpdateAgenda").modal();
                                                      $(this).css('border-color', 'red');                                             
                                                   }
                                                });         
                                             });      
                                       </script> 
                                       <div class="col-md-12"><div id="agenda"></div></div>
                                       </c:if>
                                 </ul>
                              </div>
                           </div><!-- /.row -->
                        </div><!-- ./box-body -->
                        <div class="box-footer">
                           <div class="row">
                              
                           </div>
                        </div>
                     </div>
                     <%-- *************************************************************  --%>                     
                  </section>                     
                  
               </div>
               
            </section>
            <!-- /.content -->
         </div>
         <!-- /.content-wrapper -->
         
         
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
                  <input type="hidden" name="form" value="agenda" />
                  
                  <!-- Modal content-->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Création d'un rendez-vous</h4>
                     </div>
                     <div class="modal-body">
                        <div class="col-md-12">
                           <div class="row">
                              <div class="col-md-4">
                                 <div class="form-group">
                                    <label>Patient</label>
                                    <select class="form-control" name="id_patient">
                                       <c:forEach items="${patients}" var="item">
                                          <option value="${item.id_patient}">${item.nom} ${item.prenom}</option>
                                       </c:forEach>
                                    </select>
                                 </div>  
                              </div>
                              <div class="col-md-8">
                                 <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" name="description" placeholder="Description" rows="2">${agenda.description}</textarea>
                                 </div>
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
            function fillUpdateAgendaForm(id_agenda,id_patient,description,date_debut,heure_debut,date_fin,heure_fin,etat){
               document.getElementById("rdv_id_agenda").value = id_agenda;
               document.getElementById("rdv_description").value = description;
               document.getElementById("rdv_date_debut").value = date_debut;
               document.getElementById("rdv_heure_debut").value = heure_debut;
               document.getElementById("rdv_date_fin").value = date_fin;
               document.getElementById("rdv_heure_fin").value = heure_fin;
               document.getElementById("rdv_id_patient").value = id_patient;
               //document.getElementById("rdv_etat").value = etat; 
            }
            function fillPatientInfo(id_patient,nom,prenom,dob){
               document.getElementById("p_info_link").href = "/Maven1/patient/"+id_patient;
               document.getElementById("p_info_nom").innerHTML = nom;
               document.getElementById("p_info_prenom").innerHTML = prenom;
               document.getElementById("p_info_dob").innerHTML = dob;
            }
         </script>
         <div class="modal fade" id="modalUpdateAgenda" role="dialog">
            <div class="modal-dialog">
               <%-- delete rdv form --%>
               <form method="POST" action="/Maven1/deleteAgenda" id="form_delete_rdv">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="agenda" />
                  <input type="hidden" name="id_agenda" id="rdv_id_agenda" />
               </form>
               <!-- Form begin -->
               <form method="POST" action="<%=request.getContextPath()%>/updateAgenda/${patient.id_patient}">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="agenda" />
                  <input type="hidden" name="id_agenda" id="rdv_id_agenda" />
                  
                  <!-- Modal content-->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modification d'un rendez-vous</h4>
                        <h5>Patient: <a href="" id="p_info_link" title="Dossier du patient"><b id="p_info_nom"></b> <b id="p_info_prenom"></b></a> (<b id="p_info_dob"></b>)</h5>
                     </div>
                     <div class="modal-body">                        
                        <div class="col-md-12">
                           
                           <div class="row">
                              <div class="col-md-4">
                                 <div class="form-group">
                                    <label>Patient</label>
                                    <select class="form-control" name="id_patient" id="rdv_id_patient">
                                       <c:forEach items="${patients}" var="item">
                                          <option value="${item.id_patient}">${item.nom} ${item.prenom}</option>
                                       </c:forEach>
                                    </select>
                                 </div>  
                              </div>
                              <div class="col-md-8">
                                 <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" name="description" id="rdv_description" placeholder="Description" rows="2"></textarea>
                                 </div>
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
                        <div class="col-md-2"></div>
                        <div class="col-md-2">
                           <div class="form-group">                              
                              <button type="submit" form="form_delete_rdv" class="btn btn-danger">Effacer rdv</button>  
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