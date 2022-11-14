package uca.ungallocontenis.kenkougymapi.entity.Ejercicios;

import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity(name = "Rutina")
@Table(name = "rutina")
public class Rutina {
    @Id
    public int id;
    public String nombre;
    public String imagen;
    public String dificultad;
    public String objetivo;
    public String musculo_a_trabajar;
    public String instrucciones;

   
    public String getImagen() {
        return imagen;
    }
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    public String getDificultad() {
        return dificultad;
    }
    public void setDificultad(String dificultad) {
        this.dificultad = dificultad;
    }
    public String getObjetivo() {
        return objetivo;
    }
    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }
    public String getMusculo_a_trabajar() {
        return musculo_a_trabajar;
    }
    public void setMusculo_a_trabajar(String musculo_a_trabajar) {
        this.musculo_a_trabajar = musculo_a_trabajar;
    }
    public String getInstrucciones() {
        return instrucciones;
    }
    public void setInstrucciones(String instrucciones) {
        this.instrucciones = instrucciones;
    }
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

    @Override
    public String toString() {
        return "rutina [nombre=" + nombre + ", imagen=" + imagen + ", dificultad=" + dificultad + 
        ", objetivo=" + objetivo + ", musculo_a_trabajar=" + musculo_a_trabajar + ", instrucciones=" + instrucciones +"]";
    }
}