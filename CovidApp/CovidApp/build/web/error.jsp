<%-- 
    Document   : index
    Created on : Jan 31, 2022, 11:13:00 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.dbUtil" %>
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
        <style>
            body{
                overflow: hidden;
            }
            </style>
    </head>
    <body>
        <section class="container-fluid mt-0 text-center">
            <div class="text-center">
               
                <img id="logo"  style="width:20% !important"  class="img-fluid mx-auto d-block"  src="./assets/coronavirus.png">
                <h1 class="text-muted">404</h1>
                <a href="./" class="btn btn-primary" >Take me Home</a>
            </div>
            <% if(dbUtil.DEBUG) {
            
                %>
                <hr>
            <p class="text-justify " >
                <code>
                    <%= dbUtil.ERROR %>
                </code>
            </p>
            <hr>
            <%
                }
            %>
        </section>
    </body>
</html>