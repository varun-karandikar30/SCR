<%-- 
    Document   : dashboard
    Created on : 20 Jul, 2017, 2:46:00 PM
    Author     : VJK
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.StName" %>
<%
    String name = (String) session.getAttribute("name");
%>
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

	<title>Welcome! <%=name%></title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/ng-tags-input.bootstrap.min.css" rel="stylesheet"/>
     <link href="../assets/css/ng-tags-input.min.css" rel="stylesheet"/>
    <!--  Material Dashboard CSS    -->
    <link href="../assets/css/material-dashboard.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>
<%
    
    int stuCount = (Integer) session.getAttribute("stuCount");
    int comCount = (Integer) session.getAttribute("comCount");
    String cid = (String) session.getAttribute("cid");
    String tbranch = (String) session.getAttribute("tbranch");
    String label1 = (String) session.getAttribute("label1");
    String series1 = (String) session.getAttribute("series1");
    String label2 = (String) session.getAttribute("label2");
    String series2 = (String) session.getAttribute("series2");
    ArrayList<StName> stname = (ArrayList<StName>) session.getAttribute("stname");
    int count1 = (Integer) session.getAttribute("count1");
    int countS = (Integer) session.getAttribute("countS");
    int count = count1 - countS;
    int index = 0;
%>
<body >

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
	                <li class="active">
	                    <a href="dashC.jsp">
	                        <i class="material-icons">dashboard</i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li>
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
						<a class="navbar-brand" href="dashC.jsp">Dashboard</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="dashC.jsp" onclick="go();" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="material-icons" onclick="update();">notifications</i>
									<span class="notification" id="notify" onclick="update();"><%=count%></span>
									<p class="hidden-lg hidden-md">Notifications</p>
								</a>
								<ul class="dropdown-menu">
								<% if(count>0) { %>
									<li><a href="#">Some new students have applied into your company : Check notification bar for more details</a></li>
									<% } %> 
								</ul>
							</li>
							<li>
								<a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
	 							   <i class="material-icons">person</i>
	 							   <p class="hidden-lg hidden-md">Profile</p>
		 						</a>
							</li>
						</ul>

						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
								<input type="text" class="form-control" id="search" name="search" placeholder="Search">
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
                                   <!-- <p id="time" style="margin-left:665px; color: black; font-weight: bold;" ></p> -->
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<i class="fa fa-graduation-cap" aria-hidden="true"></i>
								</div>
								<div class="card-content">
									<p class="category">No. of Students</p>
                                                                        <h3 class="title"><%=stuCount%></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">date_range</i> Last 24 Hours
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header" data-background-color="orange">
									<i class="fa fa-industry" aria-hidden="true"></i>
								</div>
								<div class="card-content">
									<p class="category">Companies</p>
									<h3 class="title"><%=comCount%></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">date_range</i> Last 24 Hours
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6" style="float: right;">
							<div class="card card-stats">
								<div class="card-header" data-background-color="blue" style="padding: 2px">
									<img class="img" src="image.jsp?imgid=<%=name%>" style="width:85px;height:85px;"/>
								</div>
								<div class="card-content">
									<p class="category"><%=tbranch%></p>
									<h3 class="title"><%=cid%></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> Just Updated
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart" data-background-color="green">
									<div class="ct-chart" id="dailySalesChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">Students Placed</h4>
									<p class="category"><span class="text-success"><i class="fa fa-long-arrow-up"></i> 55%  </span> increase in placements.(notify)</p>
								</div>
								<div class="card-footer">
									<div class="stats">
