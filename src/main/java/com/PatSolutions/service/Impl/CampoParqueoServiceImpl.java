
package com.PatSolutions.service.Impl;


import com.PatSolutions.dao.CampoParqueoRepository;
import com.PatSolutions.domain.CampoParqueo;
import com.PatSolutions.service.CampoParqueoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CampoParqueoServiceImpl implements CampoParqueoService {

    @Autowired
    private CampoParqueoRepository campoParqueoRepository;

    @Override
    public List<CampoParqueo> listarCamposDisponibles() {
        // Filtra solo los campos disponibles
        return campoParqueoRepository.findAll().stream()
                .filter(CampoParqueo::isDisponible)
                .toList();
    }
}
