<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>AdminLTE 2 | Dashboard</title>
      <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
      <!-- Bootstrap 3.3.2 -->
      <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" > 
      <!-- FontAwesome 4.3.0 -->
      <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
      <link href="<c:url value="/resources/xxxxx" />" rel="stylesheet" >
      <!-- Ionicons 2.0.0 -->
      <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" /> 
      <link href="<c:url value="/resources/xxxxx" />" rel="stylesheet" >
      <!-- Theme style -->
      <link href="<c:url value="/resources/dist/css/AdminLTE.min.css" />" rel="stylesheet" >
      <!-- AdminLTE Skins. Choose a skin from the css/skins 
           folder instead of downloading all of them to reduce the load. -->
      <link href="<c:url value="/resources/dist/css/skins/_all-skins.min.css" />" rel="stylesheet" >
      <!-- iCheck -->    
      <link href="<c:url value="/resources/plugins/iCheck/flat/blue.css" />" rel="stylesheet" >
      <!-- Morris chart -->
      <link href="<c:url value="/resources/plugins/morris/morris.css" />" rel="stylesheet" >
      <!-- jvectormap -->
      <link href="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css" />" rel="stylesheet" >
      <!-- Date Picker -->
      <link href="<c:url value="/resources/plugins/datepicker/datepicker3.css" />" rel="stylesheet" >
      <!-- Daterange picker -->
      <link href="<c:url value="/resources/plugins/daterangepicker/daterangepicker-bs3.css" />" rel="stylesheet" >
      <!-- bootstrap wysihtml5 - text editor -->
      <link href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />" rel="stylesheet" >
      
         
      <!-- jQuery 2.1.3 -->
      <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js" />"></script>
      <!-- dataTables -->
      <script src="<c:url value="/resources/dataTables/datatables.min.js" />"></script>  
         
   </head>
   <body class="skin-blue">
      <div class="wrapper">
         
         <jsp:include page="../../fragments/menu_1.jsp" />
         
         <jsp:include page="../../fragments/menu_2.jsp" />
         
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
                                    <li><a data-toggle="modal" data-target="#modelAddPatient" onclick="document.getElementById('nom').focus();">
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
                                       <c:forEach items="${patients}" var="item">
                                          <tr>
                                             <td>${item.id_patient}</td>
                                             <td>${item.nom} ${item.prenom}</td>
                                             <td>${item.dob}</td>
                                             <td><input type="checkbox" class="minimal-red" disabled="true" ${item.isFumeur()? "checked" : "non"} /></td>
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
                                    var go = confirm("Go to info patient ?");
                                    if(go){
                                       document.getElementById("id_patient_for_delete").value = id_patient;
                                       document.getElementById("formDeletingPatient").submit();
                                    }
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
                           
                        </div>
                        <!-- /.box-footer -->
                     </div>
                     <!-- /.box -->
                     
                     <!-- Calendar -->
                     <div class="box box-solid bg-green-gradient">
                        <div class="box-header">
                           <i class="fa fa-calendar"></i>
                           <h3 class="box-title">Calendar</h3>
                           <!-- tools box -->
                           <div class="pull-right box-tools">
                              <!-- button with a dropdown -->
                              <div class="btn-group">
                                 <button class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></button>
                                 <ul class="dropdown-menu pull-right" role="menu">
                                    <li><a href="#">Add new event</a></li>
                                    <li><a href="#">Clear events</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">View calendar</a></li>
                                 </ul>
                              </div>
                              <button class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                           </div><!-- /. tools -->
                        </div><!-- /.box-header -->
                        
                        <div class="box-body no-padding">
                           <!--The calendar -->
                           <div id="calendar" style="width: 100%"></div>
                        </div><!-- /.box-body -->
                        <div class="box-footer text-black">
                           <div class="row">
                              
                              
                           </div><!-- /.row -->
                        </div>
                     </div><!-- /.box -->
                     
                  </section><!-- right col -->
               </div><!-- /.row (main row) -->
               
            </section><!-- /.content -->
         </div>
         <!-- /.content-wrapper -->
         
         <footer class="main-footer">
            <div class="pull-right hidden-xs">
               <b>Version</b> 2.0
            </div>
            <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
         </footer>
      </div>
      <!-- ./wrapper -->
      
      
      
         
      <!-- jQuery UI 1.11.2 -->
      <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
      <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
      <script>
         $.widget.bridge('uibutton', $.ui.button);
      </script>
      <!-- Bootstrap 3.3.2 JS -->  
      <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
      <!-- Morris.js charts -->
      <script src="<c:url value="/resources/plugins/morris/morris.min.js" />"></script>
      <!-- Sparkline -->
      <script src="<c:url value="/resources/plugins/sparkline/jquery.sparkline.min.js" />"></script>
      <!-- jvectormap -->
      <script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" />"></script>
      <script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" />"></script>
      <!-- jQuery Knob Chart -->
      <script src="<c:url value="/resources/plugins/knob/jquery.knob.js" />"></script>
      <!-- daterangepicker -->
      <script src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js" />"></script>
      <!-- datepicker -->
      <script src="<c:url value="/resources/plugins/datepicker/bootstrap-datepicker.js" />"></script>
      <!-- Bootstrap WYSIHTML5 -->
      <script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" />"></script>
      <!-- iCheck -->
      <script src="<c:url value="/resources/plugins/iCheck/icheck.min.js" />"></script>
      
      <!-- Slimscroll -->
      <script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js" />"></script>
      <!-- FastClick -->
      <script src='plugins/fastclick/fastclick.min.js'></script>
      <script src="<c:url value="/resources/plugins/fastclick/fastclick.min.js" />"></script>
      <!-- AdminLTE App -->
      <script src="<c:url value="/resources/dist/js/app.min.js" />"></script>
      
      <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
      <script src="<c:url value="/resources/dist/js/pages/dashboard.js" />"></script>
      
      <!-- AdminLTE for demo purposes -->
      <script src="<c:url value="/resources/dist/js/demo.js" />"></script>
      
      <!-- Alerts -->
      <script src="<c:url value="/resources/alerts/bootstrap-notify.min.js" />"></script>
      <script>
         <c:if test="${alertInfo!=null}">
            $.notify({
               message: "${alertInfo}",
               url: "${alertInfoUrl}",
               target: '_blank' //_blank | _self | _parent | _top
            },{
               // settings
               element: 'body', //position: null, // 	static | fixed | relative | absolut
               type: "info", // success | warning | info | danger
               allow_dismiss: true,
               newest_on_top: true,    showProgressbar: false,
               placement: {
                  from: "top",		//top | bottom
                  align: "center"		// left | right | center
               },
               offset: 60,             spacing: 10,
               z_index: 1031,          icon_type: 'class',        
               delay: 10000,           timer: 1000,
               url_target: '_blank',   mouse_over: 'pause',         	
               animate: { enter: 'animated zoomInDown', exit: 'animated zoomOutDown' }	
            });
         </c:if>
            
         <c:if test="${alertSuccess!=null}">
            $.notify({
               message: "${alertSuccess}",
               url: "${alertSuccessUrl}",
               target: '_blank' //_blank | _self | _parent | _top
            },{
               // settings
               element: 'body', //position: null, // 	static | fixed | relative | absolut
               type: "success", // success | warning | info | danger
               allow_dismiss: true,
               newest_on_top: true,    showProgressbar: false,
               placement: {
                  from: "top",		//top | bottom
                  align: "center"		// left | right | center
               },
               offset: 60,             spacing: 10,
               z_index: 1031,          icon_type: 'class',        
               delay: 10000,           timer: 1000,
               url_target: '_blank',   mouse_over: 'pause',         	
               animate: { enter: 'animated zoomInDown', exit: 'animated zoomOutDown' }	
            });      
         </c:if>
            
         <c:if test="${alertWarning!=null}">
            $.notify({
               message: "${alertWarning}",
               url: "${alertWarningUrl}",
               target: '_blank' //_blank | _self | _parent | _top
            },{
               // settings
               element: 'body', //position: null, // 	static | fixed | relative | absolut
               type: "warning", // success | warning | info | danger
               allow_dismiss: true,
               newest_on_top: true,    showProgressbar: false,
               placement: {
                  from: "top",		//top | bottom
                  align: "center"		// left | right | center
               },
               offset: 60,             spacing: 10,
               z_index: 1031,          icon_type: 'class',        
               delay: 10000,           timer: 1000,
               url_target: '_blank',   mouse_over: 'pause',         	
               animate: { enter: 'animated zoomInDown', exit: 'animated zoomOutDown' }	
            });      
         </c:if>
            
         <c:if test="${alertDanger!=null}">
            $.notify({
               message: "${alertDanger}",
               url: "${alertDangerUrl}",
               target: '_blank' //_blank | _self | _parent | _top
            },{
               // settings
               element: 'body', //position: null, // 	static | fixed | relative | absolut
               type: "danger", // success | warning | info | danger
               allow_dismiss: true,
               newest_on_top: true,    showProgressbar: false,
               placement: {
                  from: "top",		//top | bottom
                  align: "center"		// left | right | center
               },
               offset: 60,             spacing: 10,
               z_index: 1031,          icon_type: 'class',        
               delay: 0,           timer: 1000,
               url_target: '_blank',   mouse_over: 'pause',         	
               animate: { enter: 'animated zoomInDown', exit: 'animated zoomOutDown' }	
            });      
         </c:if>
      </script>
      
   </body>
</html>