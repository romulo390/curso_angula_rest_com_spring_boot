package com.romulo.estacionamento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romulo.estacionamento.model.Estacionamento;
import com.romulo.estacionamento.model.Veiculo;
import com.romulo.estacionamento.repository.EstacionamentoRepository;

//Ainda n estou usando !!!
@Service
public class EstacionamentoService {

	@Autowired
	private EstacionamentoRepository estacionamentoRepository;
	

}
