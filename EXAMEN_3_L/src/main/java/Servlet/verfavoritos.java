/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controladores.FavoritosJpaController;
import Controladores.UsuariosJpaController;
import Modelos.Favoritos;
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
@WebServlet(name = "verfavoritos", urlPatterns = {"/verfavoritos"})
public class verfavoritos extends HttpServlet {

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
            out.println("<title>Servlet verfavoritos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet verfavoritos at " + request.getContextPath() + "</h1>");
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
FavoritosJpaController recetaController = new FavoritosJpaController();
        UsuariosJpaController controllerusuario = new UsuariosJpaController();
            HttpSession session = request.getSession(false);

String idUsuario = (String) session.getAttribute("correo");
                int id = 0;
                if (idUsuario != null) {

                    List<Usuarios> respuesta = controllerusuario.email(idUsuario);
                    for (Usuarios usuario : respuesta) {
    // Suponiendo que 'getId()' es el método para obtener el id del usuario
     id = usuario.getIdUsuario();
     
     String idString = String.valueOf(id);

     session.setAttribute("idusuario",idString);
                    }
    List<Object[]> favoritosList = recetaController.findFavoritosWithRecipeDetailsByUsuario(id);

   

if (favoritosList != null && !favoritosList.isEmpty()) {
    request.setAttribute("listaRecetas", favoritosList);
} else {
    request.setAttribute("mensaje", "No se encontraron favoritos para este usuario.");
}
}

// Redirigir al JSP
RequestDispatcher dispatcher = request.getRequestDispatcher("Usuario/Comun/verfacoritos.jsp");
dispatcher.forward(request, response);    }

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
        Favoritos favoritos = new Favoritos();
        FavoritosJpaController controllerfavo = new FavoritosJpaController();
                    HttpSession session = request.getSession(false);

        try {
            int id = 0;
            String accion = request.getParameter("actu");
            if("favo".equals(accion)){
                String idds = request.getParameter("idfavorito");
                int idf = Integer.parseInt(idds);
                
                controllerfavo.destroy(idf);
            

    FavoritosJpaController recetaController = new FavoritosJpaController();
        UsuariosJpaController controllerusuario = new UsuariosJpaController();

String idUsuario = (String) session.getAttribute("correo");
                
                if (idUsuario != null) {

                    List<Usuarios> respuesta = controllerusuario.email(idUsuario);
                    for (Usuarios usuario : respuesta) {
    // Suponiendo que 'getId()' es el método para obtener el id del usuario
     id = usuario.getIdUsuario();
     
     String idString = String.valueOf(id);

     session.setAttribute("idusuario",idString);
                    }
    List<Object[]> favoritosList = recetaController.findFavoritosWithRecipeDetailsByUsuario(id);

   

if (favoritosList != null && !favoritosList.isEmpty()) {
    request.setAttribute("listaRecetas", favoritosList);
} else {
    request.setAttribute("mensaje", "No se encontraron favoritos para este usuario.");
}
}

// Redirigir al JSP
RequestDispatcher dispatcher = request.getRequestDispatcher("Usuario/Comun/verfacoritos.jsp");
dispatcher.forward(request, response);   


                
            }
            else if("eliminar".equals(accion)){
                
              
                
                
                
                FavoritosJpaController recetaController = new FavoritosJpaController();
        UsuariosJpaController controllerusuario = new UsuariosJpaController();

String idUsuario = (String) session.getAttribute("correo");
                if (idUsuario != null) {

                    List<Usuarios> respuesta = controllerusuario.email(idUsuario);
                    for (Usuarios usuario : respuesta) {
    // Suponiendo que 'getId()' es el método para obtener el id del usuario
     id = usuario.getIdUsuario();
     
     controllerfavo.deleteFavoritosByUserId(id);
     String idString = String.valueOf(id);

     session.setAttribute("idusuario",idString);
                    }
    List<Object[]> favoritosList = recetaController.findFavoritosWithRecipeDetailsByUsuario(id);

   

if (favoritosList != null && !favoritosList.isEmpty()) {
    request.setAttribute("listaRecetas", favoritosList);
} else {
    request.setAttribute("mensaje", "No se encontraron favoritos para este usuario.");
}
}

// Redirigir al JSP
RequestDispatcher dispatcher = request.getRequestDispatcher("Usuario/Comun/verfacoritos.jsp");
dispatcher.forward(request, response); 
                
            }
        } catch (Exception e) {
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
