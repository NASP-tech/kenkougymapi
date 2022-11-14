package uca.ungallocontenis.kenkougymapi.repository.KenkouUser;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.KenkouUser;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioObjetivoActivo.UsuarioObjetivoActivo;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo.UsuarioPlanAlimenticioActivo;

public interface KenkouUserRepository extends JpaRepository<KenkouUser, String> {
    public KenkouUser findByUsername(String username);
    public KenkouUser findByUsernameOrEmail(String username, String email);
    @Query("SELECT sexo FROM KenkouUser u WHERE u.username = :username")
    public String getSexoByUsername(@Param("username") String username);
    @Query("SELECT medidaAltura FROM KenkouUser u WHERE u.username = :username")
    public Double getMeidaAlturaByUsername(@Param("username") String username);
    @Query("SELECT objetivos FROM KenkouUser u WHERE u.username = :username OR u.email = :email")
    public Set<UsuarioObjetivoActivo> getObjetivosByUsernameOrEmail(@Param("username") String username, @Param("email") String email);
    @Query("SELECT planesAlimenticios FROM KenkouUser u WHERE u.username = :username OR u.email = :email")
    public Set<UsuarioPlanAlimenticioActivo> getPlanesAlimenticiosByUsernameOrEmail(@Param("username") String username, @Param("email") String email);
}
