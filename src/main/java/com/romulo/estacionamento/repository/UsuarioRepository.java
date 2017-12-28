package com.romulo.estacionamento.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.romulo.estacionamento.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

	public Usuario findByNome(String nome);
}
