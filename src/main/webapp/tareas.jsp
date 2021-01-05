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
        <%@include file="WEB-INF/vista/bootstrap.jspf"%>
        <title>Mis Tareas</title>
    </head>
    <body>

        <%@include file="WEB-INF/vista/menu.jspf" %>
        <c:if test="${not empty requestScope.mensaje}" >
                        <div class="alert alert-success" role="alert">
                           ${requestScope.mensaje}
                        </div>
                    </c:if>
        <br />
        <div class="container">
            <div class="row">
                <div class="col-sm font-weight-bold text-center">HACER
                    <c:forEach var="tarea" items="${ requestScope.colectionTareasHacer }">
                        <ul class="list-group">
                            <li class="list-group-item " >
                                <a href="cambio-down?id=${tarea.id}"> 
                                    <button type="button" class="btn btn-info font-weight-bold float-left">⇐</button>
                                </a>
                                ${ tarea.tarea}
                                <a href="cambiar-estado?id=${tarea.id}"> 
                                    <button type="button" class="btn btn-info font-weight-bold float-right">⇒</button>
                                </a>
                            </li>
                        </ul>
                    </c:forEach>            
                </div>
                
                <div class="col-sm font-weight-bold text-center">EN PROGRESO
                    <c:forEach var="tarea" items="${ requestScope.colectionTareasProgreso }">
                        <ul class="list-group">
                            <li class="list-group-item ">
                                <a href="cambio-down?id=${tarea.id}"> 
                                    <button type="button" class="btn btn-info font-weight-bold float-left">⇐</button>
                                </a>
                                ${ tarea.tarea}
                                <a href="cambiar-estado?id=${tarea.id}"> 
                                    <button type="button" class="btn btn-info font-weight-bold float-right">⇒</button>
                                </a>
                            </li>
                        </ul>
                    </c:forEach>            
                </div>
                
                <div class="col-sm font-weight-bold text-center" >HECHO
                    <c:forEach var="tarea" items="${ requestScope.colectionTareasHecho }">
                        <ul class="list-group">
                            <li class="list-group-item ">
                                <a href="cambio-down?id=${tarea.id}"> 
                                    <button type="button" class="btn btn-info font-weight-bold float-left">⇐</button>
                                </a>
                                ${ tarea.tarea}
                                <a href="cambiar-estado?id=${tarea.id}"> 
                                    <button type="button" class="btn btn-info font-weight-bold float-right">⇒</button>
                                </a>
                            </li>
                        </ul>
                    </c:forEach>            
                </div>
                
            </div>
            <br />
            <div class="d-flex justify-content-center">
                <a href="registroTarea.jsp">
                <img src="img/tarea.png" alt="logo" style="width:50px"/>NUEVA
                </a>
            </div>
            
        </div>
    </body>
</html>
