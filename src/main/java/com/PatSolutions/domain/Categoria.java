package com.PatSolutions.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;
import lombok.Data;

@Data
@Entity
@Table(name = "categoria")
public class Categoria implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categoria")
    private Long idCategoria;
    private String descripcion;
    private String rutaImagen;
    private boolean activo;

    //Para hacer una "asociaciòn" de uno a muchos, usando id_categoria como llave
    @OneToMany
    @JoinColumn(name = "id_categoria")
    List<Producto> productos;

    @Override
    public String toString() {
        return "Categoria{"
                + "idCategoria=" + idCategoria
                + ", descripcion='" + descripcion + '\''
                + ", rutaImagen='" + rutaImagen + '\''
                + ", activo=" + activo
                + '}';
    }

}
