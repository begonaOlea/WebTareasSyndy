/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.web;

import com.tareas.excepciones.LoginException;
import com.tareas.servicios.LoginService;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login-user"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        //recibir parametros 
        String name  = req.getParameter("uname");
        String pswParam = req.getParameter("psw");
        
        //crear parametros a usar 
        String mnsName = null;
        String mnsPas = null;
        String mnsFinal= null;
        String jspAMostrar = null;   //A donde se dirige después de generar la información
        boolean valido = true; 
        
        //validar
        if (name == null || name.trim().length() < 0){
            mnsName = "debes introducir un email valido";
            valido = false; 
        }
        if (pswParam == null || name.trim().length() < 0){
            mnsPas = "debes introducir una contraseña";
            valido = false; 
        }
        
        //si tienen datos comprobar con el login service si la contraseña y el email existen 
        if (valido){
            try {
                //pedir la sesion al request
                HttpSession sesion = req.getSession();
                //crear login service y enviar datos al login service 
                LoginService logServ = new LoginService();
                logServ.login(name, pswParam, sesion);
               
            }catch(LoginException e){
                mnsFinal = e.getMessage();
                valido = false; 
            }
        }
        
        
        if (valido){
            jspAMostrar = "tareas.jsp";
            
        }else {
            req.setAttribute("mnsName", mnsName);
            req.setAttribute("mnsPas", mnsPas);
            req.setAttribute("mnsFinal", mnsFinal);
            jspAMostrar = "index.jsp";
        }
        
        RequestDispatcher rq = req.getRequestDispatcher(jspAMostrar);
        rq.forward(req, resp);
    }

   

    
    
    
}//fin clase 
