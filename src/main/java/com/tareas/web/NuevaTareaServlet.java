/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.ExcepcionDBTareas;
import com.tareas.modelo.Tarea;
import com.tareas.modelo.Usuario;
import com.tareas.servicios.DBTareas;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author joha
 */
@WebServlet(name = "NuevaTareaServlet", urlPatterns = {"/nueva-tarea"})
public class NuevaTareaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //recibir datos
        String nombrePar = req.getParameter("tarea");
        String estado = req.getParameter("estado");
        
        //recibir datos de usuario desde la sesion
        HttpSession sesion = req.getSession();
        Usuario usMostrar = (Usuario) sesion.getAttribute("usuario");
        int id = usMostrar.getIdUsuario();
        
        //recibir datos de la tarea 
        int ultimoId = DBTareas.getUltimaTarea();
        
        //crear datos 
        String mns = null; 
        
        
        //validar datos 
        if (nombrePar == null || nombrePar.trim().length() == 0){
            mns = "Debes introducir un nombre de tarea";
        }
        if (estado == null || estado.trim().length() == 0){
            mns = "Debes introducir un estado";
        }
        
              
        if (mns == null){
            try {
                Tarea miTarea = new Tarea (id, ++ultimoId, nombrePar, "descripcion", estado);
                DBTareas.addTarea(miTarea);
            } catch (ExcepcionDBTareas e) {
                mns = e.getMessage();
            }
            resp.sendRedirect("tarea-Servlet");
        }else {
            //despachar al JSP
            RequestDispatcher rd = req.getRequestDispatcher("tareas.jsp");
            req.setAttribute("mensaje", mns);        
            rd.forward(req, resp);
        }
    }


}
