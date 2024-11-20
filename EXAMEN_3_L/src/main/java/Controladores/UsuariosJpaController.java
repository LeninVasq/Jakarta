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
import Modelos.Usuarios;
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
public class UsuariosJpaController implements Serializable {

    public UsuariosJpaController() {
        this.emf = Persistence.createEntityManagerFactory("PU");
    }

    public UsuariosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    
    public List<Object[]> findLogin(Usuarios usuario) {
    EntityManager em = getEntityManager();
    try {
        TypedQuery<Object[]> query = em.createNamedQuery("Usuarios.findLogin", Object[].class);
        query.setParameter("email", usuario.getEmail());
        query.setParameter("contra", usuario.getContra());
        return query.getResultList();
    } finally {
        em.close();
    }
}
    
    
    
    public List<Usuarios> email(String correo) {
    EntityManager em = null;
    List<Usuarios> result = new ArrayList<>();
    try {
        em = emf.createEntityManager();
        
        TypedQuery<Usuarios> query = em.createNamedQuery("Usuarios.findByEmail", Usuarios.class);
        query.setParameter("email", correo);
        result = query.getResultList();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
    return result;
}




    public void create(Usuarios usuarios) {
        if (usuarios.getFavoritosCollection() == null) {
            usuarios.setFavoritosCollection(new ArrayList<Favoritos>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Collection<Favoritos> attachedFavoritosCollection = new ArrayList<Favoritos>();
            for (Favoritos favoritosCollectionFavoritosToAttach : usuarios.getFavoritosCollection()) {
                favoritosCollectionFavoritosToAttach = em.getReference(favoritosCollectionFavoritosToAttach.getClass(), favoritosCollectionFavoritosToAttach.getIdFavorito());
                attachedFavoritosCollection.add(favoritosCollectionFavoritosToAttach);
            }
            usuarios.setFavoritosCollection(attachedFavoritosCollection);
            em.persist(usuarios);
            for (Favoritos favoritosCollectionFavoritos : usuarios.getFavoritosCollection()) {
                Usuarios oldIdUsuarioOfFavoritosCollectionFavoritos = favoritosCollectionFavoritos.getIdUsuario();
                favoritosCollectionFavoritos.setIdUsuario(usuarios);
                favoritosCollectionFavoritos = em.merge(favoritosCollectionFavoritos);
                if (oldIdUsuarioOfFavoritosCollectionFavoritos != null) {
                    oldIdUsuarioOfFavoritosCollectionFavoritos.getFavoritosCollection().remove(favoritosCollectionFavoritos);
                    oldIdUsuarioOfFavoritosCollectionFavoritos = em.merge(oldIdUsuarioOfFavoritosCollectionFavoritos);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Usuarios usuarios) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuarios persistentUsuarios = em.find(Usuarios.class, usuarios.getIdUsuario());
            Collection<Favoritos> favoritosCollectionOld = persistentUsuarios.getFavoritosCollection();
            Collection<Favoritos> favoritosCollectionNew = usuarios.getFavoritosCollection();
            Collection<Favoritos> attachedFavoritosCollectionNew = new ArrayList<Favoritos>();
            for (Favoritos favoritosCollectionNewFavoritosToAttach : favoritosCollectionNew) {
                favoritosCollectionNewFavoritosToAttach = em.getReference(favoritosCollectionNewFavoritosToAttach.getClass(), favoritosCollectionNewFavoritosToAttach.getIdFavorito());
                attachedFavoritosCollectionNew.add(favoritosCollectionNewFavoritosToAttach);
            }
            favoritosCollectionNew = attachedFavoritosCollectionNew;
            usuarios.setFavoritosCollection(favoritosCollectionNew);
            usuarios = em.merge(usuarios);
            for (Favoritos favoritosCollectionOldFavoritos : favoritosCollectionOld) {
                if (!favoritosCollectionNew.contains(favoritosCollectionOldFavoritos)) {
                    favoritosCollectionOldFavoritos.setIdUsuario(null);
                    favoritosCollectionOldFavoritos = em.merge(favoritosCollectionOldFavoritos);
                }
            }
            for (Favoritos favoritosCollectionNewFavoritos : favoritosCollectionNew) {
                if (!favoritosCollectionOld.contains(favoritosCollectionNewFavoritos)) {
                    Usuarios oldIdUsuarioOfFavoritosCollectionNewFavoritos = favoritosCollectionNewFavoritos.getIdUsuario();
                    favoritosCollectionNewFavoritos.setIdUsuario(usuarios);
                    favoritosCollectionNewFavoritos = em.merge(favoritosCollectionNewFavoritos);
                    if (oldIdUsuarioOfFavoritosCollectionNewFavoritos != null && !oldIdUsuarioOfFavoritosCollectionNewFavoritos.equals(usuarios)) {
                        oldIdUsuarioOfFavoritosCollectionNewFavoritos.getFavoritosCollection().remove(favoritosCollectionNewFavoritos);
                        oldIdUsuarioOfFavoritosCollectionNewFavoritos = em.merge(oldIdUsuarioOfFavoritosCollectionNewFavoritos);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = usuarios.getIdUsuario();
                if (findUsuarios(id) == null) {
                    throw new NonexistentEntityException("The usuarios with id " + id + " no longer exists.");
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
            Usuarios usuarios;
            try {
                usuarios = em.getReference(Usuarios.class, id);
                usuarios.getIdUsuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuarios with id " + id + " no longer exists.", enfe);
            }
            Collection<Favoritos> favoritosCollection = usuarios.getFavoritosCollection();
            for (Favoritos favoritosCollectionFavoritos : favoritosCollection) {
                favoritosCollectionFavoritos.setIdUsuario(null);
                favoritosCollectionFavoritos = em.merge(favoritosCollectionFavoritos);
            }
            em.remove(usuarios);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Usuarios> findUsuariosEntities() {
        return findUsuariosEntities(true, -1, -1);
    }

    public List<Usuarios> findUsuariosEntities(int maxResults, int firstResult) {
        return findUsuariosEntities(false, maxResults, firstResult);
    }

    private List<Usuarios> findUsuariosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Usuarios.class));
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

    public Usuarios findUsuarios(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Usuarios.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsuariosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Usuarios> rt = cq.from(Usuarios.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
