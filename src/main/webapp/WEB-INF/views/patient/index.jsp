<jsp:include page="/fragments/head.jsp" />
   
<!-- content-wrappe -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>
         Blank page
         <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
         <li><a href=""><i class="fa fa-dashboard"></i> Accueil</a></li>
         <li><a href="">Examples</a></li>
         <li class="active">Blank page</li>
      </ol>
   </section>
      
   <!-- section content -->
   <section class="content">
      
      <!-- box -->
      <div class="box">
         <div class="box-header with-border">
            <h3 class="box-title">Title</h3>
            <div class="box-tools pull-right">
               <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
               <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
         </div>
         <div class="box-body">
            Start creating your amazing application!
         </div>
         <div class="box-footer">
            Footer
         </div>
      </div>
      <!-- /.box -->
         
      <div class="row">         
         <div class="box">
            <div class="col-lg-12">
               
               <table id="example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                  <thead>
                     <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                     </tr>
                  </thead>
                  <tfoot>
                     <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                     </tr>
                  </tfoot>
                  <tbody>
                     <tr>
                        <td>Tiger Nixon</td>
                        <td>System Architect</td>
                        <td>Edinburgh</td>
                        <td>61</td>
                        <td>2011/04/25</td>
                        <td>$320,800</td>
                     </tr>
                     <tr>
                        <td>Donna Snider</td>
                        <td>Customer Support</td>
                        <td>New York</td>
                        <td>27</td>
                        <td>2011/01/25</td>
                        <td>$112,000</td>
                     </tr>
                  </tbody>
               </table>       
                  
               <script>                  
                  $(document).ready(function() {
                     
                     $('#example tbody').on('click', 'tr', function () {
                        var data = table.row( this ).data();
                        alert( 'Data : '+data[0] );
                     } );
                     
                     
                     
                     // Setup - add a text input to each footer cell
                     $('#example tfoot th').each( function () {
                        var title = $(this).text();
                        $(this).html( '<input type="text" placeholder="Search '+title+'" size="7"/>' );
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
                        
                        //"dom": '<lfr<t>ip>',
                        "dom": 
                                "<'row'<'col-sm-6'l><'col-sm-2'><'col-sm-4'f>>" +
                                "<'row'<'col-sm-12'tr>>" +
                                "<'row'<'col-sm-1'i><'col-sm-3'><'col-sm-8'p>>",
                        
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
                           { "targets":  -1 , "visible": true },
                           { "targets": [ 0 ], "visible": true, "searchable": true },
                           { "targets": [ 3 ], "visible": true }
                        ],
                        
                        //Row created callback
                        "createdRow": function ( row, data, index ) {
                           if ( data[5].replace(/[\$,]/g, '') * 1 > 200000 ) {
                              $('td', row).eq(5).addClass('highlight');
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
                  
            </div>
         </div>
      </div>
   </section>
   <!-- /.section content -->
</div>
<!-- /.content-wrapper -->
   
<jsp:include page="/fragments/foot.jsp" />