<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>grievance</title>
</head>
<body>
    <%
    String usertype=request.getParameter("usertype");
    String user_id=request.getParameter("user_id");
    String fullname=request.getParameter("fullname");
    String gender=request.getParameter("gender");
    String emailid=request.getParameter("emailid");
    String grievancemsg=request.getParameter("grievancemsg");
    String status="pending";
    Connection conn=null;
    try{
     Class.forName("com.mysql.cj.jdbc.Driver");
     conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","1234");
     if(conn==null){
        out.print("<h1>Database Error</h1>:");
     }else{
        String query="INSERT INTO grievance VALUES(NULL,?,?,?,?,?,?,?);";
        PreparedStatement ps= conn.prepareStatement(query);
        ps.setString(1, usertype);
        ps.setString(2, user_id);
        ps.setString(3, fullname);
        ps.setString(4, gender);
        ps.setString(5, emailid);
        ps.setString(6,grievancemsg);
        ps.setString(7, status);
        ps.executeUpdate();
        response.sendRedirect("index.html");
        ps.close();
     }
     conn.close();
    }
    catch(Exception e){
        out.println("<h3>Error: "+e.getMessage()+"</h3>");
    }
    
    %>
</body>
</html>
