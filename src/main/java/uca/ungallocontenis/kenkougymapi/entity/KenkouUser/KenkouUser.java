package uca.ungallocontenis.kenkougymapi.entity.KenkouUser;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioObjetivoActivo.UsuarioObjetivoActivo;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo.UsuarioPlanAlimenticioActivo;

@Entity(name = "KenkouUser")
@Table(name = "kenkou_user")
public class KenkouUser {
    
    @Id
    private String username;
    private String email;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastname;
    private String password;
    private boolean enabled;
    private boolean locked;
    @Column(name = "credentials_expiration", columnDefinition = "DATE")
    private LocalDate credentialsExpiration;
    @ManyToMany(fetch = FetchType.LAZY) // EAGER: Every time we retrieve a KenkouUser, the KenkouRole List will be filled inmediately
    @JoinTable(name = "user_role", joinColumns = {@JoinColumn(name = "username", referencedColumnName = "username")}, inverseJoinColumns = {@JoinColumn(name = "role_code", referencedColumnName = "role_code")})
    private List<KenkouRole> usersRoles;
    @Column(name = "medida_altura")
    private float medidaAltura;
    @OneToMany(mappedBy = "usuario") 
    private Set<UsuarioObjetivoActivo> objetivos;
    private String sexo;
    @OneToMany(mappedBy = "usuario") 
    private Set<UsuarioPlanAlimenticioActivo> planesAlimenticios;

    public boolean isCredentialsExpired() {
        return this.credentialsExpiration.isEqual(LocalDate.now()); 
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public boolean isLocked() {
        return locked;
    }

    public void setLocked(boolean locked) {
        this.locked = locked;
    }

    public LocalDate getCredentialsExpiration() {
        return credentialsExpiration;
    }

    public void setCredentialsExpiration(LocalDate credentialsExpiration) {
        this.credentialsExpiration = credentialsExpiration;
    }

    public List<KenkouRole> getUsersRoles() {
        return usersRoles;
    }

    public void setUsersRoles(List<KenkouRole> usersRoles) {
        this.usersRoles = usersRoles;
    }

    public float getMedidaAltura() {
        return medidaAltura;
    }

    public void setMedidaAltura(float medidaAltura) {
        this.medidaAltura = medidaAltura;
    }

    public Set<UsuarioObjetivoActivo> getObjetivos() {
        return objetivos;
    }

    public void setObjetivos(Set<UsuarioObjetivoActivo> objetivos) {
        this.objetivos = objetivos;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Set<UsuarioPlanAlimenticioActivo> getPlanesAlimenticios() {
        return planesAlimenticios;
    }

    public void setPlanesAlimenticios(Set<UsuarioPlanAlimenticioActivo> planesAlimenticios) {
        this.planesAlimenticios = planesAlimenticios;
    }
}
