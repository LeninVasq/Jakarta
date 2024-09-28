/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelosDAO;

import db.CN;
import modelos.Persona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Vasques
 */
public class PersonaDAO {
    
    private CN cn;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public PersonaDAO() throws ClassNotFoundException{
        cn= new CN(); 
    }
    
    public List listar(){
        ArrayList<Persona> lista = new ArrayList<>();
        
        String sql = "select * from persona";
        try{
            con= cn.getCon();
           ps= con.prepareStatement(sql);
           rs= ps.executeQuery();
           while(rs.next()){
               Persona persona = new Persona();
               persona.setId(rs.getInt("id"));
               persona.setDui(rs.getString("dui"));
               persona.setApellido(rs.getString("apellido"));
               persona.setNombre(rs.getString("nombre"));
               lista.add(persona);
           }
        }catch (Exception e){
         }
        
        return lista;
    }
    
    //buscar  por id
    public Persona ListarById(int id){
        Persona persona = new Persona();
        
        
        String sql = "select * from persona where id=?";
        try{
            con= cn.getCon();
           ps= con.prepareStatement(sql);
           ps.setInt(1, id);
           rs= ps.executeQuery();
           if(rs.next()){
               
               persona.setId(rs.getInt("id"));
               persona.setDui(rs.getString("dui"));
               persona.setApellido(rs.getString("apellido"));
               persona.setNombre(rs.getString("nombre"));
               
           }
           
        }catch (Exception e){
         }
        
        return persona;
    }
    
    //agregar una nueva persona
    public boolean agregar(Persona persona){
        String sql = "insert into persona(dui, apellido, nombre) values(?, ?, ?)";
            try{
                con=cn.getCon();
                con.prepareStatement(sql);
                ps = con.prepareStatement(sql);
                ps.setString(1, persona.getDui());
                ps.setString(2, persona.getApellido());
                ps.setString(3, persona.getNombre());
                int filaAfectadas= ps.executeUpdate();
                return filaAfectadas >0;
            }
            catch (Exception e){
                return false;

            }finally{
            
        }
    }
    
    //actualizar la informacion de una persona
    public boolean actualiar(Persona persona){
        String sql= "update persona set dui =?, apellido =?, nombre=? where id=?";
        try{
            con=cn.getCon();
            ps= con.prepareStatement(sql);
            ps.setString(1, persona.getDui());
            ps.setString(2, persona.getApellido());
            ps.setString(3, persona.getNombre());
            ps.setInt(4, persona.getId());
            int FilasAfectadas = ps.executeUpdate();
            return FilasAfectadas >0;
            
        }catch(Exception e){
            return false;
        }
        
    }
    
    //eliminar persona
    
    public boolean eliminar(int id){
        String sql= "delete from persona where id=?";
        try{
            con= cn.getCon();
            ps= con.prepareStatement(sql);
           ps.setInt(1, id);
           int filasafectadasc = ps.executeUpdate();
           return filasafectadasc >0;
           
           
        }catch (Exception e){
            return false;
        }
    }
    
}
