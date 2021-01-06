<%-- 
    Document   : usuarios
    Created on : Jan 5, 2021, 9:02:59 AM
    Author     : joha
--%>

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
        <h4> REGISTRAR </h4>
        <div class="card" style="width:400px">
    <img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">John Doe</h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
      <a href="#" class="btn btn-primary stretched-link">See Profile</a>
    </div>
  </div>
        
        
        </div>
    </body>
</html>
