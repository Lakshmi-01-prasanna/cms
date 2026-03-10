<%@page language="java"  import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grievance Redressal</title>
    <link rel="stylesheet" href="bootstrap-5.3.8-dist/css/bootstrap.min.css" />
    <script src="bootstrap-5.3.8-dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <%
              try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn= null;
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","1234");
                    if(conn==null){
                        out.print("<h1>Connection error:</h1>");
                    }else{
                       
                        int gid=Integer.parseInt(request.getParameter("gid"));
                        String query="UPDATE grievance SET status='resolved' WHERE id="+gid+";";
                        Statement stmt=conn.createStatement(); 
                        stmt.executeUpdate(query);
                        stmt.close();
                        response.sendRedirect("viewstatus.jsp");
                        
                       
                    }
                    conn.close();
                }catch(Exception e){
                    out.print("Error:"+e.getMessage());
                }
                %>

    </div><br/>
    <div class="footer bg-dark text-white fixed-bottom" style="text-align: center;padding:10px;">&copy; Advanced Java</div>
</body>
</html>