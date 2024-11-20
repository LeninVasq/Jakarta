/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controladores;

import Controladores.exceptions.NonexistentEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Modelos.Favoritos;
import Modelos.Recetas;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author lenin
 */
public class RecetasJpaController implements Serializable {

    public RecetasJpaController() {
        this.emf = Persistence.createEntityManagerFactory("PU");

    }
    

    public RecetasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    
    public List<Recetas> findRecetasNombre() {
    EntityManager em = getEntityManager();
    try {
        Query query = em.createNamedQuery("Recetas.nombre");
        return query.getResultList();
    } finally {
        em.close();
    }
}


    
    public List<Object[]> findTopRecetas() {
    EntityManager em = getEntityManager();
    try {
        return em.createNamedQuery("Recetas.findTopRecetas")
                 .getResultList();
    } finally {
        em.close();
    }
}
    
    
    
    public void actu(Recetas receta) throws NonexistentEntityException, Exception {
    EntityManager em = null;
    try {
        em = getEntityManager();
        em.getTransaction().begin();

        Recetas persistentReceta = em.find(Recetas.class, receta.getIdReceta());
        if (persistentReceta == null) {
            throw new NonexistentEntityException("The receta with id " + receta.getIdReceta() + " no longer exists.");
        }

        persistentReceta.setNombreReceta(receta.getNombreReceta());
        persistentReceta.setTipoCocina(receta.getTipoCocina());
        persistentReceta.setIngredientes(receta.getIngredientes());
        persistentReceta.setTiempoPreparacion(receta.getTiempoPreparacion());

        em.merge(persistentReceta);
        
        em.getTransaction().commit();
    } catch (Exception ex) {
        throw ex; // Manejo de 
    } finally {
        if (em != null) {
            em.close(); 
        }
    }
}
    
    public List<Recetas> findRecetasByNombreReceta(String nombreReceta) throws Exception {
    EntityManager em = null;
    List<Recetas> recetas = new ArrayList<>();
    
    try {
        em = getEntityManager();
        em.getTransaction().begin();

        TypedQuery<Recetas> query = em.createNamedQuery("Recetas.findByNombreReceta", Recetas.class);
        query.setParameter("nombreReceta", nombreReceta);
        recetas = query.getResultList();

        em.getTransaction().commit();
    } catch (Exception ex) {
        if (em != null && em.getTransaction().isActive()) {
            em.getTransaction().rollback(); // Revertir la transacción en caso de error
        }
        throw new Exception("Error al buscar recetas por nombre: " + ex.getMessage(), ex);
    } finally {
        if (em != null) {
            em.close(); 
        }
    }
    
    return recetas;
}

    public void create(Recetas recetas) {
        if (recetas.getFavoritosCollection() == null) {
            recetas.setFavoritosCollection(new ArrayList<Favoritos>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Collection<Favoritos> attachedFavoritosCollection = new ArrayList<Favoritos>();
            for (Favoritos favoritosCollectionFavoritosToAttach : recetas.getFavoritosCollection()) {
                favoritosCollectionFavoritosToAttach = em.getReference(favoritosCollectionFavoritosToAttach.getClass(), favoritosCollectionFavoritosToAttach.getIdFavorito());
                attachedFavoritosCollection.add(favoritosCollectionFavoritosToAttach);
            }
            recetas.setFavoritosCollection(attachedFavoritosCollection);
            em.persist(recetas);
            for (Favoritos favoritosCollectionFavoritos : recetas.getFavoritosCollection()) {
                Recetas oldIdRecetaOfFavoritosCollectionFavoritos = favoritosCollectionFavoritos.getIdReceta();
                favoritosCollectionFavoritos.setIdReceta(recetas);
                favoritosCollectionFavoritos = em.merge(favoritosCollectionFavoritos);
                if (oldIdRecetaOfFavoritosCollectionFavoritos != null) {
                    oldIdRecetaOfFavoritosCollectionFavoritos.getFavoritosCollection().remove(favoritosCollectionFavoritos);
                    oldIdRecetaOfFavoritosCollectionFavoritos = em.merge(oldIdRecetaOfFavoritosCollectionFavoritos);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Recetas recetas) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Recetas persistentRecetas = em.find(Recetas.class, recetas.getIdReceta());
            Collection<Favoritos> favoritosCollectionOld = persistentRecetas.getFavoritosCollection();
            Collection<Favoritos> favoritosCollectionNew = recetas.getFavoritosCollection();
            Collection<Favoritos> attachedFavoritosCollectionNew = new ArrayList<Favoritos>();
            for (Favoritos favoritosCollectionNewFavoritosToAttach : favoritosCollectionNew) {
                favoritosCollectionNewFavoritosToAttach = em.getReference(favoritosCollectionNewFavoritosToAttach.getClass(), favoritosCollectionNewFavoritosToAttach.getIdFavorito());
                attachedFavoritosCollectionNew.add(favoritosCollectionNewFavoritosToAttach);
            }
            favoritosCollectionNew = attachedFavoritosCollectionNew;
            recetas.setFavoritosCollection(favoritosCollectionNew);
            recetas = em.merge(recetas);
            for (Favoritos favoritosCollectionOldFavoritos : favoritosCollectionOld) {
                if (!favoritosCollectionNew.contains(favoritosCollectionOldFavoritos)) {
                    favoritosCollectionOldFavoritos.setIdReceta(null);
                    favoritosCollectionOldFavoritos = em.merge(favoritosCollectionOldFavoritos);
                }
            }
            for (Favoritos favoritosCollectionNewFavoritos : favoritosCollectionNew) {
                if (!favoritosCollectionOld.contains(favoritosCollectionNewFavoritos)) {
                    Recetas oldIdRecetaOfFavoritosCollectionNewFavoritos = favoritosCollectionNewFavoritos.getIdReceta();
                    favoritosCollectionNewFavoritos.setIdReceta(recetas);
                    favoritosCollectionNewFavoritos = em.merge(favoritosCollectionNewFavoritos);
                    if (oldIdRecetaOfFavoritosCollectionNewFavoritos != null && !oldIdRecetaOfFavoritosCollectionNewFavoritos.equals(recetas)) {
                        oldIdRecetaOfFavoritosCollectionNewFavoritos.getFavoritosCollection().remove(favoritosCollectionNewFavoritos);
                        oldIdRecetaOfFavoritosCollectionNewFavoritos = em.merge(oldIdRecetaOfFavoritosCollectionNewFavoritos);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = recetas.getIdReceta();
                if (findRecetas(id) == null) {
                    throw new NonexistentEntityException("The recetas with id " + id + " no longer exists.");
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
            Recetas recetas;
            try {
                recetas = em.getReference(Recetas.class, id);
                recetas.getIdReceta();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The recetas with id " + id + " no longer exists.", enfe);
            }
            Collection<Favoritos> favoritosCollection = recetas.getFavoritosCollection();
            for (Favoritos favoritosCollectionFavoritos : favoritosCollection) {
                favoritosCollectionFavoritos.setIdReceta(null);
                favoritosCollectionFavoritos = em.merge(favoritosCollectionFavoritos);
            }
            em.remove(recetas);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Recetas> findRecetasEntities() {
        return findRecetasEntities(true, -1, -1);
    }

    public List<Recetas> findRecetasEntities(int maxResults, int firstResult) {
        return findRecetasEntities(false, maxResults, firstResult);
    }

    private List<Recetas> findRecetasEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Recetas.class));
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

    public Recetas findRecetas(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Recetas.class, id);
        } finally {
            em.close();
        }
    }

    public int getRecetasCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Recetas> rt = cq.from(Recetas.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
