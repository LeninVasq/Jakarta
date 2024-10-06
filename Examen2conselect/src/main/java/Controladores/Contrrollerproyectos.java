/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.empleados;
import modelos.proyectos;
import modelosDAO.empleadosDao;
import modelosDAO.proyectosDao;


/**
 *
 * @author Vasques
 */
@WebServlet(name = "Contrrollerproyectos", urlPatterns = {"/Contrrollerproyectos"})
public class Contrrollerproyectos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Contrrollerproyectos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Contrrollerproyectos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         RequestDispatcher dispatcher = null;
    
         
    try {

        proyectosDao proyectosdao = new proyectosDao();
        empleadosDao personadao = new empleadosDao();
       
            
        
        // Mostrar la consulta
       
        List<empleados> consulta = personadao.listar();
        request.setAttribute("consulta", consulta);
         List<Map<String, Object>> consultapro = proyectosdao.listar2();
        request.setAttribute("consultapro", consultapro);
     
        dispatcher = request.getRequestDispatcher("proyectos.jsp");
        dispatcher.forward(request, response);
        
    } catch (ClassNotFoundException e) {
       
    }
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String action = request.getParameter("action");
        RequestDispatcher dispatcher = null;
    
            
             // Esto convierte directamente a java.sql.Date

        try {
            empleadosDao personadao = new empleadosDao();
            proyectosDao proyectosdao = new proyectosDao();
            if ("agregar".equals(action)) {
                proyectos persona = new proyectos();

                int empleado_id = Integer.parseInt(request.getParameter("nombre"));
            
            
           
            String fechaString = request.getParameter("fecha");

            
            Date fecha = Date.valueOf(fechaString); 
                

                
                persona.setEmpleado_id(empleado_id);
                persona.setFecha_inicio(fecha);
                proyectosdao.agregar(persona); 

                
            }
            
            
            List<empleados> consulta = personadao.listar();
        request.setAttribute("consulta", consulta);
         List<Map<String, Object>> consultapro = proyectosdao.listar2();
        request.setAttribute("consultapro", consultapro);
     
        dispatcher = request.getRequestDispatcher("proyectos.jsp");
        dispatcher.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Contrrollerproyectos.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
