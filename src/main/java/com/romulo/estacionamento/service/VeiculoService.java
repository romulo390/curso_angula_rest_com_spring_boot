package com.romulo.estacionamento.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romulo.estacionamento.model.Usuario;
import com.romulo.estacionamento.repository.UsuarioRepository;



@Service
public class VeiculoService {

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	public Usuario buscarPornome(Usuario usuario) throws UsuarioInexisistenteOuInativaException {
		
	//	Usuario usuarioBusca = usuarioRepository.findByNome(usuario.getNome());
		
//		if(usuarioBusca != null){
//			return usuarioBusca;
//		}
		
		throw new UsuarioInexisistenteOuInativaException();
	}
}
