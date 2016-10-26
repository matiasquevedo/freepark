package com.freepark.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.freepark.domain.Reserva;

public interface ReservaRepository extends JpaRepository<Reserva, Long> {

}
