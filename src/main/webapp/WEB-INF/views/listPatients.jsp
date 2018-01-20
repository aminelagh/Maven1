   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/fragments/header.jsp" />

<div class="container">
   <div class="row">
      <div class="col-lg-12">
         <div class="page-header">
            <h1 id="tables">Mes Patients</h1>               
         </div>            
            
         <form id="formDeletingPatient" method="POST" action="<%=request.getContextPath()%>/patient/delete">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />            
            <input type="hidden" id="id_patient_for_delete" name="id_patient" />               
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
                        <td><a href="<%=request.getContextPath()%>/patient/${item.id_patient}">info</a> / 
                           <a href=""><i class="fa fa-fw fa-trash-o"></i></a>
                        </td>                     
                     </tr>
                  </c:forEach>                     
               </tbody>
            </table>
         </form>
               
               
               
      </div>
   </div>
      
      
</div>

<script src="<c:url value="/resources/datatables/datatables.min.js" />"></script>
   
   
<script>
   $(function() {
      function deletePatientFunction(id_patient){
         //alert("deletePatientFunction: "+id_patient);
         //document.getElementById("formDeletingPatient").action     = a;
         //document.getElementById("id_patient_for_delete").name  = b;
         document.getElementById("id_patient_for_delete").value = id_patient;
         document.getElementById("formDeletingPatient").submit();
      }
      
      
      $(document).ready(function() {
         
         $('#example tbody').on('click', 'tr', function () {
            var data = table.row( this ).data();
            alert( 'id_patient : '+data[0] );
            deletePatientFunction(id_patient);
         } );
         
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
         
         //Highlighting rows and columns
         /*
      $('#example tbody').on( 'mouseenter', 'td', function () {
         var colIdx = table.cell(this).index().column;
         
         $( table.cells().nodes() ).removeClass( 'highlight' );
         $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
      } );
          */
         
         var table = $('#example').DataTable( {
            
            //"autoWidth": true,
            "dom": '<lf<t>ip>',
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
               "thousands": ".",
            },
            "columnDefs": [
               //{ "targets":  -1 , "visible": true },
               { "targets": [ 0 ], "visible": true, "searchable": false ,"width": "20%"},
               { "targets": [ 1 ], "visible": true, "searchable": false ,"width": "20%"},
               { "targets": [ 2,3 ], "visible": true, "searchable": false ,"width": "20%"},
               { "targets": [ 4 ], "visible": true }
            ],
            
            //Row created callback
            "createdRow": function ( row, data, index ) {
               if ( data[0].replace(/[\$,]/g, '') * 1 > 200000 ) {
                  $('td', row).eq(0).addClass('highlight');
               }
            },
            
            
            //DOM positioning
            //"dom": '<"bottom"i>rt<"bottom"flp><"clear">',
            
            //Scroll - vertical
            //"scrollY":        "500px",
            //"scrollY":        '50vh',
            //"scrollX": true,
            //"scrollCollapse": false,
            
            
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

<jsp:include page="/fragments/footer.jsp" />