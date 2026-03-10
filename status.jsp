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
               
                    <a href="adminlogin.jsp"  class="btn btn-outline-success   "><strong>Admin Login</strong> </a>
                &nbsp;
                    <a href="status.jsp" class="btn btn-outline-danger  "><strong>Status</strong></a>
                    <a href="index.html" class="btn btn-outline-primary  "><strong>Home</strong></a>
                

            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4"></div>
            <div class="col-md-4 col-lg-4">
                <form method="post">
                    <label>Email-id</label>
                   <div> <input type="email" name="emailid" id="emailid"  class="form-control" placeholder="emailid" required></input> </div><br/>
                   <div class="text-center"><button type="submit" name="checkstatus" class="btn btn-dark text-white" >checkstatus</button></div>
                </form><br/>
                <%
                if(request.getParameter("checkstatus")!=null){
                    String emailid=request.getParameter("emailid");
                    String status="pending";
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn= null;
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","1234");
                        if(conn==null){
                            out.print("<h1>Database error:</h1>");
                        }else{
                            Statement stmt=conn.createStatement();
                            String s="SELECT grievancemsg,status FROM grievance WHERE emailid='"+emailid+"'";
                            ResultSet rs = stmt.executeQuery(s);
                            %>
                        <table class="table table-bordered table-stripped">
                        
                            <tr>
                                <th>sno</th>
                                <th>grievancemsg</th>
                                <th>status</th>
                            </tr>
                            <%
                                int sno = 1;
                                while(rs.next()){
                            %>
                                <tr>
                                    <td><%= sno %></td>
                                    <td><%= rs.getString("grievancemsg") %></td>
                                    <td><%= rs.getString("status") %></td>
                                </tr>
                            <%
                                    sno++;
                                }
                            %>
                            </table>

                        <div>
                            <div><i>*Pending:</i>Your grievance is considered and worked on</div>
                            <div><i>*Resolved:</i>Grievance were solved</div>
                            <div><i>*Deleted:</i>Your grievance is not countable</div>
                        </div><br/>
                           
                       <%
                       rs.close();
                       stmt.close();
                    }
                    conn.close();
                    }catch(Exception e){
                        out.print("Error:"+e.getMessage());
                    }
                }
                %>
            </div>
            <div class="col-md-4 col-lg-4"></div>
        </div>
    </div><br/>
    <div class="footer bg-dark text-white fixed-bottom" style="text-align:center;padding:10px;">
       <center><strong>&copy; Advanced java</strong></center> 
    </div>
</body>
    </html>
        