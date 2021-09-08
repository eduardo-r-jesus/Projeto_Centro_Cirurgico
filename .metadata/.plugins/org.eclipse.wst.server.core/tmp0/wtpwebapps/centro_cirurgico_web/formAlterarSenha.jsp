<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%
	if (usuario == null) {
		response.sendRedirect("formLogin.jsp");
	}
	%>

	<div class="container">
		<br>
		<h2>Alterar Senha</h2>
		<form name="form-alterarSenha" id="form-alterarSenha" action="AlterarSenhaServlet" method="Post">
		<div class="alert alert-primary col-md-6" role="alert"  id="msg"></div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="senhaAtual">Senha Atual:</label> <input type="password"
						class="form-control" id="senhaAtual" placeholder="Senha atual."
						name="senhaAtual">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="novaSenha">Nova Senha:</label> <input type="password"
						class="form-control" id="novaSenha" placeholder="Nova senha." name="novaSenha">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="confirmarSenha">Confirmar Senha:</label> <input type="password"
						class="form-control" id="confirmarSenha" placeholder="Confirmar senha." name="confirmarSenha">
				</div>
			</div>
			<input type="button" class="btn btn-primary" value="Gravar" onclick="alterarSenha()">
		
	</div>
	
	<script type="text/javascript">
		function alterarSenha() {
			var senhaAtual = document.getElementById("senhaAtual").value;
			var novaSenha = document.getElementById("novaSenha").value;
			var confirmarSenha = document.getElementById("confirmarSenha").value;

			var parametros = "senhaAtual=" + senhaAtual;
			parametros += "&novaSenha=" + novaSenha;
			parametros += "&confirmarSenha=" + confirmarSenha;
			acessarApi(parametros);
		}

		function acessarApi(parametros) {
			const api = new XMLHttpRequest();
			api.open("POST",
					"http://localhost:8080/centro_cirurgico_web/AlterarSenhaServlet");
			api.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			api.send(parametros);
			api.onload = function() {
				document.getElementById("msg").innerHTML = this.responseText;
			}

		}
	</script>

</body>
</html>