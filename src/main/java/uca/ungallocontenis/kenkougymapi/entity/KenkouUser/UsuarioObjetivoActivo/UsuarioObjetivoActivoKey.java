package uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioObjetivoActivo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UsuarioObjetivoActivoKey implements Serializable {
    @Column(name = "username")
    String usernameId;
    @Column(name = "objetivo_id")
    int objetivoId;

    public String getUsernameId() {
        return usernameId;
    }
    
    public void setUsernameId(String username) {
        this.usernameId = username;
    }
    
    public int getObjetivoId() {
        return objetivoId;
    }
    
    public void setObjetivoId(int objetivoId) {
        this.objetivoId = objetivoId;
    }

    @Override
    public boolean equals(Object obj) {
        return this.equals(obj);
    }

    @Override
    public int hashCode() {
        return usernameId.concat(String.valueOf(objetivoId)).hashCode();
    }
}
