/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author lenin
 */
@Entity
@Table(name = "recetas")
@NamedQueries({
    @NamedQuery(name = "Recetas.findAll", query = "SELECT r FROM Recetas r"),
@NamedQuery(name = "Recetas.nombre", query = "SELECT r FROM Recetas r"),
@NamedQuery(name = "Recetas.findTopRecetas",
    query = "SELECT r.tipoCocina, COUNT(f) AS cantidadFavoritos " +
            "FROM Favoritos f " +
            "JOIN f.idReceta r " +  // Usando la relación entre Favoritos y Recetas
            "GROUP BY r.tipoCocina " +
            "ORDER BY cantidadFavoritos DESC")
,

    @NamedQuery(name = "Recetas.findByIdReceta", query = "SELECT r FROM Recetas r WHERE r.idReceta = :idReceta"),
    @NamedQuery(name = "Recetas.findByNombreReceta", query = "SELECT r FROM Recetas r WHERE r.nombreReceta = :nombreReceta"),
    @NamedQuery(name = "Recetas.findByTipoCocina", query = "SELECT r FROM Recetas r WHERE r.tipoCocina = :tipoCocina"),
    @NamedQuery(name = "Recetas.findByTiempoPreparacion", query = "SELECT r FROM Recetas r WHERE r.tiempoPreparacion = :tiempoPreparacion")})
public class Recetas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_receta")
    private Integer idReceta;
    @Column(name = "nombre_receta")
    private String nombreReceta;
    @Column(name = "tipo_cocina")
    private String tipoCocina;
    @Lob
    @Column(name = "ingredientes")
    private String ingredientes;
    @Column(name = "tiempo_preparacion")
    private Integer tiempoPreparacion;
    @OneToMany(mappedBy = "idReceta")
    private Collection<Favoritos> favoritosCollection;

    public Recetas() {
    }

    public Recetas(Integer idReceta) {
        this.idReceta = idReceta;
    }

    public Integer getIdReceta() {
        return idReceta;
    }

    public void setIdReceta(Integer idReceta) {
        this.idReceta = idReceta;
    }

    public String getNombreReceta() {
        return nombreReceta;
    }

    public void setNombreReceta(String nombreReceta) {
        this.nombreReceta = nombreReceta;
    }

    public String getTipoCocina() {
        return tipoCocina;
    }

    public void setTipoCocina(String tipoCocina) {
        this.tipoCocina = tipoCocina;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public Integer getTiempoPreparacion() {
        return tiempoPreparacion;
    }

    public void setTiempoPreparacion(Integer tiempoPreparacion) {
        this.tiempoPreparacion = tiempoPreparacion;
    }

    public Collection<Favoritos> getFavoritosCollection() {
        return favoritosCollection;
    }

    public void setFavoritosCollection(Collection<Favoritos> favoritosCollection) {
        this.favoritosCollection = favoritosCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idReceta != null ? idReceta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Recetas)) {
            return false;
        }
        Recetas other = (Recetas) object;
        if ((this.idReceta == null && other.idReceta != null) || (this.idReceta != null && !this.idReceta.equals(other.idReceta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelos.Recetas[ idReceta=" + idReceta + " ]";
    }
    
}
