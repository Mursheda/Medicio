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
<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var frm = document.forms(0);
		var NameOfPatient = frm.NameOfPatient.value;
		var PatientID =frm.PatientID.value;
		var Age	= frm.Age.value;	
		var Sex	= frm.Sex.value;
		var Occupation = frm.Occupation.value;
		var Natureofillness=frm.Natureofillness.value;
		var DateOfAdmission = frm.DateOfAdmission.value;
		var DateOfDischarge = frm.DateOfDischarge.value;
		var RoomID = frm.RoomID.value;
		var ConsultantDoctor = frm.ConsultantDoctor.value;
		var ReferedByDoctor = frm.ReferedByDoctor.value;
		var Insurance = frm.Insurance.value;

	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,2})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
	var Apattern = /^([0-9]{1,10})$/;


if(!(Npattern.test(NameOfPatient))){
	alert("Invalid NameOfPatient");
    return false;
	}
else
	if(DateOfDischarge==""){
	alert("DateOfDischarge field is manadatory");
    return false;
	}
else
if(!(Ipattern.test(ConsultantDoctor))){
	alert("Invalid ConsultantDoctor");
    return false;
	}
}

function CalculatePeriod()
	{
		//alert("Hi");
		var DOA = document.DischargeForm.DateOfAdmission.value;
		if(DOA==""){
			alert("Please select Date of Admission");
		}
		var DOD = document.DischargeForm.DateOfDischarge.value;
		YYYYDOA = DOA.substr(0,4);
		YYYYDOD = DOD.substr(0,4);
		MMDOA = DOA.substr(5,2);
		MMDOD = DOD.substr(5,2);
		DDDOA = DOA.substr(8,2);
		DDDOD = DOD.substr(8,2);
	    var AdmDate = new Date(YYYYDOA,MMDOA,DDDOA);
		var DisDate = new Date(YYYYDOD,MMDOD,DDDOD);
		if(DisDate >= AdmDate)
			{
				if(DisDate>AdmDate)
				{
					var Period = (DisDate - AdmDate)/(1000*60*60*24);
					document.DischargeForm.PeriodofStayinHospital.value = Period;
				}
				else
				{
					document.DischargeForm.PeriodofStayinHospital.value = 1;
				}
			}
		else
		{
			alert("Date of Admission should not exceed Date of Discharge");
			document.DischargeForm.DateOfDischarge.value='';
			document.DischargeForm.PeriodofStayinHospital.value = '';

		}
	}
function fnPatientDetails()
			{
		var frm = document.forms(0);
		var PeriodofStayinHospital = frm.PeriodofStayinHospital.value;
		var NameOfPatient = frm.NameOfPatient.value;
		var RoomID = frm.RoomID.value;
		var ReferedByDoctor = frm.ReferedByDoctor.value;

		if (NameOfPatient=='')
		{
			alert("Please Enter NameOfPatient to Proceed");
		}else
				{var URL = "GetBillDetails.jsp?NameOfPatient="+NameOfPatient+"&PeriodofStayinHospital="+PeriodofStayinHospital+"&RoomID="+RoomID+"&ReferedByDoctor="+ReferedByDoctor;
			fnEmpPopUp(URL,300,400);
			}
		}
	//-->
	</SCRIPT>
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

Welcome &nbsp;<%=Userid%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Logout.jsp">Logout</a>
					
					
					
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
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Patient <b class="caret"></b></a>
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
				  <a href="DoctorsSchedule0.jsp" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Rooms <b class="caret"></b></a>
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

if((auth<0)){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="DischargeForm" onSubmit="return check()" action="NewDischarge.jsp">
   <CENTER>
<!-- NameOfPatient PatientID Age Sex Occupation Natureofillness DateOfAdmission	DateOfDischarge RoomID ConsultantDoctor ReferedByDoctor -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> DischargeForm </TH>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>NameOfPatient *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfPatient" SIZE="10"  ><input type="button" value="Show InPatients" onclick="fnEmpPopUp('ShowPatients.jsp',300,300)"></td>

	   </TR>

	   <TR class=row_odd >
	   <TD>PatientID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PatientID" SIZE="20" ></TD>
	   </TR>
	   
	   <TR class=row_even >
	   <TD>Age *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Age" SIZE="5" ></TD>
	   </TR>
	  
	   <TR class=row_odd >
	   <TD>Sex* </TD>
	   <TD><INPUT TYPE="TEXT" NAME="Sex" SIZE="10"  ></TD>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>Occupation*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Occupation" SIZE="10" ></TD>
 	   </TR>

	   
	   <TR class=row_odd >
	   <TD>Nature of illness*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Natureofillness" SIZE="20" ></TD>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>DateOfAdmission*</TD> <TD><input size=20  id="DateOfAdmission" name="DateOfAdmission">
	 
   	  </TD>
         </TR>

	   <TR class=row_odd >
	   <TD>DateOfDischarge *</TD>
	   <TD><input size=20  id="DateOfDischarge" name="DateOfDischarge">
		 <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);if(document.DischargeForm.DateOfAdmission.value==''){alert('Please select Date of Admission');document.DischargeForm.DateOfDischarge.value='';}else{ CalculatePeriod();}" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this);" >
		 <INPUT TYPE="Hidden" NAME="PeriodofStayinHospital" SIZE="20" >
   	 </TD>
         </TR>

	  
	   <TR class=row_even >
	   <TD>RoomID*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="RoomID" SIZE="20" ></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>ConsultantDoctor *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ConsultantDoctor" SIZE="20" ></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>ReferedByDoctor*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ReferedByDoctor" SIZE="20" ></TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>Insurance*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Insurance" SIZE="10" ></TD>
	   </TR>

       	<TR class=row_even ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Submit" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
<%
  }
  %>
				
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
								</span>  +91 8826008650
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