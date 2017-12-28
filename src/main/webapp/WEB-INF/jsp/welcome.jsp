<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="pt-BR">
<head>
<title><fm:message key="indexPageTitle" /></title>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- 
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
<c:url value="/css/main.css" var="jstlCss" />

<link href="${jstlCss}" rel="stylesheet" />


<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="webjars/jquery/1.11.1/jquery.min.js"></script>

<!-- Merolhara esse script, tentar pegar da dependencia, e não de fora!!-->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.11.1/jquery.mask.js"></script>


<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		  $('#placa').mask('AAA-0000', {placeholder: "YYY-0000"});
		  
	});

</script>

<script  type="text/javascript">
	   $("#form_estacionamento").validate({
	       rules : {
	    	   placa:{
	    		   required:true,
                   minlength:9
	                    
	             },
	           modelo:{
	                    required:true
	             },
	             tipo:{
	                    required:true
	             }                                 
	       },
	       messages:{
	    	   placa:{
	                    required:"Por favor, informe a Placa do Veiculo",
	               
	             },
	             modelo:{
	                    required:"É necessário modelo do Carro"
	             },
	             tipo:{
	                    required:"A Tipo do veiculo não pode ficar em branco"
	             }      
	       }
	   });
 
	   
	   
 </script>

</head>

<body>
	<%@page import="com.romulo.estacionamento.model.TipoVeiculo"%>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand">Spring Boot</a>

			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#about">Olá: ${message}</a></li>
					<li class="active"><a href="#">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="starter-template">
		<h1>Entrada no Estacionamento!</h1>
		<!--  <h2>Message: ${message}</h2>-->
	</div>
	</br>
	</br>

	<c:url var="novoVeiculo" value="/novo" />

	<div class="container  col-md-5">

		<form:form action="${novoVeiculo}" modelAttribute="estacionamento" id="form_estacionamento">

			<div class="form-group row ">
				<div class="form-group col-md-3">
					<label for="placa">Placa:</label>
					<form:input type="text" path="placa" 
					           class="form-control text-uppercase"  id="placa" maxlength="9"/>
				</div>
			</div>

			<div class="form-group row">
				<div class="form-group col-md-5">
					<label for="modelo" class=" control-label">Modelo:</label>
					<form:input path="veiculo.modelo" id="modelo"
						class="form-control"  placeholder="Digite o modelo do carro" type="text" />
				</div>
				<div class="form-group col-md-5">
					<label for="tipo" class="control-label">Tipo de
						Veiculo:</label>

					<fm:message key="tipoVeiculo.MOTO" />

					<form:select class="form-control"   path="veiculo.tipo" id="tipo">

						<form:option value="" label="***Tipo de Veiculo***" />

						<form:options items="${tipos}" />

					</form:select>

				</div>
			</div>

			<button type="submit" class="btn btn-primary btn-lg">Carregar</button>
		</form:form>
	</div>

	<div class="container col-md-6">
		<div class="form-group row">
			<h4 class="form-group">Tabelas de Automóveis</h4>
			<table class="table table-hover table-striped ">

				<thead>
					<tr>
						<th><b>ID</b></th>
						<th><b>Placa</b></th>
						<th><b>Modelo</b></th>
						<th><b>Tipo</b></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${veiculos}" var="veiculo">
						<tr>
							<td>${veiculo.cod}</td>
							<td class="text-uppercase">${veiculo.veiculo.placa}</td>
							<td>${veiculo.veiculo.modelo}</td>
							<td>${veiculo.veiculo.tipo}</td>


							<td><a href="#">
									<button type="submit" class="btn btn-primary">Delete
										User</button>
							</a></td>

						</tr>

					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>










	<%-- 
	<div class="container col-md-6">
		<c:import url="tabela-veiculo.jsp"></c:import>
		
	</div>
 --%>
	<!-- /.container -->
</body>

</html>
