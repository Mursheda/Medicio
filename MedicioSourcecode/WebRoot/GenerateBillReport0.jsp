<!--Interface Code to prompt condition value from end user-->

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


<script LANGUAGE="Javascript" SRC="images/validate.js"></script>
<script LANGUAGE="Javascript">
<!--
function Check()
			{
				var frm = document.forms(0);
				var NameOfPatient = frm.NameOfPatient.value;
				
				if (NameOfPatient=='')
				{
					alert("Please select NameOfPatient to Proceed");
				}
				}
			
//-->
</script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<BODY class=SC>
<h2 align=center>Bill Details</h2>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Condition = "NameOfPatient";
	String[] ConValues = new String[2000];
	int ConCount=0,i=0;
	String Query1="";
%>
<FORM Name='BillForm' METHOD=POST ACTION="GenerateBillReport1.jsp" onSubmit="return Check()">
			<CENTER><B><FONT face="verdana"> Select  NameOfPatient to view bill details</FONT></B></CENTER><BR><BR>
		 <center>
   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	<TR class=row_title ALIGN="center"> <TH COLSPAN="2">Bill Details</TH>
		<TR class=row_even>
			<TH><%=Condition.replace('`',' ')%></TH>
			<TD><SELECT NAME="<%=Condition%>">
			<OPTION Value="">Select</OPTION>

<%
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();

			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from billingmaster";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+" from billingmaster";
			}
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					ConValues[i]=x;
					%><OPTION Value=<%=ConValues[i]%>><%=ConValues[i]%></OPTION><%
					i++;
				}
		}catch(Exception e){%><%=e%><%}
%>
		</SELECT></TD>
		</TR>
		<TR class =row_even><TD align=center><Input type='Submit' name='submit' value='GetReport'></TD>
		<TD align=center><input type="reset" ID='Item' value="clear" ></TD>
		</TR>
		</TABLE>
</FORM>
</BODY>

