package uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class UsuarioPlanAlimenticioActivoKey implements Serializable {
    @Column(name = "username")
    String usernameId;
    @Column(name = "id_planalimenticio")
    int planAlimenticioId;

    public UsuarioPlanAlimenticioActivoKey() {}

    public UsuarioPlanAlimenticioActivoKey(String usernameId, int planAlimenticioId) {
        this.usernameId = usernameId;
        this.planAlimenticioId = planAlimenticioId;
    }

    public String getUsernameId() {
        return usernameId;
    }
    
    public void setUsernameId(String username) {
        this.usernameId = username;
    }

    public int getPlanAlimenticioId() {
        return planAlimenticioId;
    }

    public void setPlanAlimenticioId(int planAlimenticioId) {
        this.planAlimenticioId = planAlimenticioId;
    }

    @Override
    public boolean equals(Object obj) {
        return this.equals(obj);
    }

    @Override
    public int hashCode() {
        return usernameId.concat(String.valueOf(planAlimenticioId)).hashCode();
    }
}
