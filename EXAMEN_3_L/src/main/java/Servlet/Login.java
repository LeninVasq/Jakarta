/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controladores.UsuariosJpaController;
import Modelos.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenin
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false);
        RequestDispatcher dispatcher = null;

        if (session != null && session.getAttribute("correo") != null) {
            String rol = (String) session.getAttribute("rol");

            if ("admin".equals(rol)) {
                request.setAttribute("contenido", "Inicio.jsp");
                dispatcher = request.getRequestDispatcher("Usuario/Admin/Index.jsp");
                dispatcher.forward(request, response);
            } else if ("comun".equals(rol)) {
                dispatcher = request.getRequestDispatcher("Usuario/Comun/Index.jsp");
                dispatcher.forward(request, response);
            }
            
        } else {
            dispatcher = request.getRequestDispatcher("Usuario/Login.jsp");
            dispatcher.forward(request, response);
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
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession(false);
        
        Usuarios usuario = new Usuarios();
        UsuariosJpaController controllerusuario = new UsuariosJpaController();
        if (session != null && session.getAttribute("correo") != null) {
            String rol = (String) session.getAttribute("rol");

            if ("admin".equals(rol)) {
                request.setAttribute("contenido", "Inicio.jsp");
                dispatcher = request.getRequestDispatcher("Usuario/Admin/Index.jsp");
                dispatcher.forward(request, response);
            } else if ("comun".equals(rol)) {
                dispatcher = request.getRequestDispatcher("Usuario/Comun/Index.jsp");
                dispatcher.forward(request, response);
            }
            
            return;

        }
        
        try {
            
            
            String accion = request.getParameter("accion");
            if ("ingresar".equals(accion)) {
                String correo = request.getParameter("correo");
                String contra = request.getParameter("password");
                
                usuario.setEmail(correo);
                usuario.setContra(contra);
                
                List<Object[]> resultados = controllerusuario.findLogin(usuario);
                if (!resultados.isEmpty()) {
                    Object[] datos = resultados.get(0);
                    int admin = (int) datos[2];
                    String correos = (String) datos[1];
                    
                    session = request.getSession();
                    session.setAttribute("correo", correos);
                    
                    if (admin == 2) {
                        session.setAttribute("rol", "admin");
                        request.setAttribute("contenido", "Inicio.jsp");
                        dispatcher = request.getRequestDispatcher("Usuario/Admin/Index.jsp");
                         dispatcher.forward(request, response);
                    } else {
                        session.setAttribute("rol", "comun");
                        dispatcher = request.getRequestDispatcher("Usuario/Comun/Index.jsp");
                        dispatcher.forward(request, response);
                    }
                    
                     
                } else {
                    String error = "La contraseña o correo incorrectos";
                    request.setAttribute("error", error); 
                    dispatcher = request.getRequestDispatcher("Usuario/Login.jsp");
                    dispatcher.forward(request, response);
                }
                
                

                
            }else{
                dispatcher = request.getRequestDispatcher("index.html");
            dispatcher.forward(request, response);
            }
            
           
        } catch (Exception e) {
            dispatcher = request.getRequestDispatcher("index.html");
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
