/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author lenin
 */
@Entity
@Table(name = "favoritos")
@NamedQueries({
    @NamedQuery(name = "Favoritos.findAll", query = "SELECT f FROM Favoritos f"),
    @NamedQuery(name = "Favoritos.findByIdUsuario", query = "SELECT f FROM Favoritos f WHERE f.idUsuario = :idUsuario"),
    @NamedQuery(name = "Favoritos.findByIdFavorito", query = "SELECT f FROM Favoritos f WHERE f.idFavorito = :idFavorito"),
  @NamedQuery(name = "Favoritos.findFavoritosWithRecipeDetails",
            query = "SELECT f.idFavorito, r.nombreReceta, r.tipoCocina, r.ingredientes, r.tiempoPreparacion, f.fechaFavorito " +
                    "FROM Favoritos f " +
                    "JOIN f.idReceta r " +
                    "JOIN f.idUsuario u " +
                    "WHERE u.idUsuario = :idUsuario")

,

  
   @NamedQuery(name = "Favoritos.findFavoritosWithRecipeDetail",
            query = "SELECT f.idFavorito, r.idReceta, r.tipoCocina, r.ingredientes, r.tiempoPreparacion, f.fechaFavorito " +
                    "FROM Favoritos f " +
                    "JOIN f.idReceta r " +
                    "JOIN f.idUsuario u " +
                    "WHERE u.idUsuario = :idUsuario")

,

   @NamedQuery(name = "Favoritos.findTopFavoritos",
            query = "SELECT  r.nombreReceta, COUNT(f) AS cantidadFavoritos " +
                    "FROM Favoritos f " +
                    "JOIN f.idReceta r " +
                    "JOIN f.idUsuario u " +
                    "GROUP BY r.idReceta " +
                    "ORDER BY cantidadFavoritos DESC")
,
   @NamedQuery(name = "Favoritos.findTopFavoritosPorFecha",
            query = "SELECT r.nombreReceta, COUNT(f) AS cantidadFavoritos, " +
                    "    FUNCTION('DATE', f.fechaFavorito) AS fechaFavorito " +
                    "FROM Favoritos f " +
                    "JOIN f.idReceta r " +
                    "JOIN f.idUsuario u " +
                    "WHERE r.nombreReceta = :nombreReceta " +
                    "GROUP BY r.idReceta, FUNCTION('DATE', f.fechaFavorito) " +
                    "ORDER BY fechaFavorito DESC, cantidadFavoritos DESC")
,

    @NamedQuery(name = "Favoritos.findByFechaFavorito", query = "SELECT f FROM Favoritos f WHERE f.fechaFavorito = :fechaFavorito")})
public class Favoritos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_favorito")
    private Integer idFavorito;
    @Column(name = "fecha_favorito")
    @Temporal(TemporalType.DATE)
    private Date fechaFavorito;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuarios idUsuario;
    @JoinColumn(name = "id_receta", referencedColumnName = "id_receta")
    @ManyToOne
    private Recetas idReceta;

    public Favoritos() {
    }

    public Favoritos(Integer idFavorito) {
        this.idFavorito = idFavorito;
    }

    public Integer getIdFavorito() {
        return idFavorito;
    }

    public void setIdFavorito(Integer idFavorito) {
        this.idFavorito = idFavorito;
    }

    public Date getFechaFavorito() {
        return fechaFavorito;
    }

    public void setFechaFavorito(Date fechaFavorito) {
        this.fechaFavorito = fechaFavorito;
    }

    public Usuarios getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuarios idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Recetas getIdReceta() {
        return idReceta;
    }

    public void setIdReceta(Recetas idReceta) {
        this.idReceta = idReceta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFavorito != null ? idFavorito.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Favoritos)) {
            return false;
        }
        Favoritos other = (Favoritos) object;
        if ((this.idFavorito == null && other.idFavorito != null) || (this.idFavorito != null && !this.idFavorito.equals(other.idFavorito))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelos.Favoritos[ idFavorito=" + idFavorito + " ]";
    }
    
}
