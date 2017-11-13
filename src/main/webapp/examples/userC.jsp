
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

	<title>Update Profile</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="../assets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../dist/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css">    
    <link rel="stylesheet" href="http://getbootstrap.com/2.3.2/assets/css/docs.css">
    <link rel="stylesheet" href="assets/app.css">
</head>
<style type="text/css">
	.select-wrapper {
    background: url(../assets/img/faces/edit.png) no-repeat;
    background-size: cover;
    display: block;
    position: relative;
    width: 15px;
    height: 26px;
}
#image_src {
    width: 26px;
    height: 26px;
    margin-right: 100px;
    opacity: 0;
 
</style>
<%
    String name = (String) session.getAttribute("name");
    String cid = (String) session.getAttribute("cid");
    String tbranch = (String) session.getAttribute("tbranch");
    String email = (String) session.getAttribute("email");
    String pass = (String) session.getAttribute("pass");
    String address = (String) session.getAttribute("address");
    String city = (String) session.getAttribute("city");
    String country = (String) session.getAttribute("country");
    String no = (String) session.getAttribute("no");
    String vacancy = (String) session.getAttribute("vacancy");
    String cname = (String) session.getAttribute("cname");
    String pack = (String) session.getAttribute("pack");
    String abtme = (String) session.getAttribute("abtme");
    String category = (String) session.getAttribute("category");
