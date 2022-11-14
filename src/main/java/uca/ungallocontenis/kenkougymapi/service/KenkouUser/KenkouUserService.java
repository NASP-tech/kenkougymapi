package uca.ungallocontenis.kenkougymapi.service.KenkouUser;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.collections4.IterableUtils;
import org.apache.commons.collections4.Predicate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.KenkouUser;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.Progreso;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioObjetivoActivo.UsuarioObjetivoActivo;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo.UsuarioPlanAlimenticioActivo;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo.UsuarioPlanAlimenticioActivoKey;
import uca.ungallocontenis.kenkougymapi.entity.Nutricion.PlanAlimenticio;
import uca.ungallocontenis.kenkougymapi.repository.KenkouUser.KenkouUserRepository;
import uca.ungallocontenis.kenkougymapi.repository.KenkouUser.ProgresoRepository;
import uca.ungallocontenis.kenkougymapi.repository.KenkouUser.UsuarioPlanAlimenticioActivoRepository;
import uca.ungallocontenis.kenkougymapi.repository.Nutricion.PlanAlimenticioRepository;
import uca.ungallocontenis.kenkougymapi.utils.KenkouUtils;

@Service
public class KenkouUserService {

    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(KenkouUserService.class);

    @Autowired
    private KenkouUserRepository repository;

    @Autowired
    private ProgresoRepository progresoRepository;

    @Autowired
    private UsuarioPlanAlimenticioActivoRepository planActivoRepository;

    @Autowired
    private PlanAlimenticioRepository planAlimenticioRepository;

    public String obtenerUsuario(String username) {
        String json = "[]";
        ObjectMapper mapper = new ObjectMapper();

        try {
            json = mapper.writeValueAsString(repository.findByUsername(username));
        } catch (JsonProcessingException e) {
            LOG.error("Error al parsear usuario", e);
        }

        return json;
    }

    public String obtenerObjetivoActual(String username) {
        String json = "[]";
        ObjectMapper mapper = new ObjectMapper();
        UsuarioObjetivoActivo objetivoActivo = IterableUtils.find(repository.getObjetivosByUsernameOrEmail(username, username), new Predicate<UsuarioObjetivoActivo>() {
            @Override
            public boolean evaluate(UsuarioObjetivoActivo object) {
                return object.isActivo();
            }
        });

        try {
            json = mapper.writeValueAsString(objetivoActivo);
        } catch (JsonProcessingException e) {
            LOG.error("Error al parsear objetivo", e);
        }

        return json;
    }

    /* PLANES ALIMENTICIOS */

    public String obtenerPlanAlimenticioActivo(String username) {
        String json = "[]";
        ObjectMapper mapper = new ObjectMapper();
        UsuarioPlanAlimenticioActivo planAlimenticioActivo = IterableUtils.find(repository.getPlanesAlimenticiosByUsernameOrEmail(username, username), new Predicate<UsuarioPlanAlimenticioActivo>() {            @Override
            public boolean evaluate(final UsuarioPlanAlimenticioActivo object) {
                return object.isActivo();
            }
        });

        try {
            json = mapper.writeValueAsString(planAlimenticioActivo);
        } catch (JsonProcessingException e) {
            LOG.error("Error al parsear objetivo", e);
        }

        return json;
    }

    public String insertarPlanAlimenticioActivo(String username, int planId) {
        String json = "[]";
        KenkouUser usuario = repository.findByUsername(username);
        ObjectMapper mapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();
        UsuarioPlanAlimenticioActivo planAlimenticioActivo = IterableUtils.find(repository.getPlanesAlimenticiosByUsernameOrEmail(username, username), new Predicate<UsuarioPlanAlimenticioActivo>() {            @Override
            public boolean evaluate(final UsuarioPlanAlimenticioActivo object) {
                return object.isActivo();
            }
        });
        UsuarioPlanAlimenticioActivo planAlimenticioInactivo = IterableUtils.find(repository.getPlanesAlimenticiosByUsernameOrEmail(username, username), new Predicate<UsuarioPlanAlimenticioActivo>() {            @Override
            public boolean evaluate(final UsuarioPlanAlimenticioActivo object) {
                return object.getPlanAlimenticio().getId() == planId;
            }
        });

        try {
            if(planAlimenticioActivo.getPlanAlimenticio().getId() == planId)
                json = mapper.writeValueAsString(usuario);
            else {
                // Removing current meal plan from Set to replace it with updated meal plan
                usuario.getPlanesAlimenticios().remove(planAlimenticioActivo);

                // Set to false because we are inserting a new active meal plan
                planAlimenticioActivo.setEstado(false);

                // Adding updated meal plan
                usuario.getPlanesAlimenticios().add(planAlimenticioActivo);

                if(planAlimenticioInactivo != null) {
                    // Removing current meal plan from Set to replace it with updated meal plan
                    usuario.getPlanesAlimenticios().remove(planAlimenticioInactivo);

                    // Set to false because we are inserting a new active meal plan
                    planAlimenticioInactivo.setEstado(true);

                    // Adding updated meal plan
                    usuario.getPlanesAlimenticios().add(planAlimenticioInactivo);
                }
                else {
                    PlanAlimenticio planAlimenticio = planAlimenticioRepository.findById(planId);
                    UsuarioPlanAlimenticioActivo nuevoPlanActivo = new UsuarioPlanAlimenticioActivo(new UsuarioPlanAlimenticioActivoKey(usuario.getUsername(), planId), usuario, planAlimenticio, true);
                    
                    planActivoRepository.saveAndFlush(nuevoPlanActivo);
                    usuario.getPlanesAlimenticios().add(nuevoPlanActivo);
                }
            
                json = mapper.writeValueAsString(repository.saveAndFlush(usuario));
            }
        } catch (JsonProcessingException e) {
            LOG.error("Error al parsear objetivo", e);
        }

        return json;
    }

