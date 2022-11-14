package uca.ungallocontenis.kenkougymapi.entity.Nutricion.CantidadDeIngredienteEnReceta;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CantidadDeIngredienteEnRecetaKey implements Serializable {
    @Column(name = "id_receta")
    int recetaId;
    @Column(name = "id_ingrediente")
    int ingredienteId;
    
    public int getRecetaId() {
        return recetaId;
    }

    public void setRecetaId(int recetaId) {
        this.recetaId = recetaId;
    }

    public int getIngredienteId() {
        return ingredienteId;
    }

    public void setIngredienteId(int ingredienteId) {
        this.ingredienteId = ingredienteId;
    }

    @Override
    public boolean equals(Object obj) {
        return this.equals(obj);
    }

    @Override
    public int hashCode() {
        return String.valueOf(recetaId).concat(String.valueOf(ingredienteId)).hashCode();
    }
}