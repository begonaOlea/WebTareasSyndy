/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.servicios;

import com.tareas.excepciones.ExcepcionDBTareas;
import com.tareas.modelo.Tarea;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author user
 */
public class DBTareas {
    
    public static int ultimaTarea= 0;
    public static Set<Tarea> tareas;
    public static Set<Tarea> tareasUsuario;
    
    static {
        tareas = new HashSet<Tarea>();
        tareas.add(new Tarea ( 1, ultimaTarea++, "Model", "Crear tareas y usuarios", "Hecho"));
        tareas.add(new Tarea ( 2, ultimaTarea++, "DB", "Crear DB tareas y DB usuarios", "Hecho"));
        tareas.add(new Tarea ( 1, ultimaTarea++, "Excepciones", "Definir excepciones", "Hecho"));
        tareas.add(new Tarea ( 2, ultimaTarea++, "Servlet tareas", "Generar servlet tareas", "En Progreso"));
        tareas.add(new Tarea ( 2, ultimaTarea++, "Servicios login", "Crear login y logout", "En Progreso"));
        tareas.add(new Tarea ( 1, ultimaTarea++, "Calculadora", "Hacer MVC", "Hacer"));
        tareas.add(new Tarea ( 3, ultimaTarea++, "Calculadora2", "Almacenar operaciones", "Hacer"));
        tareas.add(new Tarea ( 3, ultimaTarea++, "Juego3D", "Sonido juego", "Hacer"));
        tareas.add(new Tarea ( 1, ultimaTarea++, "Juego3D_2", "Motor físicas", "Hacer"));
        
    }

    public DBTareas() {
    }
    
    public static void addTarea(Tarea nuevaTarea) throws ExcepcionDBTareas{
        boolean anadir = tareas.add(nuevaTarea);
        if(!anadir){
            throw new ExcepcionDBTareas ("No ha sido agregada la tarea, revisa que no estes repitiendo su nombre");
        }
    }
    
    public static synchronized  Collection<Tarea> listaTareas(int idUsuario){
       
        tareasUsuario = new HashSet<Tarea>();
        for (Tarea tareaID : tareas){
            int usID = tareaID.getUsuarioid();
            if (usID == idUsuario){
                tareasUsuario.add(tareaID);
            }
        }
        
        return tareasUsuario;
    }
    
}
