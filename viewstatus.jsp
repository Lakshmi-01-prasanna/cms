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
<body style=" background:linear-gradient(170deg,rgb(231, 231, 117) 10%,#11d6d6 90%);">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 col-lg-4"> </div>
            <div class="col-md-4 col-lg-4 ">
                <a href="index.html" ><img src="images/gr4.png" alt="not found" width="100%" height="300" /></a>
            </div>
            <div class="col-md-4 col-lg-4"></div>
        </div><br/>
        <div class="row">
            <div  >
               <h3 class="col-md-12 col-lg-12 bg-dark text-white text-center" ><i>GRIEVANCE REDRESSAL</i></h3>
            </div>
        </div><br/>
        <div class="row">
            <div class="col-md-8 col-lg-8"></div>
            <div class="col-md-4 col-lg-4 text-end"  >
               
                    <a href="adminlogin.jsp"  class="btn btn-outline-success"><strong>Admin Login</strong> </a>
                &nbsp;
                    <a href="status.jsp" class="btn btn-outline-danger  "><strong>Status</strong></a>
                    <a href="index.html" class="btn btn-outline-primary  "><strong>Home</strong></a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4 "></div>
            <div class="col-md-4 col-lg-4">
                        <div style="text-align:center;">
                            <form method="post">
                                <select name="status" id="status" class="form-control" required>
                                    <option value="" >--select status--</option>
                                    <option value="pending">Pending</option>
                                    <option value="resolved">Resolved</option>
                                    <option value="deleted">Deleted</option> 
                                </select><br/>
                                <button type="submit" class="btn btn-success">Fetch</button>
                            </form><br/>
                            <%
                                try{
                                Connection conn=null;
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","1234");
                                if(conn==null){
                                    out.print("Connection Error");
                                }else{
                                        if(request.getParameter("status")!=null){
                                            String status=request.getParameter("status");
                                            String statusquery="SELECT id,emailid,grievancemsg,status FROM grievance WHERE status='"+status+"';";
                                            Statement stmt=conn.createStatement();
                                            ResultSet rs2=stmt.executeQuery(statusquery);
                                            %>
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>S.No</th>
                                                    <th>Posted By</th>
                                                    <th>Grievance Message</th>
                                                    <th>status</th>
                                                    <% if(status.equals("pending")){%>
                                                        <th>Action</th>
                                                        <% } %>
                                                </tr>
                                                <%
                                                int sno=1;
                                                while(rs2.next()){
                                                    out.print("<tr><td>"+sno+"</td>");
                                                        sno++;
                                                    out.print("<td>"+rs2.getString("emailid")+"</td>");
                                                    out.print("<td>"+rs2.getString("grievancemsg")+"</td>");
                                                    out.print("<td>"+rs2.getString("status")+"</td>");
                                                    if(status.equals("pending")){
                                                %>
                                                <td><form name="resolvedaction" action="resolvedaction.jsp" method="post">
                                                    <input type="hidden" name="gid" value='<%= rs2.getInt("id") %>' />
                                                    <button type="submit" name='<%= rs2.getInt("id") %>' class="btn btn-primary">Resolved</button>
                                                </form><br />
                                                <form name="deletedaction" action="deletedaction.jsp" method="post">
                                                    <input type="hidden" name="gid" value='<%= rs2.getInt("id") %>' />
                                                    <button type="submit" name='<%= rs2.getInt("id") %>' class="btn btn-danger" >Deleted</button>
                                                </form><br />
                                                </td>
                                           <% 
                                            }
                                            out.print("</tr>");
                                        }
                                           rs2.close();
                                           stmt.close();
                                           %>
                                </table><br/>
                              <%}
                            }
                            conn.close();
                        }catch(Exception e){
                                  out.println("<h3>Error: "+e.getMessage()+"</h3>");
                            }
                            %>
                         </div>
            </div>
            <div class="col-md-4 col-lg-4"></div>
        </div>
    </div><br/>
     <div class="footer bg-dark text-white fixed-bottom" style="text-align:center;padding:10px;">
       <center><strong>&copy; Advanced java</strong></center> 
    </div>
</body>
</html>