    /* PROGRESO */
    
    public String insertarProgreso(Progreso progreso) {
        String json = "[]";
        double porcentajeGrasa = 0;
        String sexo = repository.getSexoByUsername(progreso.getUsername());
        double altura = repository.getMeidaAlturaByUsername(progreso.getUsername());
        ObjectMapper mapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        // U.S. Navy Method
        if(sexo.equals("M")) 
            porcentajeGrasa = (495.0 / (1.0324 - (0.19077 * Math.log10(progreso.getMedidaCuello() + progreso.getDiametroCintura())) + (0.15456 * Math.log10(altura)))) - 450.0;
        else 
            porcentajeGrasa = (495.0 / (1.29579 - (0.35004 * Math.log10(progreso.getMedidaCuello() + progreso.getDiametroCaderas() + progreso.getDiametroCintura())) + (0.22100 * Math.log10(altura)))) - 450.0;

        progreso.setPorcentajeGrasa(porcentajeGrasa);
        try {
            json = mapper.writeValueAsString(progresoRepository.saveAndFlush(progreso));
        } catch (JsonProcessingException e) {
            LOG.error("Error al parsear progreso", e);
        }
        
        return json;
    }
    
    /* dd/MM/yyyy */
    public String obtenerProgreso(String username, String fechaInicial, String fechaActual) {
        String json = "[]";
        List<LinkedHashMap<String, Object>> historial = new ArrayList<>();
        LocalDate fechaFinal = LocalDate.parse(fechaActual, KenkouUtils.dd_MM_yyyy);
        ObjectMapper mapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();
        UsuarioObjetivoActivo objetivoActivo = IterableUtils.find(repository.getObjetivosByUsernameOrEmail(username, username), new Predicate<UsuarioObjetivoActivo>() {
            @Override
            public boolean evaluate(UsuarioObjetivoActivo object) {
                return object.isActivo();
            }
        });
        
        historial = progreso(fechaInicial == null ? fechaFinal.minusMonths(1L) : LocalDate.parse(fechaInicial, KenkouUtils.dd_MM_yyyy), fechaFinal, objetivoActivo.getObjetivo().getId());

        try {
            json = mapper.writeValueAsString(historial);
        } catch (JsonProcessingException e) {
            LOG.error("Error al parsear progreso", e);
        }
        
        LOG.info(json);
        return json;
    }

    private List<LinkedHashMap<String, Object>> progreso(LocalDate fechaInicial, LocalDate fechaActual, int objetivoId) {
        List<LinkedHashMap<String, Object>> historial = new ArrayList<>();
        List<Progreso> progresos = progresoRepository.findByFechaIsBetweenOrderByFechaAsc(fechaInicial, fechaActual);
        int tamano = progresos.size();

        for(int i = 0; i < tamano; i++) {
            Progreso progreso = progresos.get(i);
            LinkedHashMap<String, Object> intervalo = new LinkedHashMap<>();

            intervalo.put("intervalo", i + 1);
            intervalo.put("fecha_inicial", progreso.getFecha().format(KenkouUtils.dd_MM_yyyy));
            intervalo.put("fecha_final", progresos.get(i + 1).getFecha().format(KenkouUtils.dd_MM_yyyy));

            switch(objetivoId) {
                case 1: paraBajarPeso(intervalo, progreso, progresos.get(i + 1)); break;
                case 2: paraAumentarMasaMuscular(intervalo, progreso, progresos.get(i + 1)); break;
                case 3: paraTonificar(intervalo, progreso, progresos.get(i + 1)); break;
            }
            
            historial.add(intervalo);
            
            if(i + 1 == tamano - 1) {
                break;
            }
        }
        
        return historial;
    }

