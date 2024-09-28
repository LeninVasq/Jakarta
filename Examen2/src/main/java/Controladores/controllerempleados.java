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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.empleados;
import modelosDAO.empleadosDao;

/**
 *
 * @author Vasques
 */
@WebServlet(name = "controllerempleados", urlPatterns = {"/controllerempleados"})
public class controllerempleados extends HttpServlet {

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
            out.println("<title>Servlet controllerempleados</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controllerempleados at " + request.getContextPath() + "</h1>");
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
        empleadosDao personadao = new empleadosDao();
        
       
            
        
        // Mostrar la consulta
        List<empleados> consulta = personadao.listar();
        request.setAttribute("consulta", consulta);
        dispatcher = request.getRequestDispatcher("empleados.jsp");
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
            empleadosDao empleadodao = new empleadosDao();
            if ("agregar".equals(action)) {
                empleados persona = new empleados();

                String nombre = request.getParameter("nombre");
            String puesto = request.getParameter("puesto");
            
           
            String fechaString = request.getParameter("fecha");

            
            Date fecha = Date.valueOf(fechaString); 
                

                persona.setNombre_empleado(nombre);
                persona.setPuesto(puesto);
                persona.setFecha(fecha);
                empleadodao.agregar(persona); 

                
            }
            else if("eliminar".equals(action)){
                
                int id = Integer.parseInt(request.getParameter("id"));
                 empleadodao.eliminar(id);
                
            }
               else if("actualizar".equals(action)){
                 int id = Integer.parseInt(request.getParameter("id"));
                 

                // Establecer el id como atributo de la solicitud
                request.setAttribute("id", id);
                empleados empleados = empleadodao.ListarById(id);
                request.setAttribute("persona", empleados);
            dispatcher = request.getRequestDispatcher("actualizaremple.jsp");
            dispatcher.forward(request, response);


            }
            else if("actualizar2".equals(action)){
                empleados persona = new empleados();
                int id = Integer.parseInt(request.getParameter("id"));
          

                String nombre = request.getParameter("nombre");
            String puesto = request.getParameter("puesto");
            
            // Obtener la fecha en formato String desde el formulario
            String fechaString = request.getParameter("fecha");

            // Convertir la fecha a java.sql.Date usando valueOf, que espera el formato 'yyyy-MM-dd'
            Date fecha = Date.valueOf(fechaString); 
                

                persona.setNombre_empleado(nombre);
                persona.setPuesto(puesto);
                persona.setFecha(fecha);
                persona.setId(id);
            empleadodao.actualiar(persona); 
           

        }
            
            
            
            //actualizo la lista 
            List<empleados> consulta = empleadodao.listar();
                request.setAttribute("consulta", consulta);
                
                 dispatcher = request.getRequestDispatcher("empleados.jsp");
        dispatcher.forward(request, response);
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(controllerempleados.class.getName()).log(Level.SEVERE, null, ex);
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
