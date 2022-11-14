package uca.ungallocontenis.kenkougymapi.repository.Ejercicios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import uca.ungallocontenis.kenkougymapi.entity.Ejercicios.Rutina;
import org.springframework.stereotype.Repository; 

@Repository

public interface RutinaRepository extends JpaRepository<Rutina, Long> {
    public Rutina findById(int id);
    public Rutina findByNombre(String nombre);
    public List<Rutina> findByNombreIsContainingIgnoringCase(String nombre);
}