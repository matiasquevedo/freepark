package com.freepark.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.freepark.domain.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
	@Query("SELECT u FROM Usuario u WHERE u.username =:username")
	List<Usuario> findUsername(@Param("username") String username);
}
