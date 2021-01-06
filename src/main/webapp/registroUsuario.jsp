<%-- 
    Document   : resgistroUsuario
    Created on : 22-dic-2020, 10:18:06
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
        <title>Registro</title>
    </head>
    <body>
        <%@include file="WEB-INF/vista/menu.jspf" %>
        <c:if test="${not empty requestScope.mnsFinal}" >
            <div class="alert alert-success" role="alert">
                ${requestScope.mnsFinal}
            </div>
        </c:if>
        <br />
        <div class="container">
        <h4> REGISTRAR </h4>
        
        <form action="alta-usuario" method="post">
            <div class="form-group ">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" >

            </div>
            <div class="form-group ">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" >

            </div>
            <div class="form-group">
                <label for="psw">Contraseña</label>
                <input type="password" class="form-control" name="psw" >
            </div>

            <button type="submit" class="btn btn-primary">Registrar</button>
        </form>
        </div>
    </body>
</html>
