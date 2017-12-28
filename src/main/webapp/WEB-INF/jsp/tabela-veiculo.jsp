<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="pt-BR">
<head>

<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- 
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
<c:url value="/css/main.css" var="jstlCss" />

<link href="${jstlCss}" rel="stylesheet" />


<script type="text/javascript" src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<!-- Merolhara esse script, tentar pegar da dependencia, e não de fora!!-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.11.1/jquery.mask.js"></script>
	
</head>

<body>
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
				</tr>
			</thead>
			<tbody>
			   <c:forEach items="${veiculos}" var="veiculo">
					<tr>
						<td>${veiculo.cod}</td>
						<td>${veiculo.placa}</td>
						<td>${veiculo.modelo}</td>
						<td>${veiculo.tipo}</td>
						<td>${veiculo.dataEntrada}</td>

						<td><a href="/index/${lou.id}/edit">
								<button type="submit" class="btn btn-primary">Edit User</button>
						</a></td>
						<td><a href="/index/${lou.id}/delete">
								<button type="submit" class="btn btn-primary">Delete
									User</button>
						</a></td>

					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>
	</div>
</body>

</html>
