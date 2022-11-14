package uca.ungallocontenis.kenkougymapi.entity.KenkouUser;

import java.time.LocalDate;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity(name = "Progreso")
@Table(name = "progreso")
public class Progreso {
    @Id
    @Column(name = "id_progreso")
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    // @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "progreso_id_progreso_seq")
    // @SequenceGenerator(name = "progreso_id_progreso_seq", sequenceName = "progreso_id_progreso_seq")
    @JsonIgnore
    private int id;
    private String username;
    private double peso;
    @Column(name = "medida_pecho")
    private double medidaPecho;
    @Column(name = "medida_brazo_der")
    private double medidaBrazoDer;
    @Column(name = "medida_brazo_izq")
    private double medidaBrazoIzq;
    @Column(name = "medida_pierna_der")
    private double medidaPiernaDer;
    @Column(name = "medida_pierna_izq")
    private double medidaPiernaIzq;
    @Column(name = "medida_cuello")
    private double medidaCuello;
    @Column(name = "diametro_caderas")
    private double diametroCaderas;
    @Column(name = "diametro_cintura")
    private double diametroCintura;
    @Column(name = "porcentaje_grasa")
    private double porcentajeGrasa;
    @Column(columnDefinition = "DATE")
    @JsonFormat(pattern = "dd/MM/yyyy")
    private LocalDate fecha;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getMedidaPecho() {
        return medidaPecho;
    }

    public void setMedidaPecho(double medidaPecho) {
        this.medidaPecho = medidaPecho;
    }

    public double getMedidaBrazoDer() {
        return medidaBrazoDer;
    }

    public void setMedidaBrazoDer(double medidaBrazoDer) {
        this.medidaBrazoDer = medidaBrazoDer;
    }

    public double getMedidaBrazoIzq() {
        return medidaBrazoIzq;
    }

    public void setMedidaBrazoIzq(double medidaBrazoIzq) {
        this.medidaBrazoIzq = medidaBrazoIzq;
    }

    public double getMedidaPiernaDer() {
        return medidaPiernaDer;
    }

    public void setMedidaPiernaDer(double medidaPiernaDer) {
        this.medidaPiernaDer = medidaPiernaDer;
    }

    public double getMedidaPiernaIzq() {
        return medidaPiernaIzq;
    }

    public void setMedidaPiernaIzq(double medidaPiernaIzq) {
        this.medidaPiernaIzq = medidaPiernaIzq;
    }

    public double getMedidaCuello() {
        return medidaCuello;
    }

    public void setMedidaCuello(double medidaCuello) {
        this.medidaCuello = medidaCuello;
    }

    public double getDiametroCaderas() {
        return diametroCaderas;
    }

    public void setDiametroCaderas(double diametroCaderas) {
        this.diametroCaderas = diametroCaderas;
    }

    public double getDiametroCintura() {
        return diametroCintura;
    }

    public void setDiametroCintura(double diametroCintura) {
        this.diametroCintura = diametroCintura;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public double getPorcentajeGrasa() {
        return porcentajeGrasa;
    }

    public void setPorcentajeGrasa(double porcentajeGrasa) {
        this.porcentajeGrasa = porcentajeGrasa;
    }
}
