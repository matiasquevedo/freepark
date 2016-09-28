package com.freepark.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.freepark.domain.Vehiculo;

public interface VehiculoRepository extends JpaRepository<Vehiculo, Long> {

}
