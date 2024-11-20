/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controladores;

import Controladores.exceptions.NonexistentEntityException;
import Modelos.Favoritos;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Modelos.Usuarios;
import Modelos.Recetas;
import java.util.ArrayList;
import java.util.List;
import static java.util.random.RandomGeneratorFactory.all;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author lenin
 */
public class FavoritosJpaController implements Serializable {
    
    public FavoritosJpaController() {
        this.emf = Persistence.createEntityManagerFactory("PU");
    }

    public FavoritosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    
    
    public void deleteFavoritosByUserId(Integer idUsuario) {
    EntityManager em = getEntityManager();
    try {
        em.getTransaction().begin();
        Query query = em.createQuery("DELETE FROM Favoritos f WHERE f.idUsuario.idUsuario = :idUsuario");
        query.setParameter("idUsuario", idUsuario);
        query.executeUpdate();
        em.getTransaction().commit();
    } catch (Exception e) {
        if (em.getTransaction().isActive()) {
            em.getTransaction().rollback();
        }
        e.printStackTrace();
    } finally {
        em.close();
    }
}
    
    public List<Object[]> findTopFavoritosPorFecha(String nombreReceta) {
    EntityManager em = getEntityManager();
    try {
        // Ejecutar la consulta con el parámetro nombreReceta
        return em.createNamedQuery("Favoritos.findTopFavoritosPorFecha")
                 .setParameter("nombreReceta", nombreReceta)
                 .getResultList();
    } finally {
        em.close();
    }
}


    
    public List<Object[]> findFavoritosWithRecipeDetails(Integer idUsuario) {
    EntityManager em = getEntityManager();
    try {
        return em.createNamedQuery("Favoritos.findFavoritosWithRecipeDetail")
                 .setParameter("idUsuario", idUsuario)
                 .getResultList();
    } finally {
        em.close();
    }
}

    public List<Object[]> findTopFavoritos() {
    EntityManager em = getEntityManager();
    try {
        return em.createNamedQuery("Favoritos.findTopFavoritos")
                 .getResultList();
    } finally {
        em.close();
    }
}

  
    
    
    

    
        public List<Object[]> findFavoritosWithRecipeDetailsByUsuario(int idUsuario) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("Favoritos.findFavoritosWithRecipeDetails");
            q.setParameter("idUsuario", idUsuario);
            return q.getResultList();
        } finally {
            em.close();
        }
    }






    public void create(Favoritos favoritos) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuarios idUsuario = favoritos.getIdUsuario();
            if (idUsuario != null) {
                idUsuario = em.getReference(idUsuario.getClass(), idUsuario.getIdUsuario());
                favoritos.setIdUsuario(idUsuario);
            }
            Recetas idReceta = favoritos.getIdReceta();
            if (idReceta != null) {
                idReceta = em.getReference(idReceta.getClass(), idReceta.getIdReceta());
                favoritos.setIdReceta(idReceta);
            }
            em.persist(favoritos);
            if (idUsuario != null) {
                idUsuario.getFavoritosCollection().add(favoritos);
                idUsuario = em.merge(idUsuario);
            }
            if (idReceta != null) {
                idReceta.getFavoritosCollection().add(favoritos);
                idReceta = em.merge(idReceta);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Favoritos favoritos) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Favoritos persistentFavoritos = em.find(Favoritos.class, favoritos.getIdFavorito());
            Usuarios idUsuarioOld = persistentFavoritos.getIdUsuario();
            Usuarios idUsuarioNew = favoritos.getIdUsuario();
            Recetas idRecetaOld = persistentFavoritos.getIdReceta();
            Recetas idRecetaNew = favoritos.getIdReceta();
            if (idUsuarioNew != null) {
                idUsuarioNew = em.getReference(idUsuarioNew.getClass(), idUsuarioNew.getIdUsuario());
                favoritos.setIdUsuario(idUsuarioNew);
            }
            if (idRecetaNew != null) {
                idRecetaNew = em.getReference(idRecetaNew.getClass(), idRecetaNew.getIdReceta());
                favoritos.setIdReceta(idRecetaNew);
            }
            favoritos = em.merge(favoritos);
            if (idUsuarioOld != null && !idUsuarioOld.equals(idUsuarioNew)) {
                idUsuarioOld.getFavoritosCollection().remove(favoritos);
                idUsuarioOld = em.merge(idUsuarioOld);
            }
            if (idUsuarioNew != null && !idUsuarioNew.equals(idUsuarioOld)) {
                idUsuarioNew.getFavoritosCollection().add(favoritos);
                idUsuarioNew = em.merge(idUsuarioNew);
            }
            if (idRecetaOld != null && !idRecetaOld.equals(idRecetaNew)) {
                idRecetaOld.getFavoritosCollection().remove(favoritos);
                idRecetaOld = em.merge(idRecetaOld);
            }
            if (idRecetaNew != null && !idRecetaNew.equals(idRecetaOld)) {
                idRecetaNew.getFavoritosCollection().add(favoritos);
                idRecetaNew = em.merge(idRecetaNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = favoritos.getIdFavorito();
                if (findFavoritos(id) == null) {
                    throw new NonexistentEntityException("The favoritos with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Favoritos favoritos;
            try {
                favoritos = em.getReference(Favoritos.class, id);
                favoritos.getIdFavorito();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The favoritos with id " + id + " no longer exists.", enfe);
            }
            Usuarios idUsuario = favoritos.getIdUsuario();
            if (idUsuario != null) {
                idUsuario.getFavoritosCollection().remove(favoritos);
                idUsuario = em.merge(idUsuario);
            }
            Recetas idReceta = favoritos.getIdReceta();
            if (idReceta != null) {
                idReceta.getFavoritosCollection().remove(favoritos);
                idReceta = em.merge(idReceta);
            }
            em.remove(favoritos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Favoritos> findFavoritosEntities() {
        return findFavoritosEntities(true, -1, -1);
    }

    public List<Favoritos> findFavoritosEntities(int maxResults, int firstResult) {
        return findFavoritosEntities(false, maxResults, firstResult);
    }

    private List<Favoritos> findFavoritosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Favoritos.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Favoritos findFavoritos(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Favoritos.class, id);
        } finally {
            em.close();
        }
    }

    public int getFavoritosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Favoritos> rt = cq.from(Favoritos.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
