<jsp:include page="/fragments/head.jsp" />
<!-- Right side column. Contains the navbar and content of the page -->
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
                           <li>
                              <!-- checkbox -->
                              <input type="checkbox" value="" name=""/>
                              <!-- todo text -->
                              <span class="text">Task number 3</span>
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
                              <span class="text">Task number 4</span>
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
            <!-- MAP & BOX PANE -->
            <div class="box box-success">
               <div class="box-header with-border">
                  <h3 class="box-title">Visitors Report</h3>
                  <div class="box-tools pull-right">
                     <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                     <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
               </div><!-- /.box-header -->
               <div class="box-body no-padding">
                  <div class="row">
                     <div class="col-md-9 col-sm-8">
                        <div class="pad">
                           
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
                              <li>
                                 <!-- checkbox -->
                                 <input type="checkbox" value="" name=""/>
                                 <!-- todo text -->
                                 <span class="text">Task number 3</span>
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
                                 <span class="text">Task number 4</span>
                                 <!-- Emphasis label -->
                                 <small class="label label-info"><i class="fa fa-clock-o"></i> 2 mins</small>
                                 <!-- General tools such as edit or delete-->
                                 <div class="tools">
                                    <i class="fa fa-edit"></i>
                                    <i class="fa fa-trash-o"></i>
                                 </div>
                              </li>
                           </ul>
                           
                        </div>
                     </div><!-- /.col -->
                        
                  </div><!-- /.row -->
               </div><!-- /.box-body -->
            </div><!-- /.box -->
               
         </div><!-- /.col -->
            
         <div class="col-md-4">
            <!-- Info Boxes Style 2 -->
            <div class="info-box bg-yellow">
               <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
               <div class="info-box-content">
                  <span class="info-box-text">Inventory</span>
                  <span class="info-box-number">5,200</span>
                  <div class="progress">
                     <div class="progress-bar" style="width: 50%"></div>
                  </div>
                  <span class="progress-description">
                     50% Increase in 30 Days
                  </span>
               </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
            <div class="info-box bg-green">
               <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>
               <div class="info-box-content">
                  <span class="info-box-text">Mentions</span>
                  <span class="info-box-number">92,050</span>
                  <div class="progress">
                     <div class="progress-bar" style="width: 20%"></div>
                  </div>
                  <span class="progress-description">
                     20% Increase in 30 Days
                  </span>
               </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
            <div class="info-box bg-red">
               <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>
               <div class="info-box-content">
                  <span class="info-box-text">Downloads</span>
                  <span class="info-box-number">114,381</span>
                  <div class="progress">
                     <div class="progress-bar" style="width: 70%"></div>
                  </div>
                  <span class="progress-description">
                     70% Increase in 30 Days
                  </span>
               </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
            <div class="info-box bg-aqua">
               <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>
               <div class="info-box-content">
                  <span class="info-box-text">Direct Messages</span>
                  <span class="info-box-number">163,921</span>
                  <div class="progress">
                     <div class="progress-bar" style="width: 40%"></div>
                  </div>
                  <span class="progress-description">
                     40% Increase in 30 Days
                  </span>
               </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
         </div><!-- /.col -->
      </div><!-- /.row -->
         
   </section><!-- /.content -->
</div><!-- /.content-wrapper -->
   
   
<jsp:include page="/fragments/foot.jsp" />