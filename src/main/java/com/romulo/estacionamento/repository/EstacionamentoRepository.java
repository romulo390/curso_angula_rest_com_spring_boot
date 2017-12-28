package com.romulo.estacionamento.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.romulo.estacionamento.model.Estacionamento;


public interface EstacionamentoRepository extends JpaRepository<Estacionamento, Long>{

	

}