<!--(synchonize)-->				<i class="material-icons">access_time</i> updated 4 minutes ago
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart" data-background-color="orange">
									<div class="ct-chart" id="emailsSubscriptionChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">No. of Companies</h4>
									<p class="category">Year</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> Company sent 2 days ago
									</div>
								</div>

							</div>
						</div>

						<div class="col-md-4">
							<div class="card">
								<div class="card-header card-chart" data-background-color="red">
									<div class="ct-chart" id="completedTasksChart"></div>
								</div>
								<div class="card-content">
									<h4 class="title">Completed Tasks</h4>
									<p class="category">Last Company Performance</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> Company sent 2 days ago
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="blue">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">Interested Candidates</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active">
													<a href="#profile" data-toggle="tab">
														<i class="material-icons">bug_report</i>
														Status
													<div class="ripple-container"></div></a>
												</li>
												<!-- <li class="">
													<a href="#messages" data-toggle="tab">
														<i class="material-icons">code</i>
														Status
													<div class="ripple-container"></div></a>
												</li>
												<li class="">
													<a href="#settings" data-toggle="tab">
														<i class="material-icons">cloud</i>
														All
													<div class="ripple-container"></div></a>
												</li> -->
											</ul>
										</div>
									</div>
								</div>

								<div class="card-content">
									<div class="tab-content">
										<div class="tab-pane active" id="profile">
											<table class="table">
												<tbody id="table1">
													<!-- In table1 script-->
													
												</tbody>
											</table>
										</div>
									<!-- 	<div class="tab-pane" id="messages">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="radio" style="margin-right: 10px">
																<label>
																	<input type="radio" name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
														</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
																Apply
															</button>
															<button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="radio">
																<label>
																	<input type="radio" name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Sign contract for "What are conference organizers afraid of?"</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
																Apply
															</button>
															<button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="tab-pane" id="settings">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="radio" style="margin-right: 10px">
																<label>
																	<input type="radio" name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
																Apply
															</button>
															<button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="radio">
																<label>
																	<input type="radio" name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
														</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
																Apply
															</button>
															<button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
													<tr>
														<td>
															<div class="radio">
																<label>
																	<input type="radio" name="optionsCheckboxes">
																</label>
															</div>
														</td>
														<td>Sign contract for "What are conference organizers afraid of?"</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
																Apply
															</button>
															<button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
																<i class="material-icons">close</i>
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</div> -->
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6 col-md-12">
							<div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">Student Stats</h4>
                                        <p class="category">Current Scenario</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead class="text-warning">
	                                        <th>ID</th>
	                                    	<th>Name</th>
	                                    	<th>CGPA</th>
	                                    	<th>Branch</th>
	                                    </thead>
	                                    <tbody id="scenario">
	                                    <!-- In script scenario-->    
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
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
	<script src="../assets/js/angular.min.js"></script>
	<script src="../assets/js/ng-tags-input.min"></script>
	<!--  Google Maps Plugin    -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="../assets/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/js/demo.js"></script>

	<script type="text/javascript">
    	$(document).ready(function(){

			// Javascript method's body can be found in assets/js/demos.js
        	demo.initDashboardPageCharts();

    	});
	</script>

        <script type="text/javascript">
            setInterval(function(){
                document.getElementById("time").innerHTML = Date();},1000);
                
            </script>
            <script type="text/javascript">
            	function go()
            	{
            		window.location.href = "dashC.jsp";
            	}
            </script>
            <script type="text/javascript">
            	type = ['','info','success','warning','danger'];


