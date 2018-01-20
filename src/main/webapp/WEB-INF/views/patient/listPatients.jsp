<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/fragments/head.jsp" />
<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>Mes patients</h1>
      <ol class="breadcrumb">
         <li><a href="<%=request.getContextPath()%>"><i class="fa fa-dashboard"></i> Home</a></li>
         <li class="">Patients</li>
         <li class="active">Mes patients</li>
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
                           <li><a href="<%=request.getContextPath()%>/patient/add">Créer un nouveau patient</a></li>
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
                        
                        <form id="formDeletingPatient" method="POST" action="<%=request.getContextPath()%>/patient/delete">
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
                                 <th>Fumeur</th>
                                 <th></th>
                              </tr>
                           </tfoot>
                           <tbody>
                              <c:forEach items="${patients}" var="item">
                                 <tr>
                                    <td>${item.id_patient}</td>
                                    <td>${item.nom} ${item.prenom}</td>
                                    <td>${item.dob}</td>
                                    <td>${item.isFumeur()? "oui" : "non"}</td>
                                    <td>
                                       <i class="fa fa-fw fa-info" onclick="openPatient(${item.id_patient});"></i>                                    
                                       <i class="fa fa-fw fa-trash-o" onclick="deletePatientFunction(${item.id_patient});"></i>
                                    </td>
                                 </tr>
                              </c:forEach>                     
                           </tbody>
                        </table>
                        
                     </div>
                     <script>
                        
                        function deletePatientFunction(id_patient){
                           //alert("deletePatientFunction: "+id_patient);
                           //document.getElementById("formDeletingPatient").action     = a;
                           //document.getElementById("id_patient_for_delete").name  = b;
                           document.getElementById("id_patient_for_delete").value = id_patient;
                           document.getElementById("formDeletingPatient").submit();
                        }
                        function openPatient(id_patient){
                           window.open("<%=request.getContextPath()%>/patient/"+id_patient, "_self");
                        }
                        
                        $(document).ready(function() {
                           
                           // on Row Click
                           /*$('#example tbody').on('click', 'tr', function () {
                        var data = table.row( this ).data();
                        //alert( 'Data : '+data[0] );
                        f1(555);
                     } );*/
                           
                           // Setup - add a text input to each footer cell
                           $('#example tfoot th').each( function () {
                              var title = $(this).text();
                              if(title=='id')
                                 ;//$(this).html( '<input type="text" placeholder="Patient" size="7"/>' );
                              else if(title=='Patient')
                                 $(this).html( '<input type="text" placeholder="Patient" size="10"/>' );
                              else if(title=='dob')
                                 $(this).html( '<input type="text" placeholder="Date" size="10"/>' );
                              else if(title=='Fumeur')
                                 $(this).html( '<input type="text" placeholder="Fumeur" size="5"/>' );
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
                              
                              //DOM positioning
                              //"dom": '<"bottom"i>rt<"bottom"flp><"clear">',
                              
                              //Scroll - vertical
                              //"scrollY":        "500px",
                              //"scrollY":        '50vh',
                              //"scrollX": true,
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
                  
               </div><!-- /.box-footer -->
            </div><!-- /.box -->
         </div><!-- /.col -->
      </div><!-- /.row -->
         
      
   </section>
   <!-- /.content -->
</div><!-- /.content-wrapper -->
   
   
<jsp:include page="/fragments/foot.jsp" />