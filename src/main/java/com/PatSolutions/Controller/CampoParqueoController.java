
package com.PatSolutions.Controller;

import com.PatSolutions.service.CampoParqueoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CampoParqueoController {

    @Autowired
    private CampoParqueoService campoParqueoService;

    @GetMapping("/parqueo/campos-disponibles")
    public String verCamposDisponibles(Model model) {
        model.addAttribute("camposDisponibles", campoParqueoService.listarCamposDisponibles());
        return "camposDisponibles";
    }
}