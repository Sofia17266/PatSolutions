
package com.PatSolutions.dao;

import com.PatSolutions.domain.CampoParqueo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CampoParqueoRepository extends JpaRepository<CampoParqueo, Long> {
    // Puedes agregar métodos personalizados si es necesario
}