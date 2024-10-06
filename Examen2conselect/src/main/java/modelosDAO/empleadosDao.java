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
import java.util.List;
import modelos.empleados;

/**
 *
 * @author Vasques
 */
public class empleadosDao {
    
    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public empleadosDao() throws ClassNotFoundException {
        CN = new cn();
    }
    
    public List listar(){
        ArrayList<empleados> lista = new ArrayList<>();
        
        String sql = "select * from Empleadps";
        try{
            con= CN.getCon();
           ps= con.prepareStatement(sql);
           rs= ps.executeQuery();
           while(rs.next()){
               empleados emple = new empleados();
               emple.setId(rs.getInt("id"));
               emple.setNombre_empleado(rs.getString("nombre_empleado"));
               emple.setPuesto(rs.getString("puesto"));
               emple.setFecha(rs.getDate("fecha_contratacion"));
               lista.add(emple);
           }
        }catch (Exception e){
         }
        
        return lista;
    }
 
    //buscar  por id
    public empleados ListarById(int id){
        empleados emple = new empleados();
        
        
        String sql = "select * from Empleadps where id=?";
        try{
            con= CN.getCon();
           ps= con.prepareStatement(sql);
           ps.setInt(1, id);
           rs= ps.executeQuery();
           if(rs.next()){
               
               emple.setId(rs.getInt("id"));
               emple.setNombre_empleado(rs.getString("nombre_empleado"));
               emple.setPuesto(rs.getString("puesto"));
               emple.setFecha(rs.getDate("fecha_contratacion"));
               
           }
           
        }catch (Exception e){
         }
        
        return emple;
    }
    
    //agregar una nueva persona
    public boolean agregar(empleados emple){
        String sql = "insert into Empleadps(nombre_empleado, puesto, fecha_contratacion) values(?, ?, ?)";
            try{
                con=CN.getCon();
                con.prepareStatement(sql);
                ps = con.prepareStatement(sql);
                ps.setString(1, emple.getNombre_empleado());
                ps.setString(2, emple.getPuesto());
                ps.setDate(3, emple.getFecha());
                int filaAfectadas= ps.executeUpdate();
                return filaAfectadas >0;
            }
            catch (Exception e){
                return false;

            }finally{
            
        }
    }
    
    //actualizar la informacion de una persona
    public boolean actualiar(empleados persona){
        String sql= "update Empleadps set nombre_empleado =?, puesto =?, fecha_contratacion=? where id=?";
        try{
            con=CN.getCon();
            ps= con.prepareStatement(sql);
            ps.setString(1, persona.getNombre_empleado());
            ps.setString(2, persona.getPuesto());
            ps.setDate(3, persona.getFecha());
            ps.setInt(4, persona.getId());
            int FilasAfectadas = ps.executeUpdate();
            return FilasAfectadas >0;
            
        }catch(Exception e){
            return false;
        }
        
    }
    
    //eliminar persona
    
    public boolean eliminar(int id){
        String sql= "delete from Empleadps where id=?";
        try{
            con= CN.getCon();
            ps= con.prepareStatement(sql);
           ps.setInt(1, id);
           int filasafectadasc = ps.executeUpdate();
           return filasafectadasc >0;
           
           
        }catch (Exception e){
            return false;
        }
    }
    
    
}
