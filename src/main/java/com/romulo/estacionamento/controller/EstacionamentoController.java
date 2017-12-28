package com.romulo.estacionamento.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.romulo.estacionamento.model.Estacionamento;
import com.romulo.estacionamento.model.TipoVeiculo;
import com.romulo.estacionamento.repository.EstacionamentoRepository;
import com.romulo.estacionamento.repository.VeiculoRepository;

@Controller()
public class EstacionamentoController {
	
	@Autowired
	private EstacionamentoRepository estacionamentoRepository;
	
	@Autowired
	private VeiculoRepository veiculoreposutory;
	//modelAttribute="estacionamento"
	
	//@GetMapping("/novo")
	@RequestMapping(value="/novo", method=RequestMethod.GET)
	public ModelAndView novo(Estacionamento estacionamento){	
		
		ModelAndView mv = new ModelAndView("welcome");
		
	//	List<Estacionamento> estacionamentoSalvo = estacionamentoRepository.findAll();
		
		mv.addObject(estacionamento);
		mv.addObject("tipos", TipoVeiculo.values());
	//	mv.addObject("veiculos", estacionamentoSalvo);
		
		return mv;
	}
	
	//@PostMapping("/novo")
	@RequestMapping(value="/novo", method=RequestMethod.POST)
	public ModelAndView salvar(@Valid Estacionamento estacionamento, BindingResult result) {
		
		if(result.hasErrors()){
			return novo(estacionamento);
		}
			estacionamentoRepository.save(estacionamento);
			return new ModelAndView("redirect:/novo");
	}

 }

