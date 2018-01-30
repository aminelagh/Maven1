<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<head>
   <meta charset="UTF-8">
   <title>${pageTitle}</title>
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
      
   <!-- Bootstrap time Picker -->
   <link href="<c:url value="/resources/timepicker/bootstrap-timepicker.min.css" />" rel="stylesheet" >
   <!-- daterange picker -->
   <link href="<c:url value="/resources/daterangepicker/daterangepicker-bs3.css" />" rel="stylesheet" >
   <!-- iCheck for checkboxes and radio inputs -->
   <link href="<c:url value="/resources/plugins/iCheck/all.css" />" rel="stylesheet" >
      
   <!-- jQuery 2.1.3 -->
   <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js" />"></script>
   <!-- dataTables -->
   <script src="<c:url value="/resources/dataTables/datatables.min.js" />"></script>
      
   <!-- Full Calendar -->
   <script src="<c:url value="/resources/fullCalendar/fullcalendar.min.css" />"></script>
   <script src="<c:url value="/resources/fullCalendar/fullcalendar.print.min.css" />"></script>
   <script src="<c:url value="/resources/fullCalendar/moment.min.js" />"></script>
   <script src="<c:url value="/resources/fullCalendar/fullcalendar.min.js" />"></script>
   <script src="<c:url value="/resources/fullCalendar/locale-all.js" />"></script>
      
   <script>      
      $(document).ready(function() {         
         $('#agenda').fullCalendar({
            locale: 'fr',            
            header: {
               left: 'prev,next today',
               center: 'title',
               right: 'listDay,listWeek,month'
            },            
            // customize the button names,
            // otherwise they'd all just say "list"
            views: {
               listDay: { buttonText: 'list day' },
               listWeek: { buttonText: 'list week' }
            },            
            defaultView: 'listWeek',
            defaultDate: '2017-12-12',
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: [
               {
                  title: 'All Day Event',
                  start: '2017-12-01'
               },
               {
                  title: 'Long Event',
                  start: '2017-12-07',
                  end: '2017-12-10'
               },                           
               {
                  title: 'Click for Google',
                  url: 'http://google.com/',
                  start: '2017-12-28'
               }
            ]
         });         
      });      
   </script> 
      
</head>