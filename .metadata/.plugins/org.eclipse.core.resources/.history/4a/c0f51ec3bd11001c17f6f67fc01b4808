<%@page import="org.cc.dao.PainelDao"%>
<%@page import="org.cc.model.Painel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerenciar Painel Pacientes</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<%@ include file="menu.jsp" %>

<%
	if (usuario == null) {
		response.sendRedirect("formLogin.jsp");
	}	

	Painel pai = new Painel();
		
	try{	
	int id = Integer.parseInt(request.getParameter("id"));
	PainelDao paiDao = new PainelDao();
	pai = paiDao.getRegistroPainel(id);
	
	}catch(Exception e){
		
	}	
%>

	<div class="container">
		<br>
		<h2>Gerenciar Painel dos Paciente no Centro Cirúrgico</h2>
		<form name="form-paciente" id="form-paciente" action="GerenciarPainelServlet" method="Get">
			<div class="alert alert-primary col-md-12" role="alert" id="msg"></div>
			<input type="hidden" id="id" name="id" value="<%=pai.getId()%>">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Nome Paciente:</label> <input type="text"
						class="form-control" id="nome" placeholder="Nome do Paciente"
						name="nome" value="<%=pai.getNomePaciente()%>" required="required">
				</div>
				<div class="form-group col-md-3">
					<label for="nome">Status:</label> <select name="status" id="status"
						class="form-control borda" placeholder="Status">
						<option value="operatorio">Pré-Operatório</option>
						<option value="sala-cirurgica">Em sala cirúrgica</option>
						<option value="recuperacao">Em recuperação</option>
						<option value="transferido">Transferído</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="local">Local:</label> <input type="text"
						class="form-control" id="local" placeholder="Sala/Quarto"
						name="local" value="<%=pai.getLocal()%>">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group  col-md-3">
					<label for="inicioPrevisto">Início Prevísto:</label> <input
						type="time" class="form-control" id="inicioPrevisto"
						name="inicioPrevisto" size="20" value="<%=pai.getInicioPrevisto()%>">
				</div>
				<div class="form-group  col-md-3">
					<label for="inicioCirurgia">Início Cirurgia:</label> <input
						type="time" class="form-control" id="inicioCirurgia"
						name="inicioCirurgia" size="20" value="<%=pai.getInicioCirurgia()%>">
				</div>
				<div class="form-group  col-md-3">
					<label for="fimCirurgia">Fim daCirurgia:</label> <input
						type="time" class="form-control" id="fimCirurgia"
						name="fimCirurgia" size="20" value="<%=pai.getFimCirurgia()%>">
				</div>
				<div class="form-group  col-md-3">
					<label for="saidaPrevista">Saída Prevísto:</label> <input
						type="time" class="form-control" id="saidaPrevista"
						name="saidaPrevista" size="20" value="<%=pai.getSaidaPrevista()%>">
				</div>
			</div>
			<input type="button" class="btn btn-primary" value="Gravar" onclick="cadastrarRegistroPainel()">
			
			<%
			if (usuario == null) {
			%>
			<a href="formLogin.jsp" type="submit" class="btn btn-secondary"
				value="voltar">Voltar</a>

			<%
			} else if (pai.getId() > 0) {
			%>

			<input type="button" class="btn btn-danger" value="Apagar" onclick="excluirRegistroPainel(<%=pai.getId()%>)">
				
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
			<a href="formGerenciaPainel.jsp" type="submit" class="btn btn-success" id="espacamento" value="Cadastrar">Novo</a>
			<%
			}
			%>
		</form>
		<hr>
<script type="text/javascript">
		
		function cadastrarRegistroPainel() {
			var id = document.querySelector("#id").value;
			var nome = document.querySelector("#nome").value;
			var status = document.querySelector("#status").value;
			var local = document.querySelector("#local").value;
			var inicioPrevisto = document.querySelector("#inicioPrevisto").value;
			var inicioCirurgia = document.querySelector("#inicioCirurgia").value;
			var fimCirurgia = document.querySelector("#fimCirurgia").value;
			var saidaPrevista = document.querySelector("#saidaPrevista").value;

			var out = "";
			out += "id=$id&nome=$nome&status=$status&local=$local&inicioPrevisto=$inicioPrevisto&inicioCirurgia=$inicioCirurgia&fimCirurgia=$fimCirurgia&saidaPrevista=$saidaPrevista";
			out = out.replace("$id",id)
			out = out.replace("$nome",nome)
			out = out.replace("$status",status)
			out = out.replace("$local",local);
			out = out.replace("$inicioPrevisto",inicioPrevisto);
			out = out.replace("$inicioCirurgia",inicioCirurgia);
			out = out.replace("$fimCirurgia",fimCirurgia);
			out = out.replace("$saidaPrevista",saidaPrevista);
			acessarApiServlet(out);
		}
		
		function excluirRegistroPainel(id){
			if(confirm('Deseja excluir esse registro?')){
				acessarApiServlet("id="+id+"&acao=excluir");
			}
		}

		function acessarApiServlet(parametros) {
			const api = new XMLHttpRequest();
			api.open("GET", "GerenciarPainelServlet?"+parametros);
			api.send();
			api.onload = function() {
				var dados = this.responseText;
				dados = JSON.parse(dados);
				document.querySelector("#msg").innerHTML = dados.msg;
			}

		}
		
		if ('<%=pai.getId()%>' != 0){
			document.querySelector("#status").value = '<%=pai.getStatus()%>';
			}

		</script>

			<%@ include file="formListaPainel.jsp"%>
		
		

	</div>

</body>
</html>