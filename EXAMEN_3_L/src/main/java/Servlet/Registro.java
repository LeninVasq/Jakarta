/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controladores.UsuariosJpaController;
import Modelos.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenin
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Registro at " + request.getContextPath() + "</h1>");
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
        
        dispatcher = request.getRequestDispatcher("Usuario/Registro.jsp");
        dispatcher.forward(request, response);
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
        RequestDispatcher dispatcher = null;
        
        Usuarios usuario = new Usuarios();
        UsuariosJpaController controllerusuario = new UsuariosJpaController();
        
        
        try {
            
            String accion = request.getParameter("accion");
            if ("registro".equals(accion)) {
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                String contra = request.getParameter("password");
                
                usuario.setNombre(nombre);
                usuario.setEmail(correo);
                usuario.setContra(contra);
                usuario.setAdmin(1);
                usuario.setFechaRegistro(new Date());
                
                
                 List<Usuarios> respuesta = controllerusuario.email(correo);
                
                if (respuesta.isEmpty()) {
                    controllerusuario.create(usuario);
                    String mensaje = "Registrado Exitomente";
                    request.setAttribute("mensaje", mensaje); 
                    dispatcher = request.getRequestDispatcher("Usuario/Registro.jsp");
                    dispatcher.forward(request, response);

                }
                else {
                    String error = "El correo ya esta registrado";
                    request.setAttribute("error", error); 
                    dispatcher = request.getRequestDispatcher("Usuario/Registro.jsp");
                    dispatcher.forward(request, response);

                }
                
                
                
            }
            
            dispatcher = request.getRequestDispatcher("Usuario/Registro.jsp");
            dispatcher.forward(request, response);
                
        } catch (Exception e) {
            dispatcher = request.getRequestDispatcher("Usuario/Registro.jsp");
        dispatcher.forward(request, response);
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
