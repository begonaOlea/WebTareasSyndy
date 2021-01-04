/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.ExcepcionDBTareas;
import com.tareas.servicios.DBTareas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "CambiarEstadoServlet", urlPatterns = {"/cambiar-estado"})
public class CambiarEstadoServlet extends HttpServlet {

    //1. Leer param id  
        //2. Validar 
        //    2.1 . No es valido ir a la pagian lista-libros.jps pasando el 
        //          mensaje de error
        //    2.2  Es valido.  Alquilar  -- MODEL
        //          y Despachar la peticion al JSP  lista-libros.jps
    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String idPar = req.getParameter("id");
        int id= 0;
        String mns = null; 
        
        if (idPar == null || idPar.trim().length() == 0){
            mns = "No existe este id para esta tarea";
        }else {
            try {
                id = Integer.parseInt(idPar);
            } catch (NumberFormatException ex) {
                mns = "No es un tipo válido";
            }
        }
        
        if (mns == null){
            try {
                DBTareas.cambiarEstadoUp(id);
                mns= "Tarea actualizada";
            } catch (ExcepcionDBTareas ex) {
                mns= "No se actualizo la tarea";
            }
        }
        
        //despachar al JSP
        RequestDispatcher rd = req.getRequestDispatcher("tareas.jsp");
                
        req.setAttribute("mensaje", mns);        
        rd.forward(req, resp);
    }//fin metodo get

    
}//fin de clase 
