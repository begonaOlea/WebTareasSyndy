<%-- 
    Document   : tareas
    Created on : 23-dic-2020, 9:11:22
    Author     : user
--%>

<%@page import="com.tareas.servicios.DBTareas"%>
<%@page import="com.tareas.modelo.Usuario"%>
<%@page import="com.tareas.modelo.Tarea"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="text-center">¡TU LISTA DE TAREAS!</h1>
        <%@include file="WEB-INF/vista/menu.jspf" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4" style="background-color:lavender;">HACER
                    <div class="container mt-3">
                        <c:forEach var="tarea" items="${ requestScope.colecionTareasHacer }">
                            <ul class="list-group">
                                <li class="list-group-item active">${ tarea.tarea}
                                    <button type="button" class="btn btn-info">-->
                                <a href="/cambiar-estado?id=${tarea.tarea.id}"></a>
                                </button></li>
                            </ul>
                        </c:forEach>            
                    </div>
                </div>
                <div class="col-sm-4" style="background-color:lavender;">EN PROGRESO
                    <div class="container mt-3">
                        <c:forEach var="tarea" items="${ requestScope.colectionTareasProgreso }">
                            <ul class="list-group">
                                <li class="list-group-item active">${ tarea.tarea}
                                    <button type="button" class="btn btn-info">--></button></li>
                            </ul>
                        </c:forEach>            
                    </div>
                </div>
                <div class="col-sm-4" style="background-color:lavender;">HECHO
                    <div class="container mt-3">
                        <c:forEach var="tarea" items="${ requestScope.colectionTareasHecho }">
                            <ul class="list-group">
                                <li class="list-group-item active">${tarea.tarea}
                                    <button type="button" class="btn btn-info">--></button></li>
                            </ul>
                        </c:forEach>            
                    </div>
                </div>
            </div>
            <br />
        </div>
    </body>
</html>
