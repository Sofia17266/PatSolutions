package com.PatSolutions.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "producto")
public class Producto implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_producto")
    private Long idProducto;
    private String marca;
    private String modelo;
    private int año;
    private String combustible;
    private String transmision;
    private String cilindrada;
    private double precio;
    private String rutaImagen;
    private int existencias;
    private boolean activo;

    //Para hacer una "asociaciòn" de muchos a uno, usando id_categoria como llave
    @ManyToOne
    @JoinColumn(name = "id_categoria")
    Categoria categoria;

    @Override
    public String toString() {
        return "Producto{"
                + "idProducto=" + idProducto
                + ", marca='" + marca + '\''
                + ", modelo='" + modelo + '\''
                + ", año=" + año
                + ", combustible='" + combustible + '\''
                + ", transmision='" + transmision + '\''
                + ", cilindrada='" + cilindrada + '\''
                + ", precio=" + precio
                + ", rutaImagen='" + rutaImagen + '\''
                + ", existencias=" + existencias
                + ", activo=" + activo
                + '}';
    }

}
