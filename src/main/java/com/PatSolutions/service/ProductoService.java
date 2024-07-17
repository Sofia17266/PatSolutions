/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.PatSolutions.service;

import com.PatSolutions.domain.Producto;
import java.util.List;

/**
 *
 * @author joser
 */
public interface ProductoService {
    
    public List<Producto> getProductos(boolean activo);
    
    public Producto getProducto(Producto producto);
    
    public void save(Producto producto);
    
    public void delete(Producto producto);
    
    public List<Producto> consultaJPA(double precioInf, double precioSup);
    
    // Se define una consulta ampliada JPQL para obtener la la lista de productos 
    //Que se encuentran en un rango de precios
    
    public List<Producto> consultaJPQL(double precioInf, double precioSup);
    
    // Se define una consulta ampliada SQL navita  para obtener la la lista de productos 
    //Que se encuentran en un rango de precios
   
    public List<Producto> consultaSQL(double precioInf, double precioSup);
    
}
