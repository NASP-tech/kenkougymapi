package uca.ungallocontenis.kenkougymapi.entity.Ejercicios.EjercicioPorRutina;

import java.io.Serializable;

import javax.persistence.Column;

public class EjercicioPorRutinaKey implements Serializable{
    @Column(name = "idRutina")
    int rutinaId;
    @Column(name = "idEMusculo")
    int ejercicioPorMusculoId;
    
    public int getRutinaId() {
        return rutinaId;
    }
    public void setRutinaId(int rutinaId) {
        this.rutinaId = rutinaId;
    }

    public int getEjercicioPorMusculoId() {
        return ejercicioPorMusculoId;
    }
    public void setEjercicioPorMusculoId(int ejercicioPorMusculoId) {
        this.ejercicioPorMusculoId = ejercicioPorMusculoId;
    }
}
