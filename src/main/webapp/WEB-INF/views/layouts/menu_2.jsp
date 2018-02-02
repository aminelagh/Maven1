<!-- Menu 2 -->
<aside class="main-sidebar">
   <!-- sidebar: style can be found in sidebar.less -->
   <section class="sidebar">
      
      <!-- Sidebar user panel -->
      <div class="user-panel">
         <div class="pull-left image">
            <!--img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" /-->
         </div>
         <div class="pull-left info">
            <p>${$currentUser.nom} ${$currentUser.prenom}</p>
            <!--a href="#"><i class="fa fa-circle text-success"></i> Online</a-->
         </div>
      </div>
      
      <!-- search form --
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search..."/>
          <span class="input-group-btn">
            <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
          </span>
        </div>
      </form>
      <!-- /.search form -->
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
         <li class="header">Menu</li>
         
         <!-- /.Menu patient -->
         <li class="treeview active">
            <a href="#">
               <i class="fa fa-dashboard"></i> <span>Patient</span> <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
               <li><a href="/Maven1/addPatient"><i class="fa fa-circle-o"></i> Nouveau patient</a></li>
               <li><a href="<%=request.getContextPath()%>/patients"><i class="fa fa-circle-o"></i> Liste des patients</a></li>
            </ul>
         </li>
         
         <li><a href="<%=request.getContextPath()%>/patients"><i class="fa fa-book"></i> Mes patients</a></li>
         
         
         <li><a href=""><i class="fa fa-book"></i> Mes rendez-vous</a></li>
         <li class="header">Alerts</li>
         <li><a href="#"><i class="fa fa-circle-o text-danger"></i> Important</a></li>
         <li><a href="#"><i class="fa fa-circle-o text-warning"></i> Warning</a></li>
         <li><a href="#"><i class="fa fa-circle-o text-info"></i> Information</a></li>
         
      </ul>
   </section>
   <!-- /.sidebar -->
</aside>
<!-- ./ Menu 2 -->