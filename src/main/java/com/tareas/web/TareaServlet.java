/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.modelo.Tarea;
import com.tareas.modelo.Usuario;
import com.tareas.servicios.DBTareas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "TareaServlet", urlPatterns = {"/tarea-Servlet"})
public class TareaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession sesion = req.getSession();
        Usuario usMostrar = (Usuario) sesion.getAttribute("usuario");
        int id = usMostrar.getIdUsuario();
        Collection<Tarea> colectionTareasHacer = DBTareas.listaTareas(id, "Hacer");
        Collection<Tarea> colectionTareasHecho = DBTareas.listaTareas(id, "Hecho");
        Collection<Tarea> colectionTareasProgreso = DBTareas.listaTareas(id, "En Progreso");
        req.setAttribute("colectionTareasHacer", colectionTareasHacer); 
        req.setAttribute("colectionTareasHecho", colectionTareasHecho); 
        req.setAttribute("colectionTareasProgreso", colectionTareasProgreso); 
        RequestDispatcher rq = req.getRequestDispatcher("tareas.jsp");
        rq.forward(req, resp);

    }//fin metodo get
}//fin clase 
