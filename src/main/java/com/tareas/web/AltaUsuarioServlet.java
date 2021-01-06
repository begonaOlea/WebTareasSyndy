/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.ExcepcionDBUsuarios;
import com.tareas.excepciones.LoginException;
import com.tareas.modelo.Usuario;
import com.tareas.servicios.DBUsuario;
import com.tareas.servicios.LoginService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class AltaUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String nombre = req.getParameter("nombre");
        String email = req.getParameter("email");
        String psw = req.getParameter("psw");
        
        String mnsnombre = null;
        String mnsEmail = null;
        String mnspsw = null; 
        String mnsError = null; 
        boolean valido = true; 
        
        int ultimoUsuario = 0; 
        
        if (nombre == null || nombre.trim().length() ==0){
            mnsnombre = "Debes introducir un nombre"; 
            valido = false; 
        }
        if (email == null || email.trim().length() ==0){
            mnsEmail = "Debes introducir un email"; 
            valido = false; 
        }
        if (psw == null || psw.trim().length() ==0){
            mnspsw = "Debes introducir una contraseña"; 
            valido = false; 
        }
        
        if (valido){
            try {
                ultimoUsuario = DBUsuario.getUltimoUsuario();
                Usuario nuevo = new Usuario(++ultimoUsuario, nombre, email, psw);
                DBUsuario.addUsuario(nuevo);
            } catch (ExcepcionDBUsuarios e) {
                mnsError = "El email introducido esta en uso ";
                valido = false; 
            }
        }
        
        if (valido){
            try {
                //pedir la sesion al request
                HttpSession sesion = req.getSession();
                //crear login service y enviar datos al login service 
                LoginService logServ = new LoginService();
                logServ.login(email, psw, sesion);
               
            }catch(LoginException e){
                mnsError = e.getMessage();
                valido = false; 
            }
        }
        
        if (valido){
        resp.sendRedirect("tareas.jsp");
            
        }else {
            req.setAttribute("mnsName", mnsnombre );
            req.setAttribute("mnsEmail", mnsEmail );
            req.setAttribute("mnsPas", mnspsw);
            req.setAttribute("mnsFinal",mnsError );
            
            RequestDispatcher rq = req.getRequestDispatcher("registroUsuario.jsp");
            rq.forward(req, resp);
        }
    }

    
}
