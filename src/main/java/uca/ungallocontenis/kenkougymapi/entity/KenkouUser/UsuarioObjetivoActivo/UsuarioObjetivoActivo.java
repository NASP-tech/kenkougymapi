package uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioObjetivoActivo;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import uca.ungallocontenis.kenkougymapi.entity.General.Objetivo;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.KenkouUser;

@Entity(name = "UsuarioObjetivoActivo")
@Table(name = "usuario_objetivo")
public class UsuarioObjetivoActivo {
    @EmbeddedId
    UsuarioObjetivoActivoKey id;
    @JsonIgnore
    @ManyToOne
    @MapsId("usernameId")
    @JoinColumn(name = "username")
    KenkouUser usuario;
    @ManyToOne
    @MapsId("objetivoId")
    @JoinColumn(name = "objetivo_id")
    Objetivo objetivo;
    boolean activo;

    public UsuarioObjetivoActivoKey getId() {
        return id;
    }
    
    public void setId(UsuarioObjetivoActivoKey id) {
        this.id = id;
    }
    
    public KenkouUser getUsuario() {
        return usuario;
    }
    
    public void setUsuario(KenkouUser usuario) {
        this.usuario = usuario;
    }
    
    public Objetivo getObjetivo() {
        return objetivo;
    }
    
    public void setObjetivo(Objetivo objetivo) {
        this.objetivo = objetivo;
    }
    
    public boolean isActivo() {
        return activo;
    }
    
    public void setActivo(boolean activo) {
        this.activo = activo;
    }    
}
