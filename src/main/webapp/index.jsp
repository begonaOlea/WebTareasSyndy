<%-- 
    Document   : index
    Created on : 22-dic-2020, 10:15:55
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/vista/bootstrap.jspf"%>
        <style><%@include file="/WEB-INF/vista/estilos.css"%></style>
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
        <%@include file="WEB-INF/vista/menu.jspf" %>
        <br />
        <!--configurar un card  para el login -->
        <div class="row float-right border border-secondary rounded">
        <div class="card bg-secondary text-white" style="width:300px" >
            <img class="card-img border border-dark rounded-circle rounded mx-auto d-block "  src="img/login.png" alt="Card image" style="width:20%">
            <div class="card-body">
                <h4 class="card-title font-weight-bold text-center">LOGIN</h4>
                <!-- mensaje error alta -->
            <c:if test="${not empty requestScope.mnsFinal }" >
                <div class="alert alert-success" role="alert">
                    ${requestScope.mnsFinal}
                </div>
            </c:if>
                <form action="login-user" method="post">
                    <div class="container">
                        <label for="uname"><b>Correo: </b></label>
                        <div class="col">${ requestScope.mnsName }</div>
                        <input type="text" placeholder="Enter Username" name="uname" required>
                        <br />
                        <label for="psw"><b>Contraseña: </b></label>
                        <br />
                        <input type="password" placeholder="Enter Password" name="psw" required>
                        <div class="col">${ requestScope.mnsPas }</div>
                        <button type="submit">Ingresar</button>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Recuerdame
                        </label>
                    </div>

                </form>
            </div>
        </div>
         </div>

    </body>
</html>
