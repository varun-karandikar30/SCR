<%-- 
    Document   : index
    Created on : Jul 8, 2017, 5:07:07 PM
    
    Author     : lenovo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Material Design Bootstrap</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/Custom.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.0/css/mdb.min.css">
    <link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

    <!--     Fonts and icons     -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/Custom.css">

    <!-- CSS Files -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/material-kit2.css" rel="stylesheet"/>
    <style type="text/css">
        body{
            padding: 15px;
            background-color:#2980b9;
            animation: fade 1s;
        }
       /* @keyframes fade {
    0%   {opacity: 0.25; width: 25%;}
    25%  {opacity: 0.5; }
    75%  {opacity: 0.75;}
    100% {opacity: 1;width: 100%}
}*/
@keyframes fade {
    0%   {opacity: 0.25; width: 25%;}
    25%  {opacity: 0.5; }
    75%  {opacity: 0.75;}
    100% {opacity: 1;width: 100%}
}

.Parent{
	width: 30%;
	margin-left: 35%;
	background-color: white;
	padding: 10px;
	padding-right: 25px;
	border-radius: 9px;
	box-shadow: 2px 2px 5px black;
	transition: all 0.25s ease-out;
	font-family: 'Raleway', sans-serif;
}

.Parent:hover{
	transform: scale(1);
	transition: all 0.25s ease;
}

.Parent h2{
	text-align: center;
	font-family: 'Raleway', sans-serif;
}

.radio{
	margin-top: 15px;
}

.Parent1{
	width: 32%;
	margin-left: 34%;
	background-color: white;
	padding: 10px;
	padding-right: 25px;
	border-radius: 9px;
	box-shadow: 2px 2px 5px black;
	transition: all 0.25s ease-out;
	font-family: 'Raleway', sans-serif;
	margin-top: 150px;
	display: none;
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    animation: animatezoom 1s;

   /* width: 100%; /* Full width */
   /* height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
   /* background-color: rgb(0,0,0); /* Fallback color */
  /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}


.fa fa-graduation-cap{
	margin-right: 5px;
}

.btn btn-primary btn-round{
	margin-right: 5px;
}

.radio{
	margin-left: 40px;
}

button{
	margin-left: 40px;
}

