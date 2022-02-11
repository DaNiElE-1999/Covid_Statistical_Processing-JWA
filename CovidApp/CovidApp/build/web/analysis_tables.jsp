<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Covid Application</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="./css/style.css">
        <link rel = "icon" href = "./assets/coronavirus.png"  type = "image/x-icon">
        <link rel="stylesheet"  href="./css/alertify.css">
        <link rel="stylesheet" href="./css/semantic.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

        <!-- include alertify script -->
        <script src="./js/alertify.js"></script>
    </head>
    <body>
       <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container text-center d-flex flex-column">
                
                <div class="collapse navbar-collapse   text-center" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item ">
                            <a class="nav-link" href="./">Home 

                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="./analysis">Analysis</a>
                        </li>
                      
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact</a>
                        </li>
                        <% 
                       HttpSession s = request.getSession(false);
                        if (s == null) {
                           %>
                             <li class="nav-item">
                            <a class="nav-link" href="#login">Authenticate</a>
                        </li>
                           
                       <%
                        } else if (s.getAttribute("currentUser") == null) {
                            %>
                             <li class="nav-item">
                            <a class="nav-link" href="#login">Authenticate</a>
                        </li>
                           
                           <%
                        }else{
                            %>
                             <li class="nav-item">
                            <a class="nav-link" href="./dashboard">Profile</a>
                        </li>
                            <%
                        
                        }
                            
                        %>
                      
                        
                      
                    </ul>
                </div>
            </div>
        </nav>

      <header id="home" class="jumbotron jumbotron-fluid">
        <div class="container-fluid text-center"> 
           <h1 class="display-3 text-light">Covid Virus Data Analysis</h1>
           <br><br><br><br><br><br><br>
        </div>
    
    </header>
        <section id="data" class="container-fluid bg-light">
            <h2 class="display-4 text-center   mt-5 mb-3">Covid 19 Data</h2>
            <table id="dataT" class="  table table-striped">
                <thead>
                    <tr>
                        <th>
                            Country
                        </th>
                        <th>
                            Region
                        </th>
                        <th>
                            Total Cases
                        </th>
                        <th>
                            New Cases
                        </th>
                        <th>
                            Total Death
                        </th>
                        <th>
                            New Death
                        </th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        ArrayList<String[]> d = (ArrayList<String[]>) request.getAttribute("d");
                        for(String[] f : d){
                        
                    %>
                    <tr>
                        <td><%=f[0]%></td>
                        <td><%=f[1]%></td>
                        <td><%=f[2]%></td>
                        <td><%=f[3]%></td>
                        <td><%=f[4]%></td>
                        <td><%=f[5]%></td>

                    </tr>
                    <%
                       
                       
                   }

                    %>

                </tbody>
                <tfoot>
                    <tr>
                        <th>
                            Country
                        </th>
                        <th>
                            Region
                        </th>
                        <th>
                            Total Cases
                        </th>
                        <th>
                            New Cases
                        </th>
                        <th>
                            Total Death
                        </th>
                        <th>
                            New Death
                        </th>
                    </tr>
                </tfoot>
            </table>
            <h2 class="display-4 text-center mt-5 mb-3">Commulative Data</h2>
            <%
                if(!request.getAttribute("email").equals("0")){
            %>
            <div class="d-flex justify-content-around mt-3 mb-3">
                <button class="btn btn-success" onclick="AllCountries(this)">All Countries</button>
                <button class="btn btn-danger" onclick="byCont()">Continent</button>
                <button class="btn btn-dark" onclick="byList()">Multiple Countries</button>

            </div>
            <% }

            %>
            <table id="dataC" class="table table-striped">
                <thead>
                    <tr>
                        <th>
                            Country
                        </th>
                        <th>
                            Region
                        </th>
                        <th>
                            Total Cases
                        </th>
                        <th>
                            Total Death
                        </th>
                        <th>
                            Total Vaccinated
                        </th>
                    </tr>
                </thead>
                <tbody id="tb">



                </tbody>
                <tfoot>
                    <tr>
                        <th>
                            Country
                        </th>
                        <th>
                            Region
                        </th>
                        <th>
                            Total Cases
                        </th>
                        <th>
                            Total Death
                        </th>
                        <th>
                            Total Vaccinated
                        </th>
                    </tr>
                </tfoot>
            </table>
        </section>

        <% 
    
     if (s == null) {

    
        %>
        <section id="login" class="bg-dark text-light container-fluid text-center py-4">
            <h2 class="display-4 pb-4 my-4">Sign In</h2>
            <div class="col-md-12 col-lg-4 text-center container-fluid">
                <div class="row ">
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="email" class="font-weight-bold">Email</label>
                        <input type="email" data-login id="email" placeholder="e.g. example@xyz.com" class="form-control">
                    </div>
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="pass" class="font-weight-bold">Password</label>
                        <input type="password" data-login id="pass" placeholder="your account password" class="form-control">
                    </div>
                </div>
                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="Login(this)">Login</button>

            </div>
            <a  data-toggle="modal" data-target="#myModal" class="btn btn-secondary">Register</a>
        </section>
        <%
            }
        else if (s.getAttribute("currentUser") == null) {
        %>
        <section id="login" class="bg-dark text-light container-fluid text-center py-4">
            <h2 class="display-4 pb-4 my-4">Sign In</h2>
            <div class="col-md-12 col-lg-4 text-center container-fluid">
                <div class="row ">
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="email" class="font-weight-bold">Email</label>
                        <input type="email" data-login id="email" placeholder="e.g. example@xyz.com" class="form-control">
                    </div>
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="pass" class="font-weight-bold">Password</label>
                        <input type="password" data-login id="pass" placeholder="your account password" class="form-control">
                    </div>
                </div>
                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="Login(this)">Login</button>

            </div>
            <a  data-toggle="modal" data-target="#myModal" class="btn btn-secondary">Register</a>
        </section>

        <%
}
        %>



        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content bg-dark text-light">
                    <div class="modal-body">
                        <section id="register" class="container-fluid text-center py-4">
                            <h2 class="display-4 pb-4 my-4">Sign Up</h2>
                            <div class="text-center container-fluid">
                                <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">First Name</label>
                                        <input type="text" data-register id="fname" placeholder="your first name" class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Sur Name</label>
                                        <input type="text" data-register id="lname" placeholder="your last name" class="form-control">
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="email" class="font-weight-bold">Email</label>
                                        <input type="email" data-register id="email" placeholder="e.g. example@xyz.com" class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12  form-group">
                                        <label for="pass" class="font-weight-bold">Password</label>
                                        <input type="pass" data-register id="password" placeholder="Password" class="form-control">
                                    </div>
                                </div>
                                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="Register(this)">Register</button>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

 <section class="container-fluid text-center py-4" id="contact">
            <h2 class="display-4 pb-4 my-4 text-light">You have Any Question?</h2>
            
            <a href="mailto:xyz@abc.com" class="btn btn-primary btn-lg mb-4" role="button">Contact us</a>
        </section>

        <footer class="py-3 bg-dark">
            <div class="container">
                <p class="text-right  text-light small">Copyright &copy; 2022</p>
            </div>
        </footer>
    </body>
        <script src="./js/validator.js" ></script>
     <script>
         
         
         const ByContienent = (e)=>{
             
            $.ajax({
    url: './getData',
    type: 'post',
    data: {
        "continent": e
    },
    headers: {
        "email":"<%=request.getAttribute("email")%>",
        "password":"<%=request.getAttribute("password")%>"
        
    },
    dataType: 'json',
    success: function (data) {
        $("#tb").html("");
        for(i=0;i<data.length;i++){
            dt = data[i]
            iso = dt["iso"];
            loc = dt["location"]
        cases = dt["cases"]
        deaths = dt["deaths"]
        vacc = dt["vaccinated"]
        
            var  tr = "<tr><td>"+iso+"</td><td>"+loc+"</td><td>"+cases+"</td><td>"+deaths+"</td><td>"+vacc+"</td></tr>";
            $("#tb").append(tr);
        }
          $("#dataC").DataTable();
            
}
});
       
         }
           const ByList = (e)=>{
             
            $.ajax({
    url: './getData',
    type: 'post',
    data: {
        "list": e
    },
    headers: {
        "email":"<%=request.getAttribute("email")%>",
        "password":"<%=request.getAttribute("password")%>"
        
    },
    dataType: 'json',
    success: function (data) {
        $("#tb").html("");
        for(i=0;i<data.length;i++){
            dt = data[i]
            iso = dt["iso"];
            loc = dt["location"]
        cases = dt["cases"]
        deaths = dt["deaths"]
        vacc = dt["vaccinated"]
        
            var  tr = "<tr><td>"+iso+"</td><td>"+loc+"</td><td>"+cases+"</td><td>"+deaths+"</td><td>"+vacc+"</td></tr>";
            $("#tb").append(tr);
        }
          $("#dataC").DataTable();
            
}
});
       
         }
         
         
       const AllCountries = (e)=>{
           if(e != ""){
              
               showLoader(e);
               
                   window.location.href="./analysis";
                   
              
               return
           }
            $.ajax({
    url: './getData',
    type: 'post',
    data: {
        "c:": "1"
    },
    headers: {
        "email":"<%=request.getAttribute("email")%>",
        "password":"<%=request.getAttribute("password")%>"
        
    },
    dataType: 'json',
    success: function (data) {
        $("#tb").html("");
        for(i=0;i<data.length;i++){
            dt = data[i]
            iso = dt["iso"];
            loc = dt["location"]
        cases = dt["cases"]
        deaths = dt["deaths"]
        vacc = dt["vaccinated"]
        
            var  tr = "<tr><td>"+iso+"</td><td>"+loc+"</td><td>"+cases+"</td><td>"+deaths+"</td><td>"+vacc+"</td></tr>";
            $("#tb").append(tr);
        }
          $("#dataC").DataTable();
            
}
});
       }
       
     
       $(document).ready(function(){
          $(".nav-item").on("click",function(){
             $(".nav-item").removeClass("active");
             $(this).addClass("active")
          })
          $("#dataT").DataTable();
          const f=getUrlParameter("f");
      if(f == "c"){
           ByContienent(getUrlParameter("v"));
      }
      else if(f == "l"){
          ByList(getUrlParameter("v"))
          
      }else{
          AllCountries("");
          
      }
    
          
        
          
       });
 
   
    </script>

   
</html>