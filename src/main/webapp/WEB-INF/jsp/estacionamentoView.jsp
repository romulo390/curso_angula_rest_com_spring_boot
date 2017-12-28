<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html lang="pt-BR">
<head>

<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- 
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
<c:url value="/css/main.css" var="jstlCss" />

<link href="${jstlCss}" rel="stylesheet" />


<script type="text/javascript" src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<!-- Merolhara esse script, tentar pegar da dependencia, e não de fora!!-->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.11.1/jquery.mask.js"></script>

<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>

<style type="text/css">
label.error {
	color: #a94442;
	font-family: Helvetica;
	font-size: 15px;
	font-variant: normal;
	font-weight: 500;
	line-height: 14.3px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('#placa').mask('AAA-0000', {
			placeholder : "YYY-0000"
		});

	});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#form_veiculo").validate({
			rules : {
				placa : {
					required : true,
					minlength : 8

				},
				modelo : {
					required : true
				},
				tipo : {
					required : true
				}
			},
			messages : {

				placa : {
					required : "*Placa do Veiculo Obrigatório",

				},
				modelo : {
					required : "*Modelo é Obrigatório"
				},
				tipo : {
					required : "*O Tipo é Obrigatório"
				}
			}
		});
	});
</script>
</head>

<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand">Spring Boot</a>

			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="">Olá:</a></li>
					<li class="active"><a href="<c:url value="/login" />">Logout</a></li>
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

	<c:url var="novoVeiculo" value="/veiculo" />

	<div class="container col-md-5">

		<form action="${novoVeiculo}" method="post" id="form_veiculo">

			

			<div class="form-group row ">
				<div class="form-group col-md-5">
					<label for="placa">Placa:</label> <input type="text" name="placa"
						class="form-control text-uppercase is-invalid" id="placa" required
						maxlength="8" />
				</div>
			</div>

			<div class="form-group row">
				<div class="form-group col-md-5">
					<label for="modelo" class=" control-label">Modelo: </label> <input
						name="modelo" id="modelo" class="form-control" required
						placeholder="Digite o modelo do carro" type="text" />
				</div>
				<div class="form-group col-md-5">
					<label for="tipo" class="control-label">Tipo de Veiculo:</label> <select
						class="form-control" name="tipo" required>

						<option value="">Selecione...</option>
						<c:forEach var="tipo" items="${tipos}">
							<option value="${tipo}">${tipo}</option>
						</c:forEach>
					</select>

				</div>
			</div>

			<button type="submit" class="btn btn-primary btn-lg"  data-toggle="modal" data-target=".bd-example-modal-sm">Carregar</button>
		</form>
	</div>
		
	<div class="container  col-md-5">
		<form action="" method="" id="">

			<label for="placa">Pesquisa veiculo:</label>
			<div class="input-group col-md-6">
				<input class="form-control" type="text"
					placeholder="Digite a placa do veiculo" />
				<div class="input-group-btn">
					<button class="btn btn-primary" type="submit">Busca</button>
				</div>
			</div>
		</form>
	</div>

	<%-- <c:import url="com.romulo.estacionamento.model.TipoVeiculo" var="tipo"></c:import> --%>

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
						<th><b>Data-Hora-Entr</b></th>
						<th><b>Açãor</b></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${veiculos}" var="veiculo">
						<tr>
							<td>${veiculo.id}</td>
							<td class="text-uppercase">${veiculo.placa}</td>
							<td>${veiculo.modelo}</td>
							<td>${veiculo.tipo}</td>
							<td>Hora</td>


							<td><a href="/index/${lou.id}/edit">
									<button type="submit" class="btn btn-danger">Saida de
										Veiculo</button>
							</a></td>

						</tr>

					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	
	
</body>

</html>
