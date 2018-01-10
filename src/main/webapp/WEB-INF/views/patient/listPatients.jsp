   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/fragments/header.jsp" />

<div class="container">     
   
   <div class="bs-docs-section">    
      <div class="row">
         <div class="col-lg-12">
            <div class="page-header">
               <h1 id="tables">Mes Patients</h1>
               
               <c:if test="${errorMessage!=null}" >
                  <div class="alert alert-warning alert-dismissible fade show" role="alert">${errorMessage}</div>
               </c:if>
               <c:if test="${errorMessage!=null}" >
                  <div class="alert alert-warning alert-dismissible fade show" role="alert">${errorMessage}</div>
               </c:if>
               <c:if test="${successMessage!=null}" >
                  <div class="alert alert-success alert-dismissible fade show" role="alert">${successMessage}</div>
               </c:if>
               
            </div>
            
            <div id="jsGridPatients"></div>
            
            <form id="formDeletingPatient" method="POST" action="<%=request.getContextPath()%>/patient/delete">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />            
               <input type="hidden" id="id_patient_for_delete" name="id_patient" />
               
            </form>
            
            <script>      
               $(function() {
                  function deletePatientFunction(id_patient){
                     document.getElementById("id_patient_for_delete").value = id_patient;
                     document.getElementById("formDeletingPatient").submit();
                  }
                  
                  $("#jsGridPatients").jsGrid({
                     heading: true,
                     // height: "70%",
                     width: "100%",
                     filtering: true,
                     editing: true,
                     sorting: true,
                     paging: true,
                     autoload: true,
                     pageSize: 15,
                     pageButtonCount: 5,
                     inserting: false,
                     editing: false,
                     selecting: true,              
                     
                     //add new items form requirement:
                     fields: [
                        { name: "id_patient", type: "number", width: 80, visible: false },
                        { name: "patient", type: "text", width: 80 },
                        { name: "dob", type: "text", width: 50, title: "Date de naissance" },
                        { name: "CIN", type: "text", width: 30, align: "right" },
                        { name: "Adresse", type: "text", width: 120 },
                        { name: "Fumeur", type: "checkbox", title: "Fumeur", sorting: true, width: 20 },
                        { type: "control", modeSwitchButton: true, editButton: false, deleteButton: true, width: 20 }
                     ],
                     
                     //new staff
                     pagerContainer: null,
                     pageIndex: 1,	//page a l'ouverture
                     pagerFormat: "Pages: {first} {prev} {pages} {next} {last}    {pageIndex} of {pageCount}",
                     pagePrevText: "Precedent",
                     pageNextText: "Suivant",
                     pageFirstText: "Premier",
                     pageLastText: "Dernier",
                     pageNavigatorNextText: "...",
                     pageNavigatorPrevText: "...",
                     
                     //Delete staff
                     confirmDeleting: true,
                     deleteConfirm: "Êtes-vous sur de vouloir supprimer ce patient?",
                     onItemDeleting: function(args) {
                        // cancel deletion of the item with 'protected' field
                        if(args.item.protected) {
                           args.cancel = true;
                           
                        }else{deletePatientFunction(args.item.id_patient);}
                     },
                     
                     
                     //data from database
                     data: 
                             [
                        {
                           "id_patient": 111,
                           "patient": "222",
                           "dob": "333",
                           "CIN": "444",
                           "Adresse": "555",
                           "Fumeur": true
                        },
                        
               <c:forEach items="${patients}" var="patient">
                           {
                              "id_patient": ${patient.id_patient},
                              "patient": "${patient.nom} ${patient.prenom}",
                              "dob": "${patient.dob}",
                              "CIN": "${patient.cin}",
                              "Adresse": "${patient.adresse}",
                              "Fumeur": ${patient.fumeur}
                           },
               </c:forEach>
                           
                        ]            
                        
                        
                     });
                     
                     $(".config-panel input[type=checkbox]").on("click", function() {
                        var $cb = $(this);
                        $("#jsGridPatients").jsGrid("option", $cb.attr("id"), $cb.is(":checked"));
                     });
                     
                  });
            </script>
            
            
            
         </div>
      </div>
   </div>
   
</div>

<jsp:include page="/fragments/footer.jsp" />