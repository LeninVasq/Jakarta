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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Persona;
import modelosDAO.PersonaDAO;

/**
 *
 * @author Vasques
 */
@WebServlet(name = "ControllerPersona", urlPatterns = {"/ControllerPersona"})
public class ControllerPersona extends HttpServlet {

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
            out.println("<title>Servlet ControllerPersona</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet  at " + request.getContextPath() + "</h1>");
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
        PersonaDAO personadao = new PersonaDAO();
        
       
            
        
        // Mostrar la consulta
        List<Persona> consulta = personadao.listar();
        request.setAttribute("consulta", consulta);
        dispatcher = request.getRequestDispatcher("consulta2.jsp");
        dispatcher.forward(request, response);
        
    } catch (ClassNotFoundException e) {
        e.printStackTrace(); // Maneja la excepción adecuadamente, quizás redirigiendo a un error
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
    try {
        PersonaDAO personadao = new PersonaDAO();
        if ("agregar".equals(action)) {
            Persona persona = new Persona();
            String dui = request.getParameter("dui");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            persona.setDui(dui);
            persona.setApellido(apellido);
            persona.setNombre(nombre);
            personadao.agregar(persona); // Guarda el resultado de la operación
             
           
        }
        else if("eliminar".equals(action)){
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            personadao.eliminar(id);
            
            dispatcher = request.getRequestDispatcher("edit_persona.jsp");
        dispatcher.forward(request, response);
           

           
        }
            else if("actualizar".equals(action)){
                 int id = Integer.parseInt(request.getParameter("id"));
                 

                // Establecer el id como atributo de la solicitud
                request.setAttribute("id", id);
                Persona persona = personadao.ListarById(id);
                request.setAttribute("persona", persona);
            dispatcher = request.getRequestDispatcher("edit_persona.jsp");
            dispatcher.forward(request, response);


            }
            else if("actualizar2".equals(action)){
                Persona persona = new Persona();
                int id = Integer.parseInt(request.getParameter("id"));
                String dui = request.getParameter("dui");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");            
            persona.setDui(dui);
            persona.setApellido(apellido);
            persona.setNombre(nombre);
            persona.setId(id);
            personadao.actualiar(persona); 
           

        }
        List<Persona> consulta = personadao.listar();
        request.setAttribute("consulta", consulta);
         dispatcher = request.getRequestDispatcher("consulta2.jsp");
        dispatcher.forward(request, response);
        
    } catch (ClassNotFoundException ex) {
        
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
