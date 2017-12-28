package com.romulo.estacionamento.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="estacionamento")
public class Estacionamento {
	
	//private double custoInicial = 2.00;
	//private double custoAdicional = 1.50;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long cod;

	
	/*
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "estacionamento")
	private List<Veiculo> veiculo;*/
	
	//@NotNull
	//@Column(name="data_entrada")
//	@Temporal(TemporalType.TIME)
	//private Date  dataEntrada = new java.sql.Date(System.currentTimeMillis());
	
	
	
	public Long getCod() {
		return cod;
	}

	public void setCod(Long cod) {
		this.cod = cod;
	}
	
	
	/*public Date getDataEntrada() {
		return dataEntrada;
	}
	
	public void setDataEntrada(Date dataEntrada) {
		this.dataEntrada = dataEntrada;
	}*/

	/*public List<Veiculo> getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(List<Veiculo> veiculo) {
		this.veiculo = veiculo;
	}*/

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cod == null) ? 0 : cod.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Estacionamento other = (Estacionamento) obj;
		if (cod == null) {
			if (other.cod != null)
				return false;
		} else if (!cod.equals(other.cod))
			return false;
		return true;
	}
	
	
	
}