    private void paraBajarPeso(HashMap<String, Object> intervalo, Progreso progresoAnt, Progreso progresoAct) {
        double perdidaPeso = progresoAct.getPeso() / progresoAnt.getPeso(), porcentajePeso = (1.0 - perdidaPeso) * 100;
        double perdidaGrasa = progresoAct.getPorcentajeGrasa() / progresoAnt.getPorcentajeGrasa(), porcentajeGrasa = (1.0 - perdidaGrasa) * 100;

        intervalo.put("peso_inicial", progresoAnt.getPeso());
        intervalo.put("peso_final", progresoAct.getPeso());
        intervalo.put("perdida_peso", perdidaPeso);
        intervalo.put("porcentaje_perdida_peso", porcentajePeso);
        intervalo.put("perdida_peso_es_positivo", porcentajePeso >= 1.0);
        
        intervalo.put("grasa_inicial", progresoAnt.getPorcentajeGrasa());
        intervalo.put("grasa_final", progresoAct.getPorcentajeGrasa());
        intervalo.put("perdida_grasa", perdidaGrasa);
        intervalo.put("porcentaje_perdida_grasa", porcentajeGrasa);
        intervalo.put("perdida_grasa_es_positivo", porcentajeGrasa >= 1.0);
    }
    
    private void paraAumentarMasaMuscular(HashMap<String, Object> intervalo, Progreso progresoAnt, Progreso progresoAct) {
        double aumentoCuello = progresoAct.getMedidaCuello() - progresoAnt.getMedidaCuello(), aumentoPecho = progresoAct.getMedidaPecho() - progresoAnt.getMedidaPecho(),
        aumentoBrazoDer = progresoAct.getMedidaBrazoDer() - progresoAnt.getMedidaBrazoDer(), aumentoBrazoIzq = progresoAct.getMedidaBrazoIzq() - progresoAnt.getMedidaBrazoIzq(),
        aumentoPiernaDer = progresoAct.getMedidaPiernaDer() - progresoAnt.getMedidaPiernaDer(), aumentoPiernaIzq = progresoAct.getMedidaPiernaIzq() - progresoAnt.getMedidaPiernaIzq();
        
        // intervalo.put("peso_inicial", progresoAnt.getPeso());
        // intervalo.put("peso_final", progresoAct.getPeso());
        
        intervalo.put("medida_pecho_inicial", progresoAnt.getMedidaPecho());
        intervalo.put("medida_pecho_final", progresoAct.getMedidaPecho());
        intervalo.put("aumento_pecho", aumentoPecho);
        intervalo.put("aumento_pecho_es_positivo", aumentoPecho >= 1.0);

        intervalo.put("medida_brazo_der_inicial", progresoAnt.getMedidaBrazoDer());
        intervalo.put("medida_brazo_der_final", progresoAct.getMedidaBrazoDer());
        intervalo.put("aumento_brazo_der", aumentoBrazoDer);
        intervalo.put("aumento_brazo_der_es_positivo", aumentoBrazoDer >= 1.0);
        intervalo.put("medida_brazo_izq_inicial", progresoAnt.getMedidaBrazoIzq());
        intervalo.put("medida_brazo_izq_final", progresoAct.getMedidaBrazoIzq());
        intervalo.put("aumento_brazo_izq", aumentoBrazoIzq);
        intervalo.put("aumento_brazo_izq_es_positivo", aumentoBrazoIzq >= 1.0);

        intervalo.put("medida_pierna_der_inicial", progresoAnt.getMedidaPiernaDer());
        intervalo.put("medida_pierna_der_final", progresoAct.getMedidaPiernaDer());
        intervalo.put("aumento_pierna_der", aumentoPiernaDer);
        intervalo.put("aumento_pierna_der_es_positivo", aumentoPiernaDer >= 1.0);
        intervalo.put("medida_pierna_izq_inicial", progresoAnt.getMedidaPiernaIzq());
        intervalo.put("medida_pierna_izq_final", progresoAct.getMedidaPiernaIzq());
        intervalo.put("aumento_pierna_izq", aumentoPiernaIzq);
        intervalo.put("aumento_pierna_izq_es_positivo", aumentoPiernaIzq >= 1.0);

        intervalo.put("medida_cuello_inicial", progresoAnt.getMedidaCuello());
        intervalo.put("medida_cuello_final", progresoAct.getMedidaCuello());
        intervalo.put("aumento_cuello", aumentoCuello);
        intervalo.put("aumento_cuello_es_positivo", aumentoCuello >= 1.0);
    }
    
    private void paraTonificar(HashMap<String, Object> intervalo, Progreso progresoAnt, Progreso progresoAct) {
        paraBajarPeso(intervalo, progresoAnt, progresoAct);
        paraAumentarMasaMuscular(intervalo, progresoAnt, progresoAct);
    }
}
