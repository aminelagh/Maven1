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
               <h1>Mes patients<small></small></h1>
               <ol class="breadcrumb">
                  <li><a href="<%=request.getContextPath()%>/"><i class="fa fa-dashboard"></i> Accueil</a></li>
                  <li class="active"><a href="<%=request.getContextPath()%>/patients">Mes patients</a></li>
               </ol>
            </section>
               
            <!-- Main content -->
            <section class="content">
               
               <!-- Main row -->
               <div class="row">
                  
                  <section class="col-lg-12 connectedSortable">
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Mes patients</h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">
                                    <li><a data-toggle="modal" data-target="#modelAddPatient" onclick="focusOnNom();">
                                          <i class="fa fa-fw fa-plus"></i> Créer un nouveau patient</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="#">Imprimer la liste</a></li>
                                 </ul>
                              </div>
                              <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                           </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                           <div class="row">
                              <div class="col-md-12">
                                 
                                 <form id="formDeletingPatient" method="POST" action="<%=request.getContextPath()%>/deletePatient">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />            
                                    <input type="hidden" id="id_patient_for_delete" name="id_patient" />            
                                 </form>
                                    
                                 <table id="example" class="table table-striped" width="100%" cellspacing="0">
                                    <thead>
                                       <tr>
                                          <th></th>
                                          <th>Patient</th>
                                          <th>Date naissance</th>
                                          <th>Fumeur</th>
                                          <th>Options</th>
                                       </tr>
                                    </thead>
                                    <tfoot>
                                       <tr>
                                          <th></th>
                                          <th>Patient</th>
                                          <th>dob</th>
                                          <th></th>
                                          <th></th>
                                       </tr>
                                    </tfoot>
                                    <tbody>
                                       <c:forEach items="${patients}" var="item" varStatus="status">
                                          <tr>
                                             <td>${status.index+1}</td>
                                             <td>${item.nom} ${item.prenom}</td>
                                             <td>${item.dob}</td>
                                             <td><input type="checkbox" class="minimal-red" disabled="true" ${item.isFumeur()? "checked" : "non"} /></td>
                                             <td>
                                                <i class="fa fa-fw fa-info" onclick="openPatient(${item.id_patient});"></i>                                    
                                                <i class="fa fa-fw fa-trash-o" onclick="deletePatientFunction(${item.id_patient},'${item.nom}','${item.prenom}');"></i>
                                             </td>
                                          </tr>
                                       </c:forEach>                     
                                    </tbody>
                                 </table>
                                    
                              </div>
                              <script>
                                 
                                 function deletePatientFunction(id_patient,nom,prenom){
                                    var patient = nom+" "+prenom;
                                    var go = confirm("Vos êtes sur les points d'effacer le dossier du patient "+patient+".\n voulez-vous continuer?");
                                    if(go){
                                       document.getElementById("id_patient_for_delete").value = id_patient;
                                       document.getElementById("formDeletingPatient").submit();
                                    }
                                 }
                                 function openPatient(id_patient){                                    
                                    window.open("<%=request.getContextPath()%>/patient/"+id_patient, "_self");
                                 }
                                 
                                 function focusOnNom(){
                                    document.getElementById('nom').focus();
                                 }
                                 
                                 $(document).ready(function() {                                    
                                    // Setup - add a text input to each footer cell
                                    $('#example tfoot th').each( function () {
                                       var title = $(this).text();
                                       if(title=='id')
                                          ;//$(this).html( '<input type="text" placeholder="Patient" size="7"/>' );
                                       else if(title=='Patient')
                                          $(this).html( '<input type="text" placeholder="Patient" size="10"/>' );
                                       else if(title=='dob')
                                          $(this).html( '<input type="text" placeholder="Date" size="10"/>' );
                                       else if(title=='')
                                          ;//$(this).html( '<input type="text" placeholder="Patient" size="7"/>' );
                                       
                                    } );
                                    
                                    var table = $('#example').DataTable( {
                                       
                                       //"dom": '<lfr<t>ip>',
                                       "dom": 
                                               "<'row'<'col-sm-6'l><'col-sm-2'><'col-sm-4'f>>" +
                                               "<'row'<'col-sm-12'tr>>" +
                                               "<'row'<'col-sm-4'i><'col-sm-2'><'col-sm-6'p>>",
                                       
                                       "paging":   true,
                                       "ordering": true,
                                       "info":     true,
                                       "stateSave": false,
                                       "pagingType": "full_numbers", // simple, numbers, simple_numbers, funn, first_last_numbers, full_numbers
                                       "lengthMenu": [[ 10, 25, 50, -1], [10, 25, 50, "All"]],
                                       
                                       "language": {
                                          "lengthMenu": "_MENU_  lignes par page",
                                          "zeroRecords": "Aucun patient enregistré.",
                                          "info": "Page _PAGE_ / _PAGES_",
                                          "infoEmpty": "Aucun patient enregistré...",
                                          "infoFiltered": "(filtered from _MAX_ total records)",
                                          "decimal": ",",
                                          "thousands": "."
                                       },
                                       "columnDefs": [
                                          //{ "targets":  -1 , "visible": true },
                                          { "targets": [ 0 ], "visible": true, "searchable": true },
                                          { "targets": [ 3 ], "visible": true }
                                       ],
                                       
                                       //Row created callback
                                       "createdRow": function ( row, data, index ) {
                                          if ( data[1].replace(/[\$,]/g, '') * 1 > 200000 ) {
                                             $('td', row).eq(1).addClass('highlight');
                                          }
                                       },
                                       "scrollCollapse": false,
                                       "paging":         true,                 
                                    } );
                                    
                                    // Apply the search
                                    table.columns().every( function () {
                                       var that = this;                 
                                       $( 'input', this.footer() ).on( 'keyup change', function () {
                                          if ( that.search() !== this.value ) {
                                             that.search( this.value ).draw();
                                          }
                                       } );
                                    } );              
                                 } );                                 
                              </script>       
                                 
                           </div><!-- /.row -->
                        </div><!-- ./box-body -->
                           
                        <div class="box-footer">
                           
                        </div>
                        <!-- /.box-footer -->
                     </div>
                     <!-- /.box -->
                        
                  </section><!-- right col -->
               </div><!-- /.row (main row) -->
                  
            </section><!-- /.content -->
         </div>
         <!-- /.content-wrapper -->
            
            
            
            
         <!--  Model Add patient  -->
         <div class="modal fade" id="modelAddPatient" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin  addPrescription -->
               <form method="POST" action="<%=request.getContextPath()%>/addPatient">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="listPatients" />
                  <input type="hidden" name="id_patient" value="${patient.id_patient}" />
                     
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Création d'un nouveau Patient</h4>
                     </div>
                        
                     <div class="modal-body">
                        <div class="row"> 
                           
                           <div class="col-lg-6">                  
                              <div class="form-group">
                                 <label>Nom</label>
                                 <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" value="${patient.nom}" required/>
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
                                 <label>
                                    <input type="checkbox" class="flat-red" name="fumeur" <c:if test="${patient.fumeur==true}">checked</c:if> />
                                       Fumeur
                                    </label>
                                 </div>                              
                                    
                              </div>
                           </div> 
                        </div>
                        <!-- modal-footer -->
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
               
               
               
         <jsp:include page="layouts/footer.jsp" />
            
            
            
      </div>
      <!-- ./wrapper -->
         
      <jsp:include page="layouts/scripts.jsp" />
         
   </body>
</html>