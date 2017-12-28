package com.romulo.estacionamento.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.romulo.estacionamento.model.TipoVeiculo;
import com.romulo.estacionamento.model.Usuario;
import com.romulo.estacionamento.model.Veiculo;
import com.romulo.estacionamento.repository.UsuarioRepository;
import com.romulo.estacionamento.repository.VeiculoRepository;
import com.romulo.estacionamento.service.UsuarioInexisistenteOuInativaException;
import com.romulo.estacionamento.service.VeiculoService;

@Controller
public class VeiculoControle {

	@Autowired
	private VeiculoRepository veiculoRepository;
	
	@Autowired
	private VeiculoService usuarioService;
	
	@Autowired
	private UsuarioRepository usuarioRepositoty;
	
	//@RequestParam(value = "error", required = false) String error,
	//@RequestParam(value = "logout", required = false)
	
	@GetMapping("/login")
	public ModelAndView login(String nome) {
		
		ModelAndView mv = new ModelAndView("login");
		
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView usuarioLogado(String nome){
		
		Usuario usuarioOptional = usuarioRepositoty.findByNome(nome);

		ModelAndView mv = new ModelAndView();
		
			if(usuarioOptional == null){
				return mv.addObject("error", "Usuario e/ou senha incorretos");
		}
			
	return new ModelAndView("redirect:/veiculo");
		
	}
		
	
	@GetMapping("/veiculo")
	public ModelAndView novo(Veiculo veiculo){	
		
		ModelAndView mv = new ModelAndView("estacionamentoView");
		
		List<Veiculo> veiculoSalvo = veiculoRepository.findAll();
		
		mv.addObject(veiculo);
		mv.addObject("tipos", TipoVeiculo.values());
		mv.addObject("veiculos", veiculoSalvo);
		
		return mv;
	}
	
	@PostMapping("/veiculo")
	//@RequestMapping(value="/veiculo", method=RequestMethod.POST)
	public ModelAndView salvaVeiculo(@Valid Veiculo veiculo, BindingResult bindingResul, RedirectAttributes red){
		
		if(bindingResul.hasErrors()){
			return novo(veiculo);
		}
		
		veiculoRepository.save(veiculo);
		red.addFlashAttribute("messagem", "Veiculo salvo com sucesso!!");
		return new ModelAndView("redirect:/veiculo");
	}
	
}
