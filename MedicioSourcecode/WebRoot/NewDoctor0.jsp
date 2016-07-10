<!--
	File : Report.jsp
	Purpose : This jsp displays the home page containing link to change user's password
			
-->
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Medicio HealthCare</title>
	
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="css/owl.theme.css" rel="stylesheet" media="screen" />
	<link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
    <script language="Javascript" src="images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var frm = document.forms(0);
		var DoctorName = frm.DoctorName.value;
		var DateOfJoin = frm.DateOfJoin.value;
		var DesignationIndex=frm.Designation.options.selectedIndex;
		var Designation = frm.Designation.options[DesignationIndex].value;
		var PhoneNumber=frm.PhoneNumber.value;
		var Experience=frm.Experience.value;
		var HolidayinWeekIndex=frm.HolidayinWeek.options.selectedIndex;
		var HolidayinWeek = frm.HolidayinWeek.options[HolidayinWeekIndex].value;
		var WorkingHours = frm.WorkingHours.value;
		var ChargesPerHour = frm.ChargesPerHour.value;
	
	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,2})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Dpattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Apattern = /^([0-9]{1,10})$/;


if(!(Dpattern.test(DoctorName))){
	alert("Invalid DoctorName");
    return false;
	}
else
if(DateOfJoin==""){ 
		alert("DateOfJoin is mandatory");
		return false;
		}
else
if(DesignationIndex==""){ 
		alert("Designation is mandatory");
		return false;
		}

else
if(!(Apattern.test(PhoneNumber))){
	alert("Invalid PhoneNumber");
    return false;
	}
else
if(!(wpattern.test(Experience))){
	alert("Invalid Experience");
    return false;
	}
else
if(HolidayinWeekIndex==""){ 
		alert("HolidayinWeek is mandatory");
		return false;
		}

else

if((!(wpattern.test(WorkingHours))||WorkingHours>24||WorkingHours<=0)){
	alert("Invalid WorkingHours");
    return false;
	}
else
if(!(Apattern.test(ChargesPerHour))){
	alert("Invalid ChargesPerHour");
    return false;
	}
	
	}
	
    
	//-->
	</SCRIPT>

  </HEAD>

	<!-- boxed bg -->
	<link id="bodybg" href="bodybg/bg1.css" rel="stylesheet" type="text/css" />
	<!-- template skin -->
	<link id="t-colors" href="color/default.css" rel="stylesheet">


</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

<div id="wrapper">
	
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="top-area">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-6">
					<p class="bold text-left"><A href="ChangePassword1.jsp">Change Password </A><BR>
<%
/* Verifying wether the user is authorised to edit emp details
	if user is authorised he can edit the details if not he can
	only view the details */
	Integer EmpAuth = (Integer)session.getAttribute("auth");
	int Auth = EmpAuth.intValue();
	System.out.println(Auth);
			/*If authorised show Download data to Excel */
		if(Auth==0){
		%>
			<A href="AddUser.html">Add new user </A><BR> 
		<%
		}

%>
					 </p>
					</div>
					<div class="col-sm-6 col-md-6">
					<p class="bold text-right">
					<% String Userid=(String)session.getAttribute("userr");%>

Welcome &nbsp;<%=Userid%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Logout.jsp">Logout</a>
					
					
					
					</p>
					</div>
				</div>
			</div>
		</div>
        <div class="container navigation">
		
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img src="img/logo.png" alt="" width="150" height="40" />
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
			  <ul class="nav navbar-nav">
						<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Doctors <b class="caret"></b></a>
				  <ul class="dropdown-menu">
					<li><a href="ViewDoctors.jsp">View Doctors</a></li>
					<li><a href="NewDoctor0.jsp">New Doctors</a></li>
					 </ul>
				</li>
			  </ul>
<ul class="nav navbar-nav">
						<li class="dropdown">
				  <a href="DoctorsSchedule0.jsp" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Patient <b class="caret"></b></a>
				  <ul class="dropdown-menu">
					<li><a href="ViewPatients.jsp">View Patient</a></li>
					<li><a href="NewPatient0.jsp">New Patient</a></li>
					 </ul>
				</li>
			  </ul>			  

<ul class="nav navbar-nav">
						<li class="dropdown">
				  <a href="DoctorsSchedule0.jsp" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Appointment <b class="caret"></b></a>
				  <ul class="dropdown-menu">
					<li><a href="ViewAppointments.jsp">View Appointment</a></li>
					<li><a href="AddAppointments0.jsp">New Appointment</a></li>
					 </ul>
				</li>
			  </ul>			  
<ul class="nav navbar-nav">
						<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Discharge <b class="caret"></b></a>
				  <ul class="dropdown-menu">
					<li><a href="ViewDischarges.jsp">View Discharge</a></li>
					<li><a href="NewDischarges0.jsp">New Discharge</a></li>
					 </ul>
				</li>
			  </ul>			  
		  
		  
<ul class="nav navbar-nav">
						<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Rooms <b class="caret"></b></a>
				  <ul class="dropdown-menu">
					<li><a href="ViewRooms.jsp">View Rooms</a></li>
					<li><a href="NewRoom0.jsp">New Rooms</a></li>
					 </ul>
				</li>
			  </ul>
