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
				  <a href="DoctorsSchedule0.jsp" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right"></span>Reports <b class="caret"></b></a>
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

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
String NameOfPatient = request.getParameter("NameOfPatient");
String strPatientID = request.getParameter("PatientID");
int PatientID=Integer.parseInt(strPatientID);
String strAge = request.getParameter("Age");
int Age=Integer.parseInt(strAge);
String Sex = request.getParameter("Sex");
String Occupation = request.getParameter("Occupation");
String Natureofillness = request.getParameter("Natureofillness");
String strDateOfAdmission=request.getParameter("DateOfAdmission");
//Date DateOfAdmission= Date.valueOf(strDateOfAdmission);
String strDateOfDischarge=request.getParameter("DateOfDischarge");
String PeriodofStayinHospital = request.getParameter("PeriodofStayinHospital");
//Date DateOfDischarge= Date.valueOf(strDateOfDischarge);
String strRoomID = request.getParameter("RoomID");
int RoomID=Integer.parseInt(strRoomID);
String ConsultantDoctor=request.getParameter("ConsultantDoctor");
String ReferedByDoctor=request.getParameter("ReferedByDoctor");
String Insurance=request.getParameter("Insurance");
float BillAmount=0;


try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	
	
	String Query = "Insert into DischargesMaster values(\'"+NameOfPatient+"\',"+PatientID+","+Age+",\'"+Sex+"\',\'"+Occupation+"\',\'"+Natureofillness+"\',\'"+strDateOfAdmission+"\',\'"+strDateOfDischarge+"\',"+RoomID+",\'"+ConsultantDoctor+"\',\'"+ReferedByDoctor+"\',\'"+Insurance+"\',"+BillAmount+")";
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		String Query1 = "Delete from PatientsMaster where PatientID="+PatientID;
		System.out.println(Query1);
	    int rowAffected=stmt.executeUpdate(Query1);		
	    System.out.println("Rows Affected = " + rowAffected);
	
			String Query2 = "Update RoomsMaster SET Status='Empty' where RoomID="+RoomID;
			System.out.println(Query2);
			int rowAffect=stmt.executeUpdate(Query2);		
			System.out.println("Rows Affected = " + rowAffect);
	       if(Insurance.equals("Yes")){
		     String Query3="Update Insurancemaster set DateOfDischarge=\'"+strDateOfDischarge+"\' , PeriodofStayinHospital = "+PeriodofStayinHospital+" where NameOfPatient=\'"+NameOfPatient+"\'";
			 System.out.println(Query3);
			 int rows = stmt.executeUpdate(Query3);
		   }

		%><jsp:forward page="GenerateBill0.jsp">
				<jsp:param name="NameOfPatient" value="<%=NameOfPatient%>"/>
				<jsp:param name="PeriodofStayinHospital" value="<%=PeriodofStayinHospital%>"/>
				<jsp:param name="RoomID" value="<%=RoomID%>"/>
				<jsp:param name="ReferedByDoctor" value="<%=ReferedByDoctor%>"/>
				<jsp:param name="Insurance" value="<%=Insurance%>"/>

			</jsp:forward>

			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewDischarges0.jsp"> Discharge another </A><br>
			
		</center>
		<%
	}
}
catch(Exception e)
{
	System.out.println("Exception"+e);
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