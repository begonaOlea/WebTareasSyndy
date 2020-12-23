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
        
      
        
        <%
            Usuario usMostrar = (Usuario) session.getAttribute("usuario");
            int id = usMostrar.getIdUsuario(); 
            Collection<Tarea> colectionTareas = DBTareas.listaTareas(id);
            
        %>
        
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>TAREA</th>
                    <th>DESCRIPCION</th>
                    <th>ESTADO</th>
                </tr>
            </thead>

            <%
                for (Tarea tarea0 : colectionTareas) {
            %>    
            <tbody>
                <tr>
                    <td><%= tarea0.getTarea()%></td>
                    <td><%= tarea0.getDefinicion() %></td>
                    <td><%= tarea0.getEstado() %></td>

                    
                </tr>
            </tbody>

            <% }%>
        </table>

        
        
        
    </body>
</html>
