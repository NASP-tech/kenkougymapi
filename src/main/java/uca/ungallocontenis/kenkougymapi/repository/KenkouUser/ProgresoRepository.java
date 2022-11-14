package uca.ungallocontenis.kenkougymapi.repository.KenkouUser;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import uca.ungallocontenis.kenkougymapi.entity.KenkouUser.Progreso;

public interface ProgresoRepository extends JpaRepository<Progreso, Integer> {
    public List<Progreso> findByFechaIsBetweenOrderByFechaAsc(LocalDate fechaInicio, LocalDate fechaFinal);
}
