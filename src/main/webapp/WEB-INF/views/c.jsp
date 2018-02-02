<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset='utf-8' />
      <title>Calendar</title>
         
      <link href="<c:url value="/resources/fullCalendar/fullcalendar.min.css" />" rel='stylesheet' />
         
      <!-- jQuery 2.1.3 -->
      <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js" />"></script>
         
      <script src="<c:url value="/resources/fullCalendar/moment.min.js" />"></script>     
         
      <script src="<c:url value="/resources/fullCalendar/fullcalendar.min.js" />"></script>
      <script src="<c:url value="/resources/fullCalendar/locale-all.js" />"></script>
         
      <script>      
         $(document).ready(function() {         
            $('#calendar').fullCalendar({
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
                     start: '2017-12-10'
                  },
                  {
                     title: 'Long Event',
                     start: '2017-12-11',
                     end: '2017-12-11'
                  },                           
                  {
                     title: 'Click for Google',
                     url: 'http://google.com/',
                     start: '2017-12-12'
                  }
               ]
            });         
         });      
      </script> 
         
   </head>
   <body>
      
      <div id='calendar'></div>
         
      <hr>
         
   </body>
</html>
   
<!--
   
      <script src="<c:url value="/resources/fullCalendar/fullcalendar.min.css" />"></script>
      <script src="<c:url value="/resources/fullCalendar/fullcalendar.print.min.css" />"></script>
<!-- jQuery 2.1.3 --
<script src="<c:url value="/resources/fullCalendar/jquery.min.js" />"></script>
<script src="<c:url value="/resources/fullCalendar/moment.min.js" />"></script>
<script src="<c:url value="/resources/fullCalendar/fullcalendar.min.js" />"></script>
<script src="<c:url value="/resources/fullCalendar/locale-all.js" />"></script>
   
   
-->