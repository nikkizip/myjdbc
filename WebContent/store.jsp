<%@ page import="java.sql.*"%>

<%
String name=request.getParameter("rname");
String email=request.getParameter("remail");
String gender=request.getParameter("rgender");
String pass=request.getParameter("renterpass");	
String pass1=request.getParameter("rconfirmpass");
if(pass.equals(pass1)){
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://mysql-rds.cjpjhzpwrgrn.ap-south-1.rds.amazonaws.com:3306/zippyopsdb","admin","zippyops");
	PreparedStatement ps=conn.prepareStatement("insert into registration values(?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, gender);
	ps.setString(4, pass);
	int x=ps.executeUpdate();
	if(x!=0){
		out.print("signup successfully");
	}else{
		out.print("something went wrong....");
	}
}catch(Exception e){
	out.print(e);
}
}else{
	out.print("password not matching.....");
}
%>
