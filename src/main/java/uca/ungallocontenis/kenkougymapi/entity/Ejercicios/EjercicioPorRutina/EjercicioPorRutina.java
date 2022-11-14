package uca.ungallocontenis.kenkougymapi.entity.Ejercicios.EjercicioPorRutina;

import javax.persistence.*;

import uca.ungallocontenis.kenkougymapi.entity.Ejercicios.EjercicioPorMusculo;
import uca.ungallocontenis.kenkougymapi.entity.Ejercicios.Rutina;

@Entity(name = "EjercicioPorRutina")
@Table(name = "ejercicio_x_rutina")
public class EjercicioPorRutina {
    @EmbeddedId
    EjercicioPorRutinaKey ejercicioPorRutinaId;
    @ManyToOne
    @MapsId("RutinaId")
    @JoinColumn(name = "idRutina")
    Rutina rutina;
    @ManyToOne
    @MapsId("EMusculoId")
    @JoinColumn(name = "idEMusculo")
    EjercicioPorMusculo ejercicioPorMusculo;

    public EjercicioPorRutinaKey getEjercicioPorRutinaId() {
        return ejercicioPorRutinaId;
    }
    public void setEjercicioPorRutinaId(EjercicioPorRutinaKey ejercicioPorRutinaId) {
        this.ejercicioPorRutinaId = ejercicioPorRutinaId;
    }

    public Rutina getRutina() { 
        return rutina;
    }
    public void setRutina(Rutina rutina) {
        this.rutina = rutina;
    }
    
    public EjercicioPorMusculo getEjercicioPorMusculo() {
        return ejercicioPorMusculo;
    } 
    public void setEjercicioPorMusculo(EjercicioPorMusculo ejercicioPorMusculo) {
        this.ejercicioPorMusculo = ejercicioPorMusculo;
    }
}
