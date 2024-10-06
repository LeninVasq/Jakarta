/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelosDAO;

import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import modelos.proyectos;

/**
 *
 * @author Vasques
 */
public class proyectosDao {
    
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public proyectosDao() throws ClassNotFoundException {
        CN = new cn();
    }
    
    public boolean agregar(proyectos pro){
        String sql = "INSERT INTO proyectos (fecha_inicio, empleado_id) values(?, ?)";
            try{
                con=CN.getCon();
                con.prepareStatement(sql);
                ps = con.prepareStatement(sql);
                ps.setDate(1, pro.getFecha_inicio());
                ps.setInt(2, pro.getEmpleado_id());
             
                int filaAfectadas= ps.executeUpdate();
                return filaAfectadas >0;
            }
            catch (Exception e){
                return false;

            }finally{
            
        }
    }
    
    
    public List<Map<String, Object>> listar2(int id) {
    List<Map<String, Object>> lista = new ArrayList<>();

    // Consulta SQL corregida para incluir 'empleado_id' y tabla correctamente referenciada
    String sql = "SELECT id_proyecto, fecha_inicio,empleado_id,nombre_empleado FROM proyectos p JOIN empleadps e ON p.empleado_id = e.id WHERE id= ?";

    try {
         con= CN.getCon();
           ps= con.prepareStatement(sql);
           ps.setInt(1, id);
           rs= ps.executeQuery();
        while (rs.next()) {
            // Crear una instancia de 'proyectos'
            proyectos proye = new proyectos();
            proye.setId(rs.getInt("id_proyecto"));
            proye.setFecha_inicio(rs.getDate("fecha_inicio"));
            proye.setEmpleado_id(rs.getInt("empleado_id")); // Asegúrate de que 'empleado_id' está en el SELECT

            // Crear un mapa y almacenar el objeto 'proyectos' y el nombre del empleado
            Map<String, Object> proyectoConNombre = new HashMap<>();
            proyectoConNombre.put("proyecto", proye);
            proyectoConNombre.put("nombreEmpleado", rs.getString("nombre_empleado"));

            lista.add(proyectoConNombre);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return lista;
}



    
}
