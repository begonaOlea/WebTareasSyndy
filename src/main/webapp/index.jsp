<%-- 
    Document   : index
    Created on : 22-dic-2020, 10:15:55
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/vista/bootstrap.jspf"%>
        <title>Inicio</title>

        <style>
            body  {

                background-image: url("img/lightbulb-2692247_1920.jpg");
                background-color: #cccccc;
                height: 800px;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                position: relative;
            }
        </style>
    </head>

    <body>
        <h1 class="text-center">¡TU LISTA DE TAREAS!</h1>
        <%@include file="WEB-INF/vista/menu.jspf" %>

        <!--configuarar un card de tarea para el login -->
        <div class="card" style="width:400px">
            <img class="card-img-top"  src="img/login.png" alt="Card image" style="width:30%">
            <div class="card-body">
                <h4 class="card-title">LOGIN</h4>
                <form action="login" method="post">
                    <div class="imgcontainer">
                        <img src="img_avatar2.png" alt="Avatar" class="avatar">
                    </div>

                    <div class="container">
                        <label for="uname"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="uname" required>

                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="psw" required>

                        <button type="submit">Login</button>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                        <button type="button" class="cancelbtn">Cancel</button>
                        <span class="psw">Forgot <a href="#">password?</a></span>
                    </div>
                </form>
            </div>
        </div>
        <br>

    </body>
</html>
