package com.romulo.estacionamento.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.romulo.estacionamento.model.Veiculo;

public interface VeiculoRepository extends JpaRepository<Veiculo,Long> {

}
