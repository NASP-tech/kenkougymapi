package uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.KenkouUser;
import uca.ungallocontenis.kenkougymapi.entity.Nutricion.PlanAlimenticio;

@Entity(name = "UsuarioPlanAlimenticioActivo")
@Table(name = "userxdieta")
public class UsuarioPlanAlimenticioActivo {
    @EmbeddedId
    UsuarioPlanAlimenticioActivoKey id;
    @JsonIgnore
    @ManyToOne
    @MapsId("usernameId")
    @JoinColumn(name = "username")
    KenkouUser usuario;
    @ManyToOne
    @MapsId("planAlimenticioId")
    @JoinColumn(name = "id_planalimenticio")
    PlanAlimenticio planAlimenticio;
    @Column(name = "estado")
    private boolean activo;

    public UsuarioPlanAlimenticioActivo() {}

    public UsuarioPlanAlimenticioActivo(UsuarioPlanAlimenticioActivoKey id, KenkouUser usuario,
            PlanAlimenticio planAlimenticio, boolean activo) {
        this.id = id;
        this.usuario = usuario;
        this.planAlimenticio = planAlimenticio;
        this.activo = activo;
    }

    public UsuarioPlanAlimenticioActivoKey getId() {
        return id;
    }

    public void setId(UsuarioPlanAlimenticioActivoKey id) {
        this.id = id;
    }

    public KenkouUser getUsuario() {
        return usuario;
    }

    public void setUsuario(KenkouUser usuario) {
        this.usuario = usuario;
    }

    public PlanAlimenticio getPlanAlimenticio() {
        return planAlimenticio;
    }

    public void setPlanAlimenticio(PlanAlimenticio planAlimenticio) {
        this.planAlimenticio = planAlimenticio;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setEstado(boolean activo) {
        this.activo = activo;
    }
}