.Parent2{
	text-align: center;
	width: 38%;
	margin-left: 31%;
	background-color: white;
	padding: 20px;
	/*padding-right: 25px;*/
	border-radius: 9px;
	box-shadow: 2px 2px 5px black;
	transition: all 0.25s ease-out;
	font-family: 'Raleway', sans-serif;
	margin-top: 150px;
	display: none;
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    animation: animatezoom 1s;

   /* width: 100%; /* Full width */
   /* height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
   /* background-color: rgb(0,0,0); /* Fallback color */
  /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
   /* padding-top: 60px;
}
*/

    </style>

</head>

<body>
   
    <!-- /Start your project here-->
    <div class="Parent" id="Parent">
    <h2>Register</h2>
    <table border="0" width="100%">
        <form class="form-inline" action="Register" method="Post">
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-user prefix"></i>
                <input type="text" id="form90" class="form-control validate" name="username" required>
                <label for="form90" data-error="wrong" data-success="right">Name</label>
            </div>
        </td>
        </tr>

        <!--<tr><th class="Reg">Register as:</th></tr>-->
            <tr>
            <td style="float: left;">
            <div class="radio" style="float: left; display: inline; margin-left: 40px;">
                <label>
                <input type="radio" name="optionsRadios" value="company">
                Company
                </label>
            </div>
            
            <div class="radio" style="float: left; display: inline; margin-left: 40px;">
                <label>
                    <input type="radio" name="optionsRadios" checked="true" value="student">
                    Student
                </label>
            </div>
            </td>
            </tr>
            
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-envelope prefix"></i>
                <input type="email" id="form91" class="form-control validate" name="mail" required>
                <label for="form91" data-error="wrong" data-success="right">Type your email</label>
            </div>
        </td>
        </tr>
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-lock prefix"></i>
                <input type="password" id="form92" class="form-control validate" name="password" required>
                <label for="form92" data-error="wrong" data-success="right">Type your password</label>
            </div>
        </td>
        </tr>
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-lock prefix"></i>
                <input type="password" id="form93" class="form-control validate" name="cpass" onchange="check();" onkeyup="invalid();" required>
                <label for="form92" data-error="wrong" data-success="right">Confirm Password</label>
            </div>
        </td>
        </tr>
        <tr>
        <td>
            <div class="md-form form-group">
                <button type="submit" class="btn btn-primary btn-lg">Register</button>
            </div>
        </td>
        </tr>
        </form>
        </table>
    <p>Already have an account? <font color="#4285f4"><a onclick="myf3();">Sign in</a></p></font>

    </div>
    <!--Login Starts-->

    <div class="Parent1" id="Parent1">

    <h2>Login</h2>
    <table border="0" width="100%">
        <form class="form-inline" action="Login" method="Post">
        <span onclick="myf2();" class="close" title="Close Modal"><font color="black" size="25px">&times;</font></span>
        <!--<tr><th class="Reg">Register as:</th></tr>-->
            
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-envelope prefix"></i>
                <input type="email" id="form91" class="form-control validate" name="loginmail">
                <label for="form91" data-error="wrong" data-success="right">Enter Email</label>
            </div>
        </td>
        </tr>
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-lock prefix"></i>
                <input type="password" id="form92" class="form-control validate" name="loginpass">
                <label for="form92" data-error="wrong" data-success="right">Enter password</label>
            </div>
        </td>
        </tr>

        <tr>
            <td>
                <div class="col-md-8 col-md-offset-2"> <!-- col-md-8 col-md-offset-2 -->
                
                <button class="btn btn-primary">Submit</button>

                </div>
            </td>
        </tr>
        </form>
        </table>
        </div>
         </div>
          <!--Login ends-->
          <!--Login Starts-->
          <div class="Parent1" id="Parent4">

    <h2>Login</h2>
    <table border="0" width="100%">
        <form class="form-inline" action="LoginC" method="Post">
        <span onclick="myf2();" class="close" title="Close Modal"><font color="black" size="25px">&times;</font></span>
        <!--<tr><th class="Reg">Register as:</th></tr>-->
            
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-envelope prefix"></i>
                <input type="text" id="form91" class="form-control validate" name="loginname">
                <label for="form91" data-error="wrong" data-success="right">Enter Company Name</label>
            </div>
        </td>
        </tr>
        <tr>
        <td>
            <div class="md-form form-group">
                <i class="fa fa-lock prefix"></i>
                <input type="password" id="form92" class="form-control validate" name="loginpass">
                <label for="form92" data-error="wrong" data-success="right">Enter password</label>
            </div>
        </td>
        </tr>

        <tr>
            <td>
                <div class="col-md-8 col-md-offset-2"> <!-- col-md-8 col-md-offset-2 -->
                
                <button class="btn btn-primary">Submit</button>

                </div>
            </td>
        </tr>
        </form>
        </table>
        </div>
         </div>
          <!--Login ends-->
          <div class="Parent2" id="Parent2">
            <button class="btn btn-primary btn-round" onclick="myf1();">
    <i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Login as Student
    <button class="btn btn-primary btn-round" onclick="myf4();">
    <i class="fa fa-industry" aria-hidden="true"></i></i>&nbsp;&nbsp;&nbsp;&nbsp;Login as Company
          </div>

    <!-- SCRIPTS -->
    <script type="text/javascript">
    function myf1()
    {
        document.getElementById('Parent1').style.display="block";
        document.getElementById('Parent2').style.display="none";
        document.getElementById('Parent').style.backgroundColor="black";
        document.getElementById('Parent').style.opacity="0.4";
        document.body.style.backgroundColor="rgba(41,128,185,0.8)";
    }
    </script>
        <script type="text/javascript">
    function myf2()
    {
        document.getElementById('Parent1').style.display="none";
        document.getElementById('Parent4').style.display="none";
        document.getElementById('Parent').style.backgroundColor="white";
        document.getElementById('Parent').style.opacity="1";
        document.body.style.backgroundColor="rgba(41,128,185,1)";
    }
    </script>
    <script type="text/javascript">
    function myf3()
    {
        document.getElementById('Parent2').style.display="block";
        document.getElementById('Parent').style.backgroundColor="black";
        document.getElementById('Parent').style.opacity="0.4";
        document.body.style.backgroundColor="rgba(41,128,185,0.8)";
    }
    </script>
    <script type="text/javascript">
    function myf4()
    {
        document.getElementById('Parent4').style.display="block";
        document.getElementById('Parent2').style.display="none";
        document.getElementById('Parent').style.backgroundColor="black";
        document.getElementById('Parent').style.opacity="0.4";
        document.body.style.backgroundColor="rgba(41,128,185,0.8)";
    }
    </script>
    <script>
// Get the modal
var modal1 = document.getElementById('Parent1');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == document.getElementById('Parent1')) {
        document.getElementById('Parent1').style.display="none";
        document.getElementById('Parent').style.backgroundColor="white";
        document.getElementById('Parent').style.opacity="1";
        document.body.style.backgroundColor="rgba(41,128,185,1)";
    }
}
</script>
<script>
// Get the modal
var modal1 = document.getElementById('Parent4');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == document.getElementById('Parent4')) {
        document.getElementById('Parent4').style.display="none";
        document.getElementById('Parent').style.backgroundColor="white";
        document.getElementById('Parent').style.opacity="1";
        document.body.style.backgroundColor="rgba(41,128,185,1)";
    }
}
</script>
    <script type="text/javascript">
        function check()
        {
            var pass=document.getElementById("form92").value;
            var cpass=document.getElementById("form93").value;
            if(pass!==cpass)
            {
                document.getElementById("form92").value="";
                document.getElementById("form93").value="";
            }
            else
            {
                document.getElementById("form93").style.borderBottom="0px solid #F44336";
                document.getElementById("form93").style.borderBottom="1px solid #00C851";
                document.getElementById("form93").style.boxShadow="0 1px 0 0 #00C851";
                document.getElementById("form93").style.content="attr(data-error)";
                document.getElementById("form93").style.color="rgba(0,0,0,0.8)";
                document.getElementById("form93").style.opacity="1";
            }
        }
    </script>
    <script type="text/javascript">
        function invalid()
        {
            var pass=document.getElementById("form92").value;
            var cpass=document.getElementById("form93").value;
            if(pass!==cpass)
            {
                document.getElementById("form93").style.borderBottom="1px solid #F44336";
                document.getElementById("form93").style.content="attr(data-error)";
                document.getElementById("form93").style.color="#F44336";
                document.getElementById("form93").style.opacity="1";
            }
            else
            {
                document.getElementById("form93").style.borderBottom="1px solid #00C851";
                document.getElementById("form93").style.boxShadow="0 1px 0 0 #00C851";
                document.getElementById("form93").style.content="attr(data-success)";
                document.getElementById("form93").style.color="#00C851";
                document.getElementById("form93").style.opacity="1";
            }
        }
    </script>

                
    <!-- SCRIPTS -->
    <!--   Core JS Files   -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/material.min.js"></script>

    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="js/nouislider.min.js" type="text/javascript"></script>

    <!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
    <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>

    <!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
    <script src="js/material-kit.js" type="text/javascript"></script>
    <script type="text/javascript">$.material.init()</script>
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">$(document).ready(function(){$.material.init();});</script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/tether.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>

    <script type="text/javascript">
        history.pushState(null,null,document.URL);
        window.addEventListener('popstate',function(){
            history.pushState(null,null,document.URL);
        });
    </script>
</body>

</html>
