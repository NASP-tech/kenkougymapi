package uca.ungallocontenis.kenkougymapi.entity.Ejercicios;

import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity(name = "EjercicioPorMusculo")
@Table(name = "ejercicio_x_musculo")
public class EjercicioPorMusculo {
    @Id
    public int id;
    @ManyToOne
    @MapsId("musculoId")
    @JoinColumn(name = "idmusculo")
    Musculo musculo;
    @ManyToOne
    @MapsId("ejercicioId")
    @JoinColumn(name = "idejercicio")
    Ejercicio ejercicio;
    @ManyToOne
    @MapsId("idImagen")
    @JoinColumn(name = "idimagen") 
    ImagenEjercicio imagenEjercicio;
    @ManyToOne
    @MapsId("idTRutina")
    @JoinColumn(name = "idTRutina")
    TipoRutina tipoRutina;
    public int series;
    public int repeticiones;
    public String peso_recomendado;
    public String tiempo_recomendado;
    public String veces_xsemana;
    public String otras_indicaciones;
    public String dificultad;
    public String url;

    public int getId() {
        return id; 
    }
    public void setId(int id) {
        this.id = id;
    }

    public Musculo getMusculo() {
        return musculo;
    }
    public void setMusculo(Musculo musculo) {
        this.musculo = musculo;
    }

    public Ejercicio getEjercicio() {
        return ejercicio;
    }
    public void setEjercicio(Ejercicio ejercicio) {
        this.ejercicio = ejercicio;
    }

    public ImagenEjercicio getImagenEjercicio() {
        return imagenEjercicio;
    }
    public void setImagenEjercicio(ImagenEjercicio imagenEjercicio) {
        this.imagenEjercicio = imagenEjercicio;
    }
    public TipoRutina getTipoRutina() {
        return tipoRutina;
    }
    public void setTipoRutina(TipoRutina tipoRutina) {
        this.tipoRutina = tipoRutina;
    }
    public int getSeries() {
        return series;
    }
    public void setSeries(int series) {
        this.series = series;
    }

    public int getRepeticiones() {
        return repeticiones;
    }
    public void setRepeticiones(int repeticiones) {
        this.repeticiones = repeticiones;
    }

    public String getPeso_recomendado() {
        return peso_recomendado;
    }
    public void setPeso_recomendado(String peso_recomendado) {
        this.peso_recomendado = peso_recomendado;
    }

    public String getTiempo_recomendado() {
        return tiempo_recomendado;
    }
    public void setTiempo_recomendado(String tiempo_recomendado) {
        this.tiempo_recomendado = tiempo_recomendado;
    }

    public String getVeces_xsemana() {
        return veces_xsemana;
    }
    public void setVeces_xsemana(String veces_xsemana) {
        this.veces_xsemana = veces_xsemana;
    }

    public String getOtras_indicaciones() {
        return otras_indicaciones;
    }
    public void setOtras_indicaciones(String otras_indicaciones) {
        this.otras_indicaciones = otras_indicaciones;
    }
    public String getDificultad() {
        return dificultad; 
    }
    public void setDificultad(String dificultad) {
        this.dificultad = dificultad;
    }
    public String getUrl() {
        return url; 
    }
    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "rutina [series=" + series + ", repeticiones=" + repeticiones + 
        ", pesoRecomendado=" + peso_recomendado + ", tiempoRecomendado=" + tiempo_recomendado + 
        ", vecesXsemana=" + veces_xsemana + ", otrasIndicaciones=" + otras_indicaciones + ", dificultad=" + dificultad +
        ", url=" + url + "]";
    }
}
