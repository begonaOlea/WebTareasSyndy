<%-- 
    Document   : registroTarea
    Created on : 22-dic-2020, 10:20:11
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/vista/bootstrap.jspf"%>
        <title>Nueva Tarea</title>
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
            <form action="nueva-tarea" method="post">
                <div class="form-group">
                    <label for="tarea">Tarea</label>
                    <input type="text" class="form-control" name="tarea" placeholder="nombre de la tarea">
                </div>
                <div class="form-group">
                    <label for="estado">Estado</label>
                    <select class="form-control" name="estado">
                        <option>Hacer</option>
                        <option>En Progreso</option>
                        <option>Hecho</option>
                        
                    </select>
                </div>
                <button type="submit">Ingresar</button>
                
            </form>
        </div>
    </body>
</html>
