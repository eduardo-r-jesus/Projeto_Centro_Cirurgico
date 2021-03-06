<%@page import="org.cc.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manter Usuário</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

	<%
	Usuario u = new Usuario();

	try {
		int id = Integer.parseInt(request.getParameter("id"));
		UsuarioDao dao = new UsuarioDao();
		u = dao.getUsuario(id);
	} catch (Exception e) {

	}
	%>


	<div class="container">
		<br>
		<h2>Manter Usuário</h2>
		<form name="form-usuario" id="form-usuario"
			action="ManterUsuarioServlet" method="Post">
		<div id="msg"></div>
			<input type="hidden" id="id" name="id" value="<%=u.getId()%>">
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="email">E-mail:</label> <input type="email"
						class="form-control" id="email" placeholder="E-mail do usuário."
						name="email" value="<%=u.getEmail()%>">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="senha">Senha:</label> <input type="password"
						class="form-control" id="senha" placeholder="Senha do usuário."
						name="senha" value="<%=u.getSenha()%>">
				</div>
			</div>

			<%
			if (usuario != null && usuario.getPerfil().equals("administrador")) {
			%>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="Perfil">Perfil:</label>
					<div class="form-control borda">
						<input type="radio" id="administrador" name="perfil"
							value="administrador" checked="checked"><label
							for="administrador"> Administrador</label> <input type="radio"
							class="espacamento" id="operador" name="perfil" value="operador"><label
							for="operador"> Operador</label> <input type="radio"
							class="espacamento" id="estagiario" name="perfil"
							value="estagiario"><label for="estagiario">
							Estagiário</label>
					</div>
				</div>
			</div>
			<%
			} else {
			%>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="Perfil">Perfil:</label>
					<div class="form-control borda"  >
						<input type="radio" id="administrador" name="perfil"
							value="administrador" disabled="disabled"><label
							for="administrador"> Administrador</label> <input type="radio"
							class="espacamento" id="operador" name="perfil" value="operador"
							disabled="disabled"><label for="operador">
							Operador</label> <input type="radio" class="espacamento" id="estagiario"
							name="perfil" value="estagiario" disabled="disabled"><label
							for="estagiario"> Estagiário</label>
					</div>
				</div>
			</div>

			<%
			}
			%>
			<input type="button" class="btn btn-primary" value="Gravar" onclick="cadastrarUsuario(); alertaMensagem()">
			<%
			if (usuario == null) {
			%>
			<a href="formLogin.jsp" type="submit" class="btn btn-secondary"
				value="voltar">Voltar</a>

			<%
			} else if (u.getId() > 0) {
			%>

			<input type="button" class="btn btn-danger" value="Apagar" onclick="excluirUsuario(<%=u.getId()%>); alertaMensagem()">
				
			<%
			} else {
			%>
			<input type="reset" class="btn btn-danger" value="Limpar">
			<%
			}
			%>

			<%
			if (usuario != null) {
			%>
			<a href="formManterUsuario.jsp" type="submit" class="btn btn-success" id="espacamento" value="Cadastrar">Novo</a>
			<%
			}
			%>

		</form>
		<hr>
		
		<script type="text/javascript">
		
		function cadastrarUsuario() {
			var id = document.querySelector("#id").value;
			var email = document.querySelector("#email").value;
			var senha = document.querySelector("#senha").value;
			var perfil = document.querySelector('[name="perfil"]:checked').value;

			var out = "";
			out += "id=$id&email=$email&senha=$senha&perfil=$perfil";
			out = out.replace("$id",id)
			out = out.replace("$email",email)
			out = out.replace("$senha",senha)
			out = out.replace("$perfil",perfil);
			acessarApiServlet(out);
		}
		
		function excluirUsuario(id){
			if(confirm('Deseja excluir esse registro?')){
				acessarApiServlet("id="+id+"&acao=excluir");
			}
		}

		function acessarApiServlet(parametros) {
			const api = new XMLHttpRequest();
			api.open("POST", "ManterUsuarioServlet?"+parametros);
			api.send();
			api.onload = function() {
				var dados = this.responseText;
				dados = JSON.parse(dados);
				document.querySelector("#msg").innerHTML = dados.msg;
			}

		}
		
		var lsPerfil = document.getElementsByName("perfil");
		for (i in lsPerfil) {
			if (lsPerfil[i].value == '<%=u.getPerfil()%>') {
					lsPerfil[i].setAttribute('checked', 'checked');
				}
			}
		
		function alertaMensagem() {
			document.querySelector("#msg").className = "mens";  
			}
		
		</script>

		<%
		if (usuario != null && usuario.getPerfil().equals("administrador")) {
		%>
			<%@ include file="formListaUsuario.jsp"%>
		<%
		}
		%>
		
		

	</div>

</body>
</html>