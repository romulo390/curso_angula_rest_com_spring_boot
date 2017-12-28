package com.romulo.estacionamento.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="veiculo")
@Component
public class Veiculo {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	
	private String placa;

	
	private String modelo;

	
	@Enumerated(EnumType.STRING)
	private TipoVeiculo tipo;
/*
	@ManyToOne()
	public Estacionamento estacionamento;*/

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getPlaca() {
			return placa;
	}
	public void setPlaca(String placa) {
			this.placa = placa;
	}
	
	public String getModelo() {
			return modelo;
	}
	public void setModelo(String modelo) {
			this.modelo = modelo;
	}
	
	public TipoVeiculo getTipo() {
			return tipo;
	}
	
	public void setTipo(TipoVeiculo tipo) {
			this.tipo = tipo;
	}
	/*public Estacionamento getEstacionamento() {
		return estacionamento;
	}
	public void setEstacionamento(Estacionamento estacionamento) {
		this.estacionamento = estacionamento;
	}*/
	
	


	}
