<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>   
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="./assets/coronavirus.png" type="image/png">
    <title>Dashboard</title>
    <link href="./css/dashboard.css" rel="stylesheet">
    <style>
     
        *{
            user-select: none;
            outline: none;
            transition:  all 0.23s ease-in-out;
        }
        html{
            scroll-behavior: smooth !important;
        }
       
    </style>

 <link rel="stylesheet"  href="./css/alertify.css">
        <link rel="stylesheet" href="./css/semantic.css">


        <!-- include alertify script -->
        <script src="./js/alertify.js"></script>
  </head>

  <body>
   <nav class="navbar navbar-expand-lg d-flex flex-column navbar-dark bg-dark fixed-top">
      <div class="container">
        
              
          <div class="row d-flex">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                      <a class="nav-link" href="./">Home                      
                      </a>
                  </li>
                     <li class="nav-item active">
                      <a class="nav-link" href="./dashboard">Profile                      
                      </a>
                  </li>
                   <li class="nav-item ">
                      <a class="nav-link" href="./covid_data">Covid Data                      
                      </a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="./logout">Logout</a>
                  </li>
              </ul>
          </div>
      </div>
  </nav>

    <div class="container-fluid">
      
        <%
        
            String[] d = (String[]) request.getAttribute("userData");
                    
        %>
        <main role="main" class="col-md-12 ml-sm-auto col-lg-12 pt-3 px-4">
          <div style="padding-top:80px !important" class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
              <h1 class="h2" id="#profile">Profile <span class="text-bold text-danger" style="font-size:10px !important">(<%=d[0] %>)</span></h1>
            </div>  
            <div class="text-center container-fluid">
              
               <div class="row">
                  <div class="form-group col-lg-6 col-sm-6 col-md-6">
                     <label for="email" class="col-sm-12 col-md-12 col-lg-12 ">Email</label>
                     <input type="email" data-update value="<%=d[0]%>" class="form-control col-sm-12 col-md-12 col-lg-12" placeholder="Your Email" id="email" readonly>
                  </div>
                  <div class="form-group col-lg-6 col-sm-6 col-md-6">
                      <label for="password" class="col-sm-12 col-md-12 col-lg-12 ">Password (<span class="text-bold text-danger" id="show">show</span>)</label>
                     <input type="password" data-update value="<%=d[1]%>"  class="form-control col-sm-12 col-md-12 col-lg-12" placeholder="Your Password" id="password">
                     
                  </div>
               </div>
               <div class="row">
                  <div class="form-group col-lg-6 col-sm-6 col-md-6">
                     <label for="fname" class="col-sm-12 col-md-12 col-lg-12 ">First Name</label>
                     <input type="text" data-update value="<%=d[2] %>" class="form-control col-sm-12 col-md-12 col-lg-12" placeholder="Your First Name" id="fname">
                  </div>
                  <div class="form-group col-lg-6 col-sm-6 col-md-6">
                     <label for="lname" class="col-sm-12 col-md-12 col-lg-12 ">Last Name</label>
                     <input type="text" data-update value="<%=d[3]%>" class="form-control col-sm-12 col-md-12 col-lg-12" placeholder="Your Last Name" id="lname">
                  </div>
               </div>
               <a class="btn-danger btn" href="./dashboard">Cancel</a>
               <button class="btn-primary btn" onclick="update(this)">Update</button>
            </div>
        </main>
     
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   
   
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    <script>
        $(document).ready(function(){
          $("#show").on('click',function(){
              let type = $("#password").attr("type");
              if(type == "password"){
                  $("#password").attr("type","text");
                  $(this).text("hide");
              }
              else{
                  $("#password").attr("type","password");
                  $(this).text("hide");
              }
          })  
        })
        </script>
        <script src="./js/validator.js"></script>
  </body>
</html>
