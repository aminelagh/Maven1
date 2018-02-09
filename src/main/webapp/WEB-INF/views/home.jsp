<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <jsp:include page="layouts/header.jsp" />
      
   <body class="skin-blue">
      <div class="wrapper">
         
         <jsp:include page="layouts/menu_1.jsp" />
            
         <jsp:include page="layouts/menu_2.jsp" />
            
            
         <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
               <h1>Bienvenue</h1>
               <ol class="breadcrumb">
                  <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                  <li class="active">Dashboard</li>
               </ol>
            </section>
               
            <!-- Main content -->
            <section class="content">
               
               <!-- Info boxes -->
               <div class="row">
                  <div class="col-md-3 col-sm-6 col-xs-12">
                     <div class="info-box">
                        <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
                        <div class="info-box-content">
                           <span class="info-box-text">CPU Traffic</span>
                           <span class="info-box-number">90<small>%</small></span>
                        </div><!-- /.info-box-content -->
                     </div><!-- /.info-box -->
                  </div><!-- /.col -->
                  <div class="col-md-3 col-sm-6 col-xs-12">
                     <div class="info-box">
                        <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>
                        <div class="info-box-content">
                           <span class="info-box-text">Likes</span>
                           <span class="info-box-number">41,410</span>
                        </div><!-- /.info-box-content -->
                     </div><!-- /.info-box -->
                  </div><!-- /.col -->
                     
                  <!-- fix for small devices only -->
                  <div class="clearfix visible-sm-block"></div>
                     
                  <div class="col-md-3 col-sm-6 col-xs-12">
                     <div class="info-box">
                        <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>
                        <div class="info-box-content">
                           <span class="info-box-text">Sales</span>
                           <span class="info-box-number">760</span>
                        </div><!-- /.info-box-content -->
                     </div><!-- /.info-box -->
                  </div><!-- /.col -->
                  <div class="col-md-3 col-sm-6 col-xs-12">
                     <div class="info-box">
                        <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
                        <div class="info-box-content">
                           <span class="info-box-text">New Members</span>
                           <span class="info-box-number">2,000</span>
                        </div><!-- /.info-box-content -->
                     </div><!-- /.info-box -->
                  </div><!-- /.col -->
               </div><!-- /.row -->
                  
               <div class="row">
                  <div class="col-md-12">
                     <div class="box">
                        <div class="box-header with-border">
                           <h3 class="box-title">Monthly Recap Report</h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                 </ul>
                              </div>
                              <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                           </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                           <div class="row">
                              <div class="col-md-8">
                                 <p class="text-center">
                                    <strong>To Do List</strong>
                                 </p>
                                    
                                 <ul class="todo-list">
                                    <li>
                                       <!-- checkbox -->
                                       <input type="checkbox" value="" name=""/>
                                       <!-- todo text -->
                                       <span class="text">Task number 1</span>
                                       <!-- Emphasis label -->
                                       <small class="label label-info"><i class="fa fa-clock-o"></i> 2 mins</small>
                                       <!-- General tools such as edit or delete-->
                                       <div class="tools">
                                          <i class="fa fa-edit"></i>
                                          <i class="fa fa-trash-o"></i>
                                       </div>
                                    </li>
                                    <li>
                                       <!-- checkbox -->
                                       <input type="checkbox" value="" name=""/>
                                       <!-- todo text -->
                                       <span class="text">Task number 2</span>
                                       <!-- Emphasis label -->
                                       <small class="label label-info"><i class="fa fa-clock-o"></i> 2 mins</small>
                                       <!-- General tools such as edit or delete-->
                                       <div class="tools">
                                          <i class="fa fa-edit"></i>
                                          <i class="fa fa-trash-o"></i>
                                       </div>
                                    </li>
                                 </ul>
                                    
                              </div><!-- /.col -->
                              <div class="col-md-4">
                                 <p class="text-center">
                                    <strong>Goal Completion</strong>
                                 </p>
                                 <div class="progress-group">
                                    <span class="progress-text">Add Products to Cart</span>
                                    <span class="progress-number"><b>160</b>/200</span>
                                    <div class="progress sm">
                                       <div class="progress-bar progress-bar-aqua" style="width: 80%"></div>
                                    </div>
                                 </div>
                                 <!-- /.progress-group -->
                              </div>
                              <!-- /.col -->
                           </div><!-- /.row -->
                        </div><!-- ./box-body -->
                        <div class="box-footer">
                           <div class="row">
                              <div class="col-sm-3 col-xs-6">
                                 <div class="description-block border-right">
                                    <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 17%</span>
                                    <h5 class="description-header">$35,210.43</h5>
                                    <span class="description-text">TOTAL REVENUE</span>
                                 </div><!-- /.description-block -->
                              </div><!-- /.col -->
                              <div class="col-sm-3 col-xs-6"></div>
                              <div class="col-sm-3 col-xs-6"></div>
                              <div class="col-sm-3 col-xs-6">
                                 <div class="description-block border-right">
                                    <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 17%</span>
                                    <h5 class="description-header">$35,210.43</h5>
                                    <span class="description-text">TOTAL REVENUE</span>
                                 </div><!-- /.description-block -->
                              </div><!-- /.col -->
                           </div><!-- /.row -->
                        </div><!-- /.box-footer -->
                     </div><!-- /.box -->
                  </div><!-- /.col -->
               </div><!-- /.row -->
                  
               <!-- Main row -->
               <div class="row">
                  <!-- Left col -->
                  <div class="col-md-8">
                     <!-- Memos -->
                     <div class="box box-success">
                        <div class="box-header with-border">
                           <h3 class="box-title">Mes Notes</h3>
                           <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                              <div class="btn-group">
                                 <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                 <ul class="dropdown-menu" role="menu">
                                    <li><a data-toggle="modal" data-target="#modelAddMemo"><i class="fa fa-fw fa-plus"></i> Ajouter</a></li>
                                    <li><a href="/Maven1/memo"><i class="fa fa-fw fa-bars"></i> Mes notes</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Imprimer la liste</a></li>
                                 </ul>
                              </div>
                              <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                           </div>
                        </div><!-- /.box-header -->
                        <div class="box-body no-padding">
                           <div class="row">
                              <div class="col-md-9 col-sm-8">
                                 <div class="pad">
                                    <ul class="todo-list">
                                       
                                       <c:if test="${memos.size()==0}">
                                          <li>
                                             <i>Aucune note</i>
                                          </li>
                                       </c:if>
                                          
                                       <%-- if list have more than 5 lines, create a list named "memos" with the first 5 --%>
                                       <c:if test="${memos.size()>5}">
                                          <c:set var="memos" value="${memos.subList(0,5)}" />
                                       </c:if>
                                          
                                       <c:if test="${memos.size()!=0}">
                                          <c:forEach items="${memos}" var="item">
                                             <li>                                             
                                                <!-- checkbox -->
                                                <input type="checkbox" name="id_memo[${item.id_memo}]"/>
                                                <span class="text">${item.description}</span>
                                                <small class="label label-info"><i class="fa fa-clock-o"></i> ${item.created_at}</small>
                                                   
                                                <div class="tools">
                                                   <i class="fa fa-edit" data-toggle="modal" data-target="#modalUpdateMemo" onclick='updateMemo(${item.id_memo},"${item.description}");'></i>
                                                   <i class="fa fa-trash-o" onclick="deleteMemoFunction(${item.id_memo},'${item.description}');" ></i>
                                                </div>
                                             </li>  
                                          </c:forEach>
                                       </c:if>
                                          
                                    </ul>
                                       
                                 </div>
                              </div><!-- /.col -->
                                 
                           </div><!-- /.row -->
                        </div><!-- /.box-body -->
                     </div>
                     <!-- /.Memos -->
                  </div><!-- /.col -->
                     
               </div><!-- /.row -->
                  
            </section><!-- /.content -->
         </div><!-- /.content-wrapper -->
            
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Patient @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <!--  Model Add patient  -->
         <div class="modal fade" id="modelAddPatient" role="dialog">
            <div class="modal-dialog">
               <!-- Form begin  addPrescription -->
               <form method="POST" action="<%=request.getContextPath()%>/addPatient">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="home" />
                     
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Création d'un nouveau Patient</h4>
                     </div>
                        
                     <div class="modal-body">
                        <div class="row"> 
                           
                           <div class="col-lg-6">                  
                              <div class="form-group">
                                 <label>Nom</label>
                                 <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" value="${patient.nom}" required/>
                                 <small id="emailHelp" class="form-text text-muted">required</small>
                              </div>              
                              <div class="form-group">
                                 <label>Prénom</label>
                                 <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Prénom" value="${patient.prenom}" />
                              </div>  
                              <div class="form-group">
                                 <label>Date de naissance</label>
                                 <input type="text" class="form-control" id="dob" name="dob" placeholder="Date de naissance" value="${patient.dob}" />
                              </div>                          
                           </div>
                              
                           <div class="col-lg-6">                  
                              <div class="form-group">
                                 <label>CIN</label>
                                 <input type="text" class="form-control" id="cin" name="cin" placeholder="CIN" value="${patient.cin}" />
                              </div>              
                              <div class="form-group">
                                 <label>Adresse</label>
                                 <input type="text" class="form-control" id="adresse" name="adresse" placeholder="Adresse" value="${patient.adresse}" />
                              </div>  
                              <div class="form-group">
                                 <label>
                                    <input type="checkbox" class="flat-red" name="fumeur" <c:if test="${patient.fumeur==true}">checked</c:if> />
                                       Fumeur
                                    </label>
                                 </div>                              
                                    
                              </div>
                           </div> 
                        </div>
                        <!-- modal-footer -->
                        <div class="modal-footer">
                           <div class="col-md-2">
                              <div class="form-group">               
                                 <button type="submit" class="btn btn-primary">Ajouter</button>  
                              </div>  
                           </div>
                           <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                        </div>
                           
                     </div>
                  </form>
               </div>
            </div>
               
               
               
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Memo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
         <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>
            
         <!--  Model Add Memo  -->
         <div class="modal fade" id="modelAddMemo" role="dialog">
            <div class="modal-dialog">
               <form method="POST" action="<%=request.getContextPath()%>/addMemo">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="home" />
                     
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Création d'une nouvelle note</h4>
                     </div>
                        
                     <div class="modal-body">
                        <div class="row"> 
                           
                           <div class="col-lg-12">                  
                              <div class="form-group">
                                 <label>Note</label>
                                 <textarea class="form-control" name="description" placeholder="Note" rows="2"></textarea>
                              </div>              
                                 
                           </div>
                        </div> 
                     </div>
                        
                     <div class="modal-footer">
                        <div class="col-md-2">
                           <div class="form-group">               
                              <button type="submit" class="btn btn-primary">Ajouter</button>  
                           </div>  
                        </div>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                     </div>
                        
                  </div>
               </form>
            </div>
         </div>
            
         <%-- Form delete Note --%>
         <form id="formDeleteMemo" method="POST" action="<%=request.getContextPath()%>/deleteMemo">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="form" value="home" />            
            <input type="hidden" id="id_memo" name="id_memo" />        
         </form>   
         <script>         
            function deleteMemoFunction(id_memo, description){
               var go = confirm('Vos êtes sur les points d\'effacer la note "'+description+'".\n voulez-vous continuer?');
               if(go){                  
                  document.getElementById("id_memo").value = id_memo;
                  document.getElementById("formDeleteMemo").submit();
               }
            }
         </script>
            
         <!--  Model Update Memo  -->
         <script>         
            function updateMemo(id_memo, description){
               document.getElementById("updateID_memo").value = id_memo; 
               document.getElementById("updateMemoDescription").value = description;      
            }
         </script> 
         <div class="modal fade" id="modalUpdateMemo" role="dialog">
            <div class="modal-dialog">
               
               <form method="POST" action="<%=request.getContextPath()%>/updateMemo">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="home" />
                  <input type="hidden" name="id_memo" id="updateID_memo" />
                     
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modification de la note</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <label>Description</label>
                                 <textarea required="true" class="form-control" name="description" id="updateMemoDescription" placeholder="Description" rows="2"  required="true"></textarea>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer">
                        <div class="col-md-2">
                           <div class="form-group">               
                              <button type="submit" class="btn btn-primary">Modifier</button>  
                           </div>  
                        </div>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
         <!--  /.Model update Memo  -->
            
            
         <jsp:include page="layouts/footer.jsp" />
            
            
            
      </div>
      <!-- ./wrapper -->
         
      <jsp:include page="layouts/scripts.jsp" />
         
   </body>
</html>