<ul class="nav navbar-nav">
						<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Reports <b class="caret"></b></a>
				  <ul class="dropdown-menu">
					<li><a href="AppointmentsReport0.jsp">Appointment</a></li>
					<li><a href="DischargesReport0.jsp">Discharge</a></li>
					<li><a href="InpatientsReport0.jsp">Inpatients</a></li>
					
					
					 </ul>
				</li>
			  </ul>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="intro-content">
			<div class="container">
				<div class="row">
				<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth==3){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="NewDoctorsForm" onSubmit="return check()" action="NewDoctor.jsp">
   <CENTER>
<!-- DoctorName DoctorID DateOfJoin Designation PhoneNumber Experience  HolidayinWeek WorkingHours ChargesPerHour -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> NewDoctorsEntry </TH>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>DoctorName *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="DoctorName" SIZE="20"  class="form-control input-md"></td>
	   </TR>

	  	   
	   <TR class=row_odd >
	   <TD>DateOfJoin*</TD> <TD><input type="date" size=20 id="DateOfJoin" name="DateOfJoin" class="form-control input-md">
	 </TD>
         </TR>
	   	  
	   <TR class=row_even >
	   <TD>Designation*</TD>
	 <TD><select name="Designation" class="form-control input-md">
				<option value="---">---</option>
				<option value="Anesthesiologist">Anesthesiologist</option>
				<option value="Cardiologist">Cardiologist</option>
				<option value="Dentist">Dentist</option>	   
				<option value="Dietitian">Dietitian</option>
				<option value="Dermatologist">Dermatologist</option>
				<option value="GeneralMedicine">GeneralMedicine</option>
				<option value="Gynecologist">Gynecologist</option>
				<option value="Nutritionist">Nutritionist</option>
				<option value="Neurologist">Neurologist</option>
				<option value="Neurosurgeon">Neurosurgeon</option>
				<option value="OrthoPedist">OrthoPedist</option>	   
				<option value="Ophthalmologist">Ophthalmologist</option>
				<option value="Pediatrician">Pediatrician</option>
				<option value="Psychiatrist">Psychiatrist</option>
				<option value="Physiotherapist">Physiotherapist</option>
				<option value="Radiologist">Radiologist</option>
			</select></TD>
	   
	   </TR>

	   <TR class=row_odd >
	   <TD>PhoneNumber*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PhoneNumber" SIZE="20" class="form-control input-md" ></TD>
	   </TR>
	   
	   <TR class=row_even >
	   <TD>Experience*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Experience" SIZE="20" class="form-control input-md" ></TD>
	   </TR>

	  
	   

	   <TR class=row_odd >
	   <TD>HolidayinWeek *</TD>
	    <TD><select name="HolidayinWeek" class="form-control input-md">
				<option value="---">---</option>	
				<option value="Sunday">Sunday</option>	   
				<option value="Monday">Monday</option>
				<option value="Tuesday">Tuesday</option>
				<option value="Wednesday">Wednesday</option>
				<option value="Thursday">Thursday</option>
				<option value="Friday">Friday</option>
				<option value="Saturday">Saturday</option>
			</select></TD>
	   
	   </TR>
	  
	   <TR class=row_even >
	   <TD>WorkingHours *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="WorkingHours" SIZE="20" class="form-control input-md"></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>ChargesPerHour *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ChargesPerHour" SIZE="20" class="form-control input-md">in Rupees</TD>
	   </TR>
   
	   <TR class=row_even  ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Add"  class="btn btn-skin btn-block btn-lg"></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="btn btn-skin btn-block btn-lg"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   
<%
  }
  %>		

					</div>
					<div class="col-lg-6">
						<div class="form-wrapper">
						<div class="wow fadeInRight" data-wow-duration="2s" data-wow-delay="0.2s">
						
													
						</div>
						</div>
					</div>					
				</div>		
			</div>
		</div>		
    </section>





	<footer>
	
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>About Medicio</h5>
						<p>
						Medicio provides the best healthcare sevices to customer. 
						
						</p>
					</div>
					</div>
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						
					</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>Medicio center</h5>
						
						<ul>
							<li>
								<span class="fa-stack fa-lg">
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-calendar-o fa-stack-1x fa-inverse"></i>
								</span> Monday - Saturday, 8am to 10pm
							</li>
							<li>
								<span class="fa-stack fa-lg">
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-phone fa-stack-1x fa-inverse"></i>
								</span> +91 8826008650
							</li>
							<li>
								<span class="fa-stack fa-lg">
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
								</span> admin@medicio.com
							</li>

						</ul>
					</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>Our location</h5>
						<p>Parliment Street V303, Delhi</p>		
						
					</div>
					</div>
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						
					</div>
					</div>
				</div>
			</div>	
		</div>
		<div class="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-6 col-lg-6">
					<div class="wow fadeInLeft" data-wow-delay="0.1s">
					<div class="text-left">
					<p>&copy;Copyright 2016 - Medicio. All rights reserved.</p>
					</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 col-lg-6">
					<div class="wow fadeInRight" data-wow-delay="0.1s">
					<div class="text-right">
							</div>
                    <!-- 
                        All links in the footer should remain intact. 
                        Licenseing information is available at: http://bootstraptaste.com/license/
                        You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Medicio
                    -->
					</div>
				</div>
			</div>	
		</div>
		</div>
	</footer>

</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

	<!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>	 
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/stellar.js"></script>
	<script src="plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
    <script src="js/custom.js"></script>


</body>
</html>