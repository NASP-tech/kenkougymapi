package uca.ungallocontenis.kenkougymapi.repository.Nutricion;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import uca.ungallocontenis.kenkougymapi.entity.Nutricion.PlanAlimenticio;

public interface PlanAlimenticioRepository extends JpaRepository<PlanAlimenticio, Long> {
    public PlanAlimenticio findById(int id);
    public PlanAlimenticio findByNombre(String nombre);
    public List<PlanAlimenticio> findByNombreIsContainingIgnoringCase(String nombre);
    public List<PlanAlimenticio> findByObjetivo_Id(int objetivoId);
    public List<PlanAlimenticio> findByObjetivo_IdIsIn(List<Integer> objetivosId);
    public List<PlanAlimenticio> findByEstiloAlimentacion_Id(int estiloId);
    public List<PlanAlimenticio> findByEstiloAlimentacion_IdIsIn(List<Integer> estilosId);
    public List<PlanAlimenticio> findByRecetas_Id(int recetaId);
    public List<PlanAlimenticio> findByRecetas_IdIsIn(List<Integer> recetasId);
}
