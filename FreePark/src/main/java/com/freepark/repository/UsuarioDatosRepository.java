package com.freepark.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.freepark.domain.UsuarioDatos;

public interface UsuarioDatosRepository extends JpaRepository<UsuarioDatos, Long> {

}