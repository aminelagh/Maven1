<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
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
   
<!-- date-range-picker -->
<script src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js" />"></script>
<!-- bootstrap color picker -->
<script src="<c:url value="/resources/colorpicker/bootstrap-colorpicker.min.js" />"></script>
<!-- bootstrap time picker -->
<script src="<c:url value="/resources/timepicker/bootstrap-timepicker.min.js" />"></script>
   
   
<!-- Bootstrap WYSIHTML5 -->
<script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" />"></script>
<!-- iCheck -->
<script src="<c:url value="/resources/plugins/iCheck/icheck.min.js" />"></script>   
<!-- Slimscroll -->
<script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js" />"></script>
<!-- FastClick -->
<script src="<c:url value="/resources/plugins/fastclick/fastclick.min.js" />"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/dist/js/app.min.js" />"></script>
   
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value="/resources/dist/js/pages/dashboard.js" />"></script>
   
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/resources/dist/js/demo.js" />"></script>
   
   
   
<script type="text/javascript">
   $(function () {
      //Datemask dd/mm/yyyy
      $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
      //Datemask2 mm/dd/yyyy
      $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
      //Money Euro
      $("[data-mask]").inputmask();
      
      //Date range picker
      $('#reservation').daterangepicker();
      //Date range picker with time picker
      $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
      //Date range as a button
      $('#daterange-btn').daterangepicker(
              {
                 ranges: {
                    'Today': [moment(), moment()],
            'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
            'Last 7 Days': [moment().subtract('days', 6), moment()],
            'Last 30 Days': [moment().subtract('days', 29), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
         },
         startDate: moment().subtract('days', 29),
         endDate: moment()
      },
      function (start, end) {
         $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
              );
      
      //iCheck for checkbox and radio inputs
      $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
         checkboxClass: 'icheckbox_minimal-blue',
         radioClass: 'iradio_minimal-blue'
      });
      //Red color scheme for iCheck
      $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
         checkboxClass: 'icheckbox_minimal-red',
         radioClass: 'iradio_minimal-red'
      });
      //Flat red color scheme for iCheck
      $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
         checkboxClass: 'icheckbox_flat-green',
         radioClass: 'iradio_flat-green'
      });
      
      //Colorpicker
      $(".my-colorpicker1").colorpicker();
      //color picker with addon
      $(".my-colorpicker2").colorpicker();
      
      //Timepicker
      $(".timepicker").timepicker({
         showInputs: false
      });
   });
</script>
   
   
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