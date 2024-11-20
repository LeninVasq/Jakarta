/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controladores.RecetasJpaController;
import Modelos.Recetas;
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
@WebServlet(name = "receta", urlPatterns = {"/receta"})
public class receta extends HttpServlet {

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
            out.println("<title>Servlet receta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receta at " + request.getContextPath() + "</h1>");
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

       
                 RecetasJpaController recetaController = new RecetasJpaController();
        
        List<Recetas> listaRecetas = recetaController.findRecetasEntities();
        
        request.setAttribute("listaRecetas", listaRecetas);
                request.setAttribute("contenido", "agregar.jsp");
                dispatcher = request.getRequestDispatcher("Usuario/Admin/Index.jsp");
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

         Recetas recetas = new Recetas();
            RecetasJpaController controllereceta = new RecetasJpaController();
                try {
                    String accion = request.getParameter("accion");
                    if ("add".equals(accion)) {
                        String nombre = request.getParameter("Nombre");
                        String tipo = request.getParameter("tipo"); 
                        String ingredientes = request.getParameter("ingredientes"); 
                        String tiempo = request.getParameter("tiempoPreparacion");
                        int tiempoPreparacion = Integer.parseInt(tiempo);

                    
                        List<Recetas> recetasEncontradas = controllereceta.findRecetasByNombreReceta(nombre);

                        if (recetasEncontradas.isEmpty()) {
                            recetas.setNombreReceta(nombre);
                            recetas.setTipoCocina(tipo);
                            recetas.setIngredientes(ingredientes);
                            recetas.setTiempoPreparacion(tiempoPreparacion);
                            controllereceta.create(recetas);
                            request.setAttribute("mensaje", "Receta agregada exitosamente.");
                        } else {
                            request.setAttribute("mensaje", "La receta ya existe.");
                        }
                        RecetasJpaController recetaController = new RecetasJpaController();
        
                        List<Recetas> listaRecetas = recetaController.findRecetasEntities();
        
                        request.setAttribute("listaRecetas", listaRecetas);
                        request.setAttribute("contenido", "agregar.jsp");
                        dispatcher = request.getRequestDispatcher("Usuario/Admin/Index.jsp");
                        dispatcher.forward(request, response);
                    }
                    else if ("delete".equals(accion)) {
                        String id = request.getParameter("id");
                        int ids = Integer.parseInt(id);
                       
                        controllereceta.destroy(ids);
                        RecetasJpaController recetaController = new RecetasJpaController();
                        List<Recetas> listaRecetas = recetaController.findRecetasEntities();
                        request.setAttribute("listaRecetas", listaRecetas);
                        request.setAttribute("contenido", "agregar.jsp");
                        dispatcher = request.getRequestDispatcher("Usuario/Admin/Index.jsp");
                        dispatcher.forward(request, response);
                    }else {
                        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
                        String tipo = request.getParameter("tipoCocina"); 
                        String ingredientes = request.getParameter("ingredientes"); 
                        String tiempo = request.getParameter("tiempoPreparacion");
                        int tiempoPreparacion = Integer.parseInt(tiempo);
                        int ids = Integer.parseInt(id);

        recetas.setNombreReceta(nombre);
        recetas.setTipoCocina(tipo);
        recetas.setIngredientes(ingredientes);
        recetas.setTiempoPreparacion(tiempoPreparacion);
        recetas.setIdReceta(ids);
        controllereceta.actu(recetas);
        RecetasJpaController recetaController = new RecetasJpaController();
        
        // Llamar al método findRecetasEntities
        List<Recetas> listaRecetas = recetaController.findRecetasEntities();
        
        request.setAttribute("listaRecetas", listaRecetas);
        request.setAttribute("contenido", "agregar.jsp");
          dispatcher = request.getRequestDispatcher("Usuario/Admin/Index.jsp");
                        dispatcher.forward(request, response);
                        
                        
                    }
                } catch (Exception e) {
                     dispatcher = request.getRequestDispatcher("Usuario/index.html");
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