%>
<body ng-app="myApp" ng-controller="myCtrl" style="padding-top: 0px;">

	<div class="wrapper">
	    <div class="sidebar" data-color="blue" data-image="../assets/img/sidebar-1.jpg">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo">
				<a class="simple-text">
					<%=name%>
				</a>
			</div>

	    	<div class="sidebar-wrapper">
				<ul class="nav">
	                <li>
	                    <a href="dashC.jsp">
	                        <i class="material-icons">dashboard</i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a href="userC.jsp">
	                        <i class="material-icons">person</i>
	                        <p>User Profile</p>
	                    </a>
	                </li>
	                <li class="active-pro">
	                    <a href="../index.jsp">
	                        <i class="material-icons">unarchive</i>
	                        <p>Sign Out</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>

	    <div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Profile</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="dashboard.jsp" onclick="go();" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
								</a>
							</li>
							<!-- <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="hidden-lg hidden-md">Notifications</p>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">Mike John responded to your email</a></li>
									<li><a href="#">You have 5 new tasks</a></li>
									<li><a href="#">You're now friend with Andrew</a></li>
									<li><a href="#">Another Notification</a></li>
									<li><a href="#">Another One</a></li>
								</ul>
							</li> -->
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
	 							   <i class="material-icons">person</i>
	 							   <p class="hidden-lg hidden-md">Profile</p>
	 						   </a>
							</li>
						</ul>

						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
								<input type="text" class="form-control" id="search" name="search" placeholder="Search"/>
								<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i><div class="ripple-container"></div>
							</button>
						</form>
					</div>
				</div>
			</nav>

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-8">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">Edit Profile</h4>
									<p class="category">Complete your profile</p>
	                            </div>
	                            <div class="card-content">
	                                <form action="../UserC" method="Post">
	                                    <div class="row">
	                                       
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">Company ID</label>
                                                                                                        <input type="text" name="cid" value="<%=cid%>" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Email address</label>
                                                                                                        <input type="email" name="email" value="<%=email%>" class="form-control" >
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-12">
												<div class="form-group label-floating">
													<label class="control-label">Name</label>
                                                                                                        <input type="text" name="name" value="<%=name%>" class="form-control" >
												</div>
	                                        </div>
	                                     </div>
	                                    <div class="row">
	                                        <div class="col-md-12">
												<div class="form-group label-floating">
													<label class="control-label">Address</label>
													<input type="text" name="address" value="<%=address%>" class="form-control" >
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">City</label>
													<input type="text" name="city" value="<%=city%>" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Country</label>
													<input type="text" name="country" value="<%=country%>" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Contact No.</label>
													<input type="text" name="no" value="<%=no%>" class="form-control" >
												</div>
	                                        </div>
	                                    </div>
	                                     <div class="row">
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Vacancy</label>
													<input type="text" name="vacancy" value="<%=vacancy%>" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">CEO Name</label>
													<input type="text" name="cname" value="<%=cname%>" class="form-control" >
												</div>
	                                        </div>
	                                     	<div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Package</label>
													<input type="text" name="pack" value="<%=pack%>" class="form-control"/>
													
												</div>
	                                        </div>
	                                	</div>
										<div class="row">
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Old Password</label>
                                                                                                        <input type="password" name="opass" value="<%=pass%>" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">New Password</label>
													<input type="password" name="npass" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Confirm Password</label>
													<input type="password" name="cpass" class="form-control" >
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-12">
												<div class="form-group label-floating">
													<label class="control-label">Technical Field</label>
													<input type="text" name="tbranch" value="<%=tbranch%>" class="form-control" data-role="tagsinput">
												</div>
	                                        </div>
	                                     </div>
	                                    <div class="row">
	                                        <div class="col-md-12">
	                                            <div class="form-group">
													<div class="form-group label-floating">
									    				<label class="control-label"> About the Company</label>
								    					<textarea class="form-control" name="abtme" rows="5"><%=abtme%></textarea>
		                        					</div>
	                                            </div>
	                                        </div>
	                                    </div>

	                                    <button type="submit" class="btn btn-primary pull-right">Update Profile</button>
	                                    <div class="clearfix"></div>
	                                </form>
	                            </div>
	                        </div>
	                    </div>
						<div class="col-md-4">
    						<form action="../Image" method="Post" enctype="multipart/form-data">
    							<div class="card card-profile">
    								<div class="card-avatar">
    									<a href="#pablo">
    									<img class="img" src="image.jsp?imgid=<%=name%>" id="blah"/>
    									</a>
    								</div>
    								<span class="select-wrapper" style="margin-left:160px; margin-top: -25px;">
    										<input type="file" name="image" id="image_src" onchange="readURL(this);">
    									</span>

    							<div class="content">
    								<h6 class="category text-gray"><%=category%></h6>
    								<h4 class="card-title"><%=name%></h4>
    								<p class="card-content"><%=abtme%></p>
    								<button type="submit" class="btn btn-primary btn-round">Update Picture</button>
    							</div>
    						</div>
    						</form>
		    			</div>
	                </div>
	            </div>
	        </div>

	        <footer class="footer">
	            <div class="container-fluid">
	                <nav class="pull-left">
	                    <ul>
	                        <li>
	                            <a href="#">
	                                Home
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                                Company
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                                Portfolio
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                               Blog
	                            </a>
	                        </li>
	                    </ul>
	                </nav>
	               <p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> <a href="www.google.com">CodeBreakers</a>, made with love for a better web
					</p>
	            </div>
	        </footer>
	    </div>
	</div>

</body>
<!--   Core JS Files   -->
	<!-- <script src="../assets/js/jquery-3.1.0.min.js" type="text/javascript"></script> -->
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../assets/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="../assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="../assets/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script> -->

	<!-- Material Dashboard javascript methods -->
	<script src="../assets/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/js/demo.js"></script>


    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script> -->
    <script src="../dist/bootstrap-tagsinput.min.js"></script>
    <script src="../dist/bootstrap-tagsinput/bootstrap-tagsinput-angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/rainbow.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/language/generic.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/language/html.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/language/javascript.js"></script>
    <script src="assets/app_bs2.js"></script>
    <script src="assets/app.js"></script>

	<script type="text/javascript">
            	function go()
            	{
            		window.location.href = "dashC.jsp";
            	}
            </script>

    <script>
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width('cover')
                    // .css('border-radius', '100px')
                    .height('cover');
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>


     <script type="text/javascript">
	$(document).ready(function() {
     $(function() {
         $("#search").autocomplete({
             source : function(request, response) {
               $.ajax({
                    url : "../Controller",
                    type : "GET",
                    data : {
                           term : request.term
                    },
                    dataType : "json",
                    success : function(data) {
                          response(data);
                    }
             });
          }
      });
   });
});
</script>
</html>