demo = {
    initPickColor: function(){
        $('.pick-class-label').click(function(){
            var new_class = $(this).attr('new-class');
            var old_class = $('#display-buttons').attr('data-class');
            var display_div = $('#display-buttons');
            if(display_div.length) {
            var display_buttons = display_div.find('.btn');
            display_buttons.removeClass(old_class);
            display_buttons.addClass(new_class);
            display_div.attr('data-class', new_class);
            }
        });
    },

    initFormExtendedDatetimepickers: function(){
        $('.datetimepicker').datetimepicker({
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-chevron-up",
                down: "fa fa-chevron-down",
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-screenshot',
                clear: 'fa fa-trash',
                close: 'fa fa-remove'
            }
         });
    },

    initDocumentationCharts: function(){
        /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */

        dataDailySalesChart = {
            labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
            series: [
                [12, 17, 7, 17, 23, 18, 38]
            ]
        };

        optionsDailySalesChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: { top: 0, right: 0, bottom: 0, left: 0},
        }

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        md.startAnimationForLineChart(dailySalesChart);
    },

    initDashboardPageCharts: function(){

        /* ----------==========     Daily Sales Chart initialization    ==========---------- */
        var year = "<%=label1%>";
        var nos = "<%=series1%>";
        var year = year.substring(0,year.length-1);
        var nos = nos.substring(0,nos.length-1);
        var yrr = year.split(' ');
        var nrr = nos.split(' ');
        var k = <%=session.getAttribute("maxNos")%>;
        dataDailySalesChart = {
            labels: yrr, 
            series: [ nrr
            ]     
        };

        optionsDailySalesChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: (k+100), // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: { top: 0, right: 0, bottom: 0, left: 0},
        }

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        md.startAnimationForLineChart(dailySalesChart);



        /* ----------==========     Completed Tasks Chart initialization    ==========---------- */

        dataCompletedTasksChart = {
            labels: ['12am', '3pm', '6pm', '9pm', '12pm', '3am', '6am', '9am'],
            series: [
                [230, 750, 450, 300, 280, 240, 200, 190]
            ]
        };

        optionsCompletedTasksChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: 1000, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: { top: 0, right: 0, bottom: 0, left: 0}
        };

        var completedTasksChart = new Chartist.Line('#completedTasksChart', dataCompletedTasksChart, optionsCompletedTasksChart);

        // start animation for the Completed Tasks Chart - Line Chart
        md.startAnimationForLineChart(completedTasksChart);



        /* ----------==========     Emails Subscription Chart initialization    ==========---------- */
        var year = "<%=label2%>";
        var noc = "<%=series2%>";
        var year = year.substring(0,year.length-1);
        var nos = noc.substring(0,noc.length-1);
        var yrr = year.split(' ');
        var nrr = noc.split(' ');
        var k = <%=session.getAttribute("maxNos2")%>;
        var dataEmailsSubscriptionChart = {
          labels: yrr,
          series: [ nrr
          ]
        };
        var optionsEmailsSubscriptionChart = {
            axisX: {
                showGrid: false
            },
            low: 0,
            high: (k+5),
            chartPadding: { top: 0, right: 5, bottom: 0, left: 0}
        };
        var responsiveOptions = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var emailsSubscriptionChart = Chartist.Bar('#emailsSubscriptionChart', dataEmailsSubscriptionChart, optionsEmailsSubscriptionChart, responsiveOptions);

        //start animation for the Emails Subscription Chart
        md.startAnimationForBarChart(emailsSubscriptionChart);

    },

    initGoogleMaps: function(){
        var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
        var mapOptions = {
          zoom: 13,
          center: myLatlng,
          scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
          styles: [{"featureType":"water","stylers":[{"saturation":43},{"lightness":-11},{"hue":"#0088ff"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"hue":"#ff0000"},{"saturation":-100},{"lightness":99}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#808080"},{"lightness":54}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ece2d9"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#ccdca1"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#767676"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#b8cb93"}]},{"featureType":"poi.park","stylers":[{"visibility":"on"}]},{"featureType":"poi.sports_complex","stylers":[{"visibility":"on"}]},{"featureType":"poi.medical","stylers":[{"visibility":"on"}]},{"featureType":"poi.business","stylers":[{"visibility":"simplified"}]}]

        };
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            title:"Hello World!"
        });

        // To add the marker to the map, call setMap();
        marker.setMap(map);
    },

	showNotification: function(from, align){
    	color = Math.floor((Math.random() * 4) + 1);

    	$.notify({
        	icon: "notifications",
        	message: "Welcome to <b>Material Dashboard</b> - a beautiful freebie for every web developer."

        },{
            type: type[color],
            timer: 4000,
            placement: {
                from: from,
                align: align
            }
        });
	}
};
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
<script type="text/javascript">
	document.getElementById("table1").innerHTML = '<%for(int i=0;i<stname.size();i++){%><tr><td><div class="radio" style="margin-right: 10px"><label><input type="radio" name="optionsCheckboxes" onclick="radDisplay();" value="<%=stname.get(i).getName()%>"></label></div></td><td><%=stname.get(i).getName()%></td><td class="td-actions text-right"><button type="button" rel="tooltip" title="<%=stname.get(i).getName()%>\'s Profile" class="btn btn-primary btn-simple btn-xs">View Profile</button><button type="button" rel="tooltip" title="Remove" id="appl<%=i%>" onclick="rem(this.id)" value="<%=stname.get(i).getEmail()%>" class="btn btn-danger btn-simple btn-xs"><i class="material-icons">close</i></button></td></tr><%}%>';
</script>
 <script type="text/javascript">
 			function rem(i){
 				//alert("mellow");
				var semail = document.getElementById(i).value;
				alert("Value = " + semail);
				window.location.replace("../StRemove?semail=" + semail);
			}
            function update(){
            	<%
            		countS += count;
            	 	session.setAttribute("countS",countS);
            	%>
            	<jsp:include page="../DashC" flush="true"/>
            }
 </script>
            <script type="text/javascript">
            var j = null;
            	function radDisplay(){
            		//alert("mellow");
            		
            		var radArr = document.getElementsByName("optionsCheckboxes");
            		//var rad = A.one("input[name=<portlet:namespace/>group1]:checked").get("value"); 
            		for(var i=0;i<radArr.length;i++)
            		{
            			if(radArr[i].checked==true)
            				j = radArr[i].value;
            		}
            		
            		window.location.replace("dashC.jsp?radioValue=" + j);
            		alert("after rad " + j);
            		<%
            			String rad2 = request.getParameter("radioValue");
            			System.out.println("\nChecked button check : " + rad2);
            			for(int i=0;i<stname.size();i++)
            			{
            				if(stname.get(i).getName().equals(rad2))
            				{
            					index = i;
            					System.out.println("\nValue of index = "+index);
            					break;
            				}
            			}
           			%>
            	}
            	document.getElementById("scenario").innerHTML = '<tr><td>1</td><td><%=stname.get(index).getName()%></td><td><%=stname.get(index).getGpa()%></td><td><%=stname.get(index).getBranch()%></td></tr>';
            </script>
</html>


