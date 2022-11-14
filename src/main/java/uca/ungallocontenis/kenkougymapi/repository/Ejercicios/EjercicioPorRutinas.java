package uca.ungallocontenis.kenkougymapi.repository.Ejercicios;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import uca.ungallocontenis.kenkougymapi.entity.Ejercicios.EjercicioPorRutina.EjercicioPorRutina;
import org.springframework.stereotype.Repository; 

@Repository

public interface EjercicioPorRutinas extends JpaRepository<EjercicioPorRutina, Long> {
    public List<EjercicioPorRutina> findByRutinaId(int idRutina);
}
