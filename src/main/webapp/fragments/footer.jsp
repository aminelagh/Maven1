<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Bootstrap template -->
<script src="<c:url value="/resources/vendor/popper.js/dist/umd/popper.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/dist/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/custom.js" />"></script>


<!-- for alerts -->
<script src="<c:url value="/resources/js/bootstrap-notify.min.js" />"></script>


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
