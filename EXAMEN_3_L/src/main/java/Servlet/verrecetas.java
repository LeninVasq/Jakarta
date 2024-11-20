/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controladores.FavoritosJpaController;
import Controladores.RecetasJpaController;
import Controladores.UsuariosJpaController;
import Modelos.Favoritos;
import Modelos.Recetas;
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
@WebServlet(name = "verrecetas", urlPatterns = {"/verrecetas"})
public class verrecetas extends HttpServlet {

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
            out.println("<title>Servlet verrecetas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet verrecetas at " + request.getContextPath() + "</h1>");
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
       RecetasJpaController recetaController = new RecetasJpaController();
        
        // Llamar al método findRecetasEntities
        List<Recetas> listaRecetas = recetaController.findRecetasEntities();
        
        // Poner la lista de recetas en el request para que se pueda acceder en el JSP
        request.setAttribute("listaRecetas", listaRecetas);
         RequestDispatcher dispatcher = request.getRequestDispatcher("Usuario/Comun/ver.jsp");
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
        request.setCharacterEncoding("UTF-8");  // Asegúrate de que la solicitud esté en UTF-8
    response.setContentType("text/html; charset=UTF-8");

    String action = request.getParameter("actu");
    RequestDispatcher dispatcher = null;

        FavoritosJpaController controller = new FavoritosJpaController();
    try {
        UsuariosJpaController controllerusuario = new UsuariosJpaController();
        int id_usu = 0;
        Favoritos fa = new Favoritos();

        Usuarios usuarios = new Usuarios();
        Recetas recetas = new Recetas();

        if ("favo".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                String idUsuario = (String) session.getAttribute("correo");
                int id = 0;
                if (idUsuario != null) {

                    List<Usuarios> respuesta = controllerusuario.email(idUsuario);
                    for (Usuarios usuario : respuesta) {
    // Suponiendo que 'getId()' es el método para obtener el id del usuario
     id = usuario.getIdUsuario();
     id_usu = id;
}
                    usuarios.setIdUsuario(id);
                    fa.setIdUsuario(usuarios);
                    
                } else {
                    response.getWriter().println("ID de usuario no encontrado en la sesión.");
                    return; // Salir si no hay ID de usuario
                }
            } else {
                response.getWriter().println("Sesión no iniciada.");
                return; // Salir si no hay sesión
            }

            String id = request.getParameter("idReceta");
            if (id == null) {
                response.getWriter().println("ID de receta no encontrado.");
                return; // Salir si no hay ID de receta
            }
            int ids = Integer.parseInt(id);
            recetas.setIdReceta(ids);
            fa.setIdReceta(recetas);

            java.util.Date fechaActual = new java.util.Date(); // Fecha actual del sistema
            fa.setFechaFavorito(fechaActual);
            RecetasJpaController recetaController = new RecetasJpaController();

            List<Recetas> listaRecetas = recetaController.findRecetasEntities();

            
            
        List<Object[]> favoritosList = controller.findFavoritosWithRecipeDetails(id_usu); // Asumiendo que ids es el idUsuario
boolean encontrada = false;

for (Object[] favoritoData : favoritosList) {
   Integer idFavorito = (Integer) favoritoData[0]; // El idFavorito está en la primera posición
    Integer nombreReceta = (Integer) favoritoData[1]; // El nombreReceta está en la segunda posición
 
    
    // Suponiendo que quieres encontrar el favorito con un idReceta específico
    if (nombreReceta == ids) { // Compara el idReceta que quieres con el idFavorito
        encontrada = true;
        break;
    }
}



            
            
            
            if (encontrada) {
                request.setAttribute("error", "La receta ya esta en favoritos");

            } else {
                controller.create(fa);
            }
            
            
            request.setAttribute("listaRecetas", listaRecetas);
            dispatcher = request.getRequestDispatcher("Usuario/Comun/ver.jsp");
            dispatcher.forward(request, response);
        }
        else if ("buscar".equals(action)){
            String nombre = request.getParameter("buscarnom");
            RecetasJpaController recetasRepository = new RecetasJpaController();
try {
    List<Recetas> recetasEncontradas = recetasRepository.findRecetasByNombreReceta(nombre);
    for (Recetas receta : recetasEncontradas) {
        
        request.setAttribute("listaRecetas", recetasEncontradas);
          dispatcher = request.getRequestDispatcher("Usuario/Comun/ver.jsp");
            dispatcher.forward(request, response);
    }
} catch (Exception e) {
    System.err.println("Error: " + e.getMessage());
}

        }

    } catch (Exception ex) {
        // Manejo de excepciones
        ex.printStackTrace(response.getWriter()); // Imprimir el stack trace en el navegador
        dispatcher = request.getRequestDispatcher("index.html"); // Redirigir a la página de inicio en caso de error
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
