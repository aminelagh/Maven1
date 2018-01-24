<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="main-footer">
   <div class="pull-right hidden-xs">
      <b>Version</b> 1.0
   </div>
   <strong>Copyright &copy; 2018 <a href="mailto:amine.laghlabi@gmail.com">Amine Laghlabi</a>.</strong> All rights reserved.
</footer>

</div>
<!-- ./wrapper -->

<!-- Bootstrap template -->
<script src="<c:url value="/resources/xxxxx" />"></script>

<!-- iCheck 1.0.1 -->
<script src="<c:url value="/resources/plugins/iCheck/icheck.min.js" />"></script>
<!-- For CheckBox -->
<script type="text/javascript">
   $(function () {      
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

<!-- Bootstrap 3.3.2 JS -->
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
<!-- SlimScroll -->
<script src="<c:url value="/resources/plugins/slimScroll/jquery.slimScroll.min.js" />"></script>
<!-- FastClick -->
<script src="<c:url value="/resources/plugins/fastclick/fastclick.min.js" />"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/dist/js/app.min.js" />"></script>


</body>
</html>
