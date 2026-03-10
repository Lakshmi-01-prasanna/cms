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
                <form action="adminhome.jsp" method="post" >
                  <input type="text" name="loginid" id="loginid" placeholder="enter Adminid" required class="form-control"/><br/>
                  <input type="password" name="loginpwd" id="loginpwd" placeholder="enter Adminpwd" required class="form-control"/><br/>
                 <center><button type="submit" class="btn btn-success">Login</button></center> 
                  
                </form>
            </div>
            <div class="col-md-4 col-lg-4"></div>
        </div>
    </div>
     <div class="footer bg-dark text-white fixed-bottom" style="text-align:center;padding:10px;">
       <center><strong>&copy; Advanced java</strong></center> 
    </div>
</body>
</html>