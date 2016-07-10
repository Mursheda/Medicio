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
		var NameOfPatient = frm.NameOfPatient.value;
		var Age	= frm.Age.value;	
		var SexIndex=frm.Sex.options.selectedIndex;
		var Sex = frm.Sex.options[SexIndex].value;
		var OccupationIndex=frm.Occupation.options.selectedIndex;
		var Occupation = frm.Occupation.options[OccupationIndex].value;
		var ContactNumbers=frm.ContactNumbers.value;
		var Natureofillness=frm.Natureofillness.value;
		var DateOfAdmission = frm.DateOfAdmission.value;
		var AdmissionAsIndex=frm.AdmissionAs.options.selectedIndex;
		var AdmissionAs = frm.AdmissionAs.options[AdmissionAsIndex].value;
		var InsuranceIndex=frm.Insurance.options.selectedIndex;
		var Insurance = frm.Insurance.options[InsuranceIndex].value;
		var GaurdianName = frm.GaurdianName.value;
		var RelationWithPatient = frm.RelationWithPatient.value;
		var ReferedByDoctor = frm.ReferedByDoctor.value;
		var RoomID = frm.RoomID.value;
	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,3})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
	var Apattern = /^([0-9]{1,10})$/;
    var numpattern=/^([0-9\_\. ]{1,10})$/;

if(!(Npattern.test(NameOfPatient))){
	alert("Invalid NameOfPatient");
    return false;
	}
else
if(!(wpattern.test(Age))||(Age>200||Age<=0)){
	alert("Invalid Age");
    return false;
	}
else
if(SexIndex==""){
	alert("Sex field is manadatory");
    return false;
	}
else
if(OccupationIndex==""){
	alert("Occupation field is manadatory");
    return false;
	}
else
if(!(numpattern.test(ContactNumbers))){
	alert("Invalid ContactNumber");
    return false;
	}
else
if(!(Ipattern.test(Natureofillness))){
	alert("Invalid Natureofillness");
    return false;
	}
else
if(DateOfAdmission==""){
	alert("DateOfAdmission field is manadatory");
    return false;
	}
else
if(AdmissionAsIndex==""){
	alert("AdmissionAs field is manadatory");
    return false;
	}
else
if(InsuranceIndex==""){
	alert("Insurance field is manadatory");
    return false;
	}
else
if(!(Ipattern.test(GaurdianName))){
	alert("Invalid GaurdianName");
    return false;
	}
else
if(!(Ipattern.test(RelationWithPatient))){
	alert("Invalid RelationWithPatient");
    return false;
	}
else
if(!(Ipattern.test(ReferedByDoctor))){
	alert("Invalid ReferedByDoctor");
    return false;
	}
if(AdmissionAs=="InPatient"){
	if(RoomID==0||RoomID==""){
		alert("Please select room for admission as inpatient");
		frm.AdmissionAs.options.selectedIndex=0;
		return false;
	}
}
}

	function fnCheckAdmissionAs(S)
	{
		var NameOfPatient = document.AdmissionForm.NameOfPatient.value;
		var i = S.options.selectedIndex;
		var Value  = S.options[i].value;
		if(Value=="InPatient" && NameOfPatient!=null)
		{
			var URL = "ListEmptyRooms.jsp?NameOfPatient="+NameOfPatient;
			fnEmpPopUp(URL,350,350);
		}
		else
		{
			document.AdmissionForm.RoomID.value=0;
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

Welcome &nbsp;<%=Userid%>
					
					
					
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
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Appointment <b class="caret"></b></a>
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
					<div class="col-lg-6">
			<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth<0){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="AdmissionForm" onSubmit="return check()" action="NewPatient.jsp">
   <CENTER>
<!-- NameOfPatient  Age Sex Occupation ContactNumbers	Natureofillness DateOfAdmission	AdmissionAs Insurance GaurdianName RelationWithPatient ReferedByDoctor -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> AdmissionForm </TH>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>NameOfPatient *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfPatient" SIZE="20" class="form-control input-md" ></td>
	   </TR>

	     
	   <TR class=row_odd >
	   <TD>Age *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Age" SIZE="10" class="form-control input-md" ></TD>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Sex* </TD>
	    <TD><select name="Sex" class="form-control input-md"> 
				<option value="---">---</option>	
				<option value="Male">Male</option>	   
				<option value="Female">Female</option>
			</select></TD>
	   
	   </TR>

	  
	   <TR class=row_odd >
	   <TD>Occupation*</TD>
	 <TD><select name="Occupation" class="form-control input-md">
				<option value="---">---</option>	
				<option value="Working">Working</option>	   
				<option value="NotWorking">Not Working</option>
			</select></TD>
	   
	   </TR>

	   <TR class=row_even >
	   <TD>ContactNumber*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ContactNumbers" SIZE="20" class="form-control input-md"></TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>Nature of illness*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Natureofillness" SIZE="20" class="form-control input-md"></TD>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>DateOfAdmission*</TD> <TD><input size=20 class="form-control input-md" id="DateOfAdmission" name="DateOfAdmission">
	 <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
   	 </TD>
         </TR>

	   <TR class=row_odd >
	   <TD>AdmissionAs *</TD>
		   <TD><select name="AdmissionAs" class="form-control input-md" onchange="fnCheckAdmissionAs(this)">

				<option value="---">---</option>	
				<option value="InPatient">InPatient</option>	   
				<option value="OutPatient">OutPatient</option>
			</select></TD>
	   
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Insurance*</TD>
	   <TD><select name="Insurance" class="form-control input-md" onchange="var x=document.AdmissionForm.AdmissionAs.value; if(x=='OutPatient' && this.value=='Yes'){alert('Insurance cannot be claimed for out patients');this.value='No';}">
				<option value="---">---</option>	
				<option value="Yes">Yes</option>	   
				<option value="No">No</option>
			</select></TD>
	   
	   </TR>

 	   <TR class=row_odd >
	   <TD>GaurdianName *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="GaurdianName" SIZE="20" class="form-control input-md"></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>Relation With Patient *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="RelationWithPatient" SIZE="20" class="form-control input-md" ></TD>
	   </TR>
	   <TR class=row_odd >
	   <TD>ReferedByDoctor*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ReferedByDoctor" SIZE="10"  class="form-control input-md"><input type="button" class="btn btn-skin btn-block btn-lg" value="Show Doctors" onclick="fnEmpPopUp('ListAvailableDoctors.jsp',300,300)"></td>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>RoomID*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="RoomID" SIZE="20" class="form-control input-md"></TD>
	   </TR>

		<TR class=row_even ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Add" class="btn btn-skin btn-block btn-lg" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="btn btn-skin btn-block btn-lg"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   <%
  }
  %>								
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