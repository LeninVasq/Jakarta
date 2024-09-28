/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import java.sql.Date;

/**
 *
 * @author Vasques
 */
public class proyectos {
    private int id ;
    private Date fecha_inicio;
    private int empleado_id;

    public proyectos() {
    }

    public proyectos(Date fecha_inicio, int empleado_id) {
        this.fecha_inicio = fecha_inicio;
        this.empleado_id = empleado_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public int getEmpleado_id() {
        return empleado_id;
    }

    public void setEmpleado_id(int empleado_id) {
        this.empleado_id = empleado_id;
    }
    
    

    
    
}
