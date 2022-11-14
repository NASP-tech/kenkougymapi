package uca.ungallocontenis.kenkougymapi.entity.Nutricion;

import java.util.List;
import java.util.Set;

import javax.persistence.*;

import uca.ungallocontenis.kenkougymapi.entity.General.Objetivo;
import uca.ungallocontenis.kenkougymapi.entity.Nutricion.CantidadDeIngredienteEnReceta.CantidadDeIngredienteEnReceta;

@Entity(name = "Receta")
@Table(name = "receta")
public class Receta {
    @Id
    public int id;
    public String nombre;
    @Column(name = "linkvideo")
    public String linkVideo;
    public String instrucciones;
    @OneToOne
    @JoinColumn(name = "id_objetivo")
    public Objetivo objetivo;
    @OneToOne
    @JoinColumn(name = "tiempo_comida")
    TiempoComida tiempoComida;
    @OneToMany(mappedBy = "receta")
    Set<CantidadDeIngredienteEnReceta> cantidadDeIngrediente;
    
    
    @OneToOne
    @JoinColumn(name = "tablanutrionalid")
    public TablaNutricional tablanutricional;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLinkVideo() {
        return linkVideo;
    }

    public void setLinkVideo(String linkVideo) {
        this.linkVideo = linkVideo;
    }

    public String getInstrucciones() {
        return instrucciones;
    }

    public void setInstrucciones(String instrucciones) {
        this.instrucciones = instrucciones;
    }

    public Objetivo getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(Objetivo objetivo) {
        this.objetivo = objetivo;
    }

    public TiempoComida getTiempoComida() {
        return tiempoComida;
    }

    public void setTiempoComida(TiempoComida tiempoComida) {
        this.tiempoComida = tiempoComida;
    }

    public Set<CantidadDeIngredienteEnReceta> getCantidadDeIngrediente() {
        return cantidadDeIngrediente;
    }

    public void setCantidadDeIngrediente(Set<CantidadDeIngredienteEnReceta> cantidadDeIngrediente) {
        this.cantidadDeIngrediente = cantidadDeIngrediente;
    }
}
