package uca.ungallocontenis.kenkougymapi.repository.KenkouUser;

import org.springframework.data.jpa.repository.JpaRepository;

import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo.UsuarioPlanAlimenticioActivo;
import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.UsuarioPlanAlimenticioActivo.UsuarioPlanAlimenticioActivoKey;

public interface UsuarioPlanAlimenticioActivoRepository extends JpaRepository<UsuarioPlanAlimenticioActivo, UsuarioPlanAlimenticioActivoKey> {
    
}
