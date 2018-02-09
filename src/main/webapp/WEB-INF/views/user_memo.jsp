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
               
               <!-- Main row -->
               <div class="row">
                  <div class="col-md-2 "></div>
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
                  <div class="col-md-2"></div>
               </div><!-- /.row -->
                  
            </section><!-- /.content -->
         </div><!-- /.content-wrapper -->
            
            
            
         <!--  Model Add Memo  -->
         <div class="modal fade" id="modelAddMemo" role="dialog">
            <div class="modal-dialog">
               <form method="POST" action="<%=request.getContextPath()%>/addMemo">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="form" value="memo" />
                     
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
            <input type="hidden" name="form" value="memo" />            
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
            
            
         <%-- .................................................. --%>
            
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
                  <input type="hidden" name="form" value="memo" />
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