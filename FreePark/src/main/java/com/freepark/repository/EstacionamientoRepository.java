package com.freepark.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.freepark.domain.Estacionamiento;

public interface EstacionamientoRepository extends JpaRepository<Estacionamiento, Long> {

}
