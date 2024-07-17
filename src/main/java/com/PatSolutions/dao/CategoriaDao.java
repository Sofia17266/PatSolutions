package com.PatSolutions.dao;



import com.PatSolutions.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoriaDao 
        extends JpaRepository <Categoria, Long>{
    
}
