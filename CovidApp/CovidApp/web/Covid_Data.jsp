<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

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
                     <li class="nav-item ">
                      <a class="nav-link" href="./dashboard">Profile                      
                      </a>
                  </li>
                   <li class="nav-item active">
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
     
       

        <main role="main" class="col-md-12 ml-sm-auto col-lg-12 pt-3 px-4">
          <div style="padding-top:80px !important" class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2" id="#profile">Data Validation</h1>
            </div>  
            <div class="text-center container-fluid">
                
                <a  data-toggle="modal" data-target="#myModal" style="display:none" id="triggerModal" class="btn btn-secondary">HIDDEN</a>                   
                       <!-- 
                       MODEL
                       -->
                       <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content bg-dark text-light">
                    <div class="modal-body">
                        <section id="register" class="container-fluid text-center py-4 mt-4">
                            <h2 class="display-4 pb-4 my-4">Update Country</h2>
                            <div class="text-center container-fluid">
                                <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">ISO Code</label>
                                        <input type="text" data-country id="iso" placeholder="ISO CODE" disabled class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Country Name</label>
                                        <input type="text" data-country id="name" placeholder="Country Name" class="form-control">
                                    </div>
                                </div>
                            
                                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="SaveC(this)">Save</button>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
                
                
                
                       
                       
     
                       <!-- 
                       MODEL
                       -->
                       <div class="modal fade" id="myModal1" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content bg-dark text-light">
                    <div class="modal-body">
                        <section id="register" class="container-fluid text-center py-4 mt-4">
                            <h2 class="display-4 pb-4 my-4">Add Country</h2>
                            <div class="text-center container-fluid">
                                <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">ISO Code</label>
                                        <input type="text" data-new-country id="iso" placeholder="ISO CODE"  class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Country Name</label>
                                        <input type="text" data-new-country id="name" placeholder="Country Name" class="form-control">
                                    </div>
                                </div>
                            
                                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="AddC(this)">Add</button>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
                
                                       
                       
                
                
                
                
                
                
                
                
                
                
                
                <a data-toggle="modal" data-target="#myModal1" class="btn btn-danger text-light float-right mb-1">New</a>
                <table id="ct" class="table table-striped">
                    <thead>                      
                        <tr>
                            <th>ISO Code</th>
                            <th>Country Name</th> 
                            <th>Action </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                       ArrayList<String[]> d = (ArrayList<String[]>) request.getAttribute("countries");
                     
                        for(String[] f:d){
                        
                        %>
                        <tr>
                            <td><%=f[0]%></td>
                             <td><%=f[1]%></td>
                             <td>
                                 <a class="btn btn-danger text-light" onclick="Delete(this)"  id="<%=f[0]%>">Delete</a>
                                 <a class="btn btn-primary text-light" onclick="Update(this)"  id="<%=f[0]%>">Update</a>
                             </td>
                             
                            
                        </tr>
                        <%
                            }
                       %>
                      
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>ISO Code</th>
                            <th>Country Name</th> 
                            <th>Action </th>
                        </tr>
                    </tfoot>
                </table>
                    <!--<!-- CRUD of COVID DATA  FOR ANY COUNTRY ON ANY DATE --> 
                   
                      <a data-toggle="modal" data-target="#myModal900" class="btn btn-danger text-light float-right mb-1">New Record</a>
                     <table id="cot" class="table table-striped mt-2">
                    <thead>                      
                        <tr>
                            <th>ISO Code</th>
                            <th>Date</th> 
                            <th>Location </th>
                            <th>Cases </th>
                            <th>Deaths </th>
                            <th>Action </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                    ArrayList<String[]> d1  = (ArrayList<String[]>) request.getAttribute("covid_data");
                        for(String[] f:d1){
                        
                        %>
                        <tr>
                            <td><%=f[0]%></td>
                             <td><%=f[1]%></td>
                             <td><%=f[2]%></td>
                             <td><%=f[3]%></td>
                             <td><%=f[4]%></td>
                             <td>
                                 <a class="btn btn-danger text-light" onclick="DeleteD(this)"  id="<%=f[0]%>:<%=f[1]%>">Delete</a>
                                 <a class="btn btn-primary text-light" onclick="UpdateD(this)"  id="<%=f[0]%>:<%=f[1]%>">Update</a>
                             </td>
                             
                            
                        </tr>
                        <%
                            }
                       %>
                      
                    </tbody>
                    <tfoot>
                        <tr>
                         <th>ISO Code</th>
                            <th>Date</th> 
                            <th>Location </th>
                            <th>Cases </th>
                            <th>Deaths </th>
                            <th>Action </th>
                        </tr>
                    </tfoot>
                </table>
                       
                       
              <a  data-toggle="modal" data-target="#myModal100" style="display:none" id="triggerModalU" class="btn btn-secondary">HIDDEN</a>                                
                       
                            <div class="modal fade" id="myModal100" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content bg-dark text-light">
                    <div class="modal-body">
                        <section id="register" class="container-fluid text-center py-4 mt-4">
                         
                            <div class="text-center container-fluid">
                                <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">ISO Code</label>
                                        <input type="text" data-update-covid id="iso" placeholder="ISO CODE" disabled class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Date</label>
                                        <input type="text" data-update-covid id="date" disabled placeholder="Date" class="form-control">
                                    </div>
                                </div>
                                 <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">Country Name</label>
                                        <input type="text" data-update-covid id="name"  disabled placeholder="Country Name"  class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Cases</label>
                                        <input type="text" data-update-covid id="case" placeholder="New Cases" class="form-control">
                                    </div>
                                </div>
                                 <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">Deaths</label>
                                        <input type="text" data-update-covid id="death"   placeholder="New Deaths"  class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Vaccinated</label>
                                        <input type="text" data-update-covid id="vacc" placeholder="Vaccinations" class="form-control">
                                    </div>
                                </div> 
                            
                                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="UpdateCD(this)">Save</button>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
                
                
                
           
           <div class="modal fade" id="myModal900" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content bg-dark text-light">
                    <div class="modal-body">
                        <section id="register" class="container-fluid text-center py-4 mt-4">
                            <h2 class="display-4 pb-4 my-4">New COVID Data</h2>
                            <div class="text-center container-fluid">
                                <div class="row ">
                                    <div class="col-md-12 col-lg-12 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">ISO Code</label>
                                        <input type="text" data-new-covid id="iso" placeholder="ISO CODE"  class="form-control">
                                    </div>
                                    
                                </div>
                                 <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">Country Name</label>
                                        <input type="text" data-new-covid id="name"   placeholder="Country Name"  class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Cases</label>
                                        <input type="text" data-new-covid id="case" placeholder="New Cases" class="form-control">
                                    </div>
                                </div>
                                 <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">Deaths</label>
                                        <input type="text" data-new-covid id="death"   placeholder="New Deaths"  class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Vaccinated</label>
                                        <input type="text" data-new-covid id="vacc" placeholder="Vaccinations" class="form-control">
                                    </div>
                                </div> 
                            
                                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="AddCD(this)">Add</button>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
                
                
                
                  
                       
                       
           
              
              
              
                       
                       
                       
            </div>
        </main>

    </div>

                   
        
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    <script>
        $(document).ready(function(){
            $("#ct").DataTable();
              $("#cot").DataTable();
        })
        </script>
        
        <script src="./js/validator.js"></script>
  </body>
</html>
