<%-- 
    Document   : usuarios
    Created on : Jan 5, 2021, 9:02:59 AM
    Author     : joha
--%>

<%@page import="java.util.Collection"%>
<%@page import="com.tareas.modelo.Usuario"%>
<%@page import="com.tareas.servicios.DBUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/vista/bootstrap.jspf"%>
        <style><%@include file="/WEB-INF/vista/estilos.css"%></style>
        <title>Nuestros usuarios</title>
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
            <div class="row">
            <%
                Collection<Usuario> usuarios = DBUsuario.listaUsuarios();
                for (Usuario us : usuarios) {%>
<div class="col-sm">
            <div class="card" style="width:400px">
                <img class="card-img-top  mx-auto d-block" src="img/perfil(1).png" alt="Card image" style="width:20%">
                <div class="card-body">

                    <h4 class="card-title text-center"><%= us.getNombre()%></h4>
                </div>
            </div>
</div>
<% }%>
            </div>
        </div>
        

    </body>
</html>
