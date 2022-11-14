package uca.ungallocontenis.kenkougymapi.controller.KenkouUser;

import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.Progreso;
import uca.ungallocontenis.kenkougymapi.service.KenkouUser.KenkouUserService;
import uca.ungallocontenis.kenkougymapi.utils.KenkouUtils;

@RestController
@RequestMapping("/usuario")
public class KenkouUserController {

    @Autowired
    private KenkouUserService service;

    @GetMapping("/obtenerUsuario")
    public String obtenerUsuario(@RequestParam String username) {
        return service.obtenerUsuario(username); 
    }

    @GetMapping("/obtenerObjetivoActual")
    public String obtenerObjetivoActual(@RequestParam String username) {
        return service.obtenerObjetivoActual(username);
    }
    
    @PostMapping(path = "/insertarProgreso", consumes = {MediaType.APPLICATION_JSON_VALUE})
    public String insertarProgreso(@RequestBody Progreso progreso) {
        return service.insertarProgreso(progreso);
    }
    
    @GetMapping("/obtenerProgreso")
    public String obtenerProgreso(@RequestParam String username, @RequestParam(required = false) String fechaInicial, @RequestParam String fechaActual) {
        return service.obtenerProgreso(username, fechaInicial, fechaActual);
    }
    
    /* PLANES ALIMENTICIOS */

    @PostMapping(path = "/insertarPlanAlimenticioActivo", consumes = {MediaType.APPLICATION_JSON_VALUE})
    public String insertarPlanAlimenticioActivo(@RequestBody Map<String, Object> payload) {
        return service.insertarPlanAlimenticioActivo(KenkouUtils.toString(payload.get("username")), KenkouUtils.toInteger(payload.get("planId")));
    }

    @GetMapping("/obtenerPlanAlimenticioActivo")
    public String obtenerPlanAlimenticioActivo(@RequestParam String username) {
        return service.obtenerPlanAlimenticioActivo(username);
    }
}