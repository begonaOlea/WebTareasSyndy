/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tareas.servicios;

import com.tareas.excepciones.ExcepcionDBTareas;
import com.tareas.modelo.Tarea;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author user
 */
public class DBTareas {
    
    public static int ultimaTarea= 0;
    public static Set<Tarea> tareas;
    
    static {
        tareas = new HashSet<Tarea>();
        tareas.add(new Tarea ( ultimaTarea++, "calculadora", "Hacer MVC", "Hacer"));
        tareas.add(new Tarea ( ultimaTarea++, "calculadora2", "Almacenar operaciones", "Hacer"));
        tareas.add(new Tarea ( ultimaTarea++, "juego3D", "Sonido juego", "Hacer"));
        tareas.add(new Tarea ( ultimaTarea++, "juego3D_2", "Motor físicas", "Hacer"));
        
    }

    public DBTareas() {
    }
    
    public static void addTarea(Tarea nuevaTarea) throws ExcepcionDBTareas{
        boolean anadir = tareas.add(nuevaTarea);
        if(!anadir){
            throw new ExcepcionDBTareas ("No ha sido agregada la tarea, revisa que no estes repitiendo su nombre");
        }
    }
    
    
    
}
