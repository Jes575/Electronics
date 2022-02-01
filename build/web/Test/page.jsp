

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<%!
public int Converter(String str)
{
	int convrtr=0;
	if(str==null)
    	{
			str="0";
    	}
	else if((str.trim()).equals("null"))
    	{
			str="0";
    	}
	else if(str.equals(""))
    	{
			str="0";
    	}
	try{
			convrtr=Integer.parseInt(str);
    	}
	catch(Exception e)
    	{
    	}
	return convrtr;
}
%>

<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ec","root", "mysql");

	ResultSet rsPgin = null;
	ResultSet rsRwCn = null;
	PreparedStatement psPgintn=null;
	PreparedStatement psRwCn=null;
	
	// Number of records displayed on each page
	int iSwRws=1;  
	// Number of pages index displayed
	int iTotSrhRcrds=10; 
	
	int iTotRslts=Converter(request.getParameter("iTotRslts"));
	int iTotPags=Converter(request.getParameter("iTotPags"));
	int iPagNo=Converter(request.getParameter("iPagNo"));
	int cPagNo=Converter(request.getParameter("cPagNo"));

	int iStRsNo=0;
	int iEnRsNo=0;

	if(iPagNo==0)
    	{
			iPagNo=0;
    	}
	else{
			iPagNo=Math.abs((iPagNo-1)*iSwRws);
    	}
	
    String sqlPgintn="SELECT SQL_CALC_FOUND_ROWS * FROM logintb limit "+iPagNo+","+iSwRws+"";
    
    
	psPgintn=con.prepareStatement(sqlPgintn);
	rsPgin=psPgintn.executeQuery();
       
 	// Count total number of fetched rows
 	String sqlRwCnt="SELECT FOUND_ROWS() as cnt";
	psRwCn=con.prepareStatement(sqlRwCnt);
        
	rsRwCn=psRwCn.executeQuery();
	
	if(rsRwCn.next())
      {
		iTotRslts=rsRwCn.getInt("cnt");
      }
%>
<html>
	<head>
		<title>Pagination using JSP page</title>
	</head>
<body>
	<form name="frm">
		<input type="hidden" name="iPagNo" value="<%=iPagNo%>">
		<input type="hidden" name="cPagNo" value="<%=cPagNo%>">
		<input type="hidden" name="iSwRws" value="<%=iSwRws%>">
		
		<table width="100%" cellpadding="0" cellspacing="0" border="0" >
		<tr>
		<td>Emp Name</td>
		<td>Emp Batch</td>
		<td>Emp Address</td>
		</tr>
<%
	while(rsPgin.next())
	  {
%>
		<tr>
			<td><%=rsPgin.getString("uname")%></td>
			<td><%=rsPgin.getString("password")%></td>
			<td><%=rsPgin.getString("type")%></td>
		</tr>
<% 
 	 }
%>
<%
  	// Calculate next record start and end position 
	try{
		if(iTotRslts<(iPagNo+iSwRws))
            {
				iEnRsNo=iTotRslts;
            }
		else
            {
				iEnRsNo=(iPagNo+iSwRws);
            }

			iStRsNo=(iPagNo+1);
			iTotPags=((int)(Math.ceil((double)iTotRslts/iSwRws)));
       	}
	catch(Exception e)
        {
				e.printStackTrace();
        }
%>
<tr>
<td colspan="3">
    
<div>
<%
     // Create index of pages 
	int i=0;
	int cPge=0;
	if(iTotRslts!=0)
       {
		cPge=((int)(Math.ceil((double)iEnRsNo/(iTotSrhRcrds*iSwRws))));
		int prePageNo=(cPge*iTotSrhRcrds)-((iTotSrhRcrds-1)+iTotSrhRcrds);
		if((cPge*iTotSrhRcrds)-(iTotSrhRcrds)>0)
        	{
        %>
		<a href="page.jsp?iPagNo=<%=prePageNo%>&cPagNo=<%=prePageNo%>"><< Previous</a>
		<%
        }
		
		for(i=((cPge*iTotSrhRcrds)-(iTotSrhRcrds-1));i<=(cPge*iTotSrhRcrds);i++)
        {
			if(i==((iPagNo/iSwRws)+1))
          	{
          	%>
		<a href="page.jsp?iPagNo=<%=i%>" style="cursor:pointer;color:red"><b><%=i%></b></a>
			<%
          	}
			else if(i<=iTotPags)
          	{
          	%>
		<a href="page.jsp?iPagNo=<%=i%>"><%=i%></a>
			<% 
          	}
        }
	
		if(iTotPags>iTotSrhRcrds&& i<iTotPags)
        {
         %>
		<a href="page.jsp?iPagNo=<%=i%>&cPagNo=<%=i%>">>> Next</a>
		<%
        }
      }
      %>
	<b>Rows <%=iStRsNo%> - <%=iEnRsNo%>   Total Result  <%=iTotRslts%></b>
</div>

</td>
</tr>
</table>
</form>
</body>
</html>
<%
try{
	if(psPgintn!=null){
		psPgintn.close();
	}
	if(rsPgin!=null){
		rsPgin.close();
	}	
	if(psRwCn!=null){
		psRwCn.close();
	}
	if(rsRwCn!=null){
		rsRwCn.close();
	}
	if(con!=null){
		con.close();
	}
  }
catch(Exception e)
  {
	e.printStackTrace();
  }
%>

