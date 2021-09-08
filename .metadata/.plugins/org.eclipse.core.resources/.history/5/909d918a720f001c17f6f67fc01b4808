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
<script>
		var pacientes = localStorage.getItem('ls-tabela');
		
		if(pacientes == null){
			pacientes = [];
		}else{
			pacientes = JSON.parse(pacientes);
		}

		function gravar() {

			var vId = document.getElementById("id").value;
			var vNome = document.getElementById("nome").value.toUpperCase();	
			if (vNome == '') {
				alert('O Nome do Paciente é obrigatório.');
				return false;
			}

			var vStatus = document.getElementById("status").value;
			var vLocal = document.getElementById("local").value;
			var vIniPrevisto = document.getElementById("inicio-previsto").value;
			var vIniCirurgia = document.getElementById("inicio-cirurgia").value;
			var vFimCirurgia = document.getElementById("fim-cirurgia").value;
			var vSaidaPrev = document.getElementById("saida-previsto").value;

			if (vLocal != '') {
				vLocal = '(' + vLocal + ')';
			}

			var save = confirm("Deseja Salvar as alterações?");
			if (save) {

				var paciente = {
					nome : vNome,
					status : vStatus,
					local : vLocal,
					iniPrevisto : vIniPrevisto,
					iniCirurgia : vIniCirurgia,
					fimCirurgia : vFimCirurgia,
					saidaPrev : vSaidaPrev,
				};

				if (vId == '') {
					pacientes.splice(pacientes.length, 0, paciente);
				} else {
					pacientes[vId] = paciente;
				}
				atualizarTabela();
				limpaForm();
			}
		}

		function preparaEdicao(id) {
			var p = pacientes[id];
			document.getElementById("id").value = id;
			document.getElementById("nome").value = p.nome;
			document.getElementById("status").value = p.status;
			document.getElementById("local").value = p.local.replace("(","").replace(")","");
			document.getElementById("inicio-previsto").value = p.iniPrevisto;
			document.getElementById("inicio-cirurgia").value = p.iniCirurgia;
			document.getElementById("fim-cirurgia").value = p.fimCirurgia;
			document.getElementById("saida-previsto").value = p.saidaPrev;

		}

		function status(status) {
			switch (status) {
			case 'operatorio':
				return {
					label : 'Pré-Operatório',
					cor : '#fbd972'
				};
			case 'sala-cirurgica':
				return {
					label : 'Em sala cirúrgica',
					cor : '#fd5766'
				};
			case 'recuperacao':
				return {
					label : 'Em recuperação',
					cor : '#89e89f'
				};
			case 'transferido':
				return {
					label : 'Transferído',
					cor : '#b8daff'
				};
			}
		}

		function atualizarTabela() {
			var tabela = "";

			for (i in pacientes) {
				var stts = status(pacientes[i].status);
				tabela += '<tr onclick="preparaEdicao(' + i + ')">' + '<td>'
						+ pacientes[i].nome + '</td>'
						+ '<td style="background-color: '+stts.cor+';">'
						+ stts.label + pacientes[i].local + '</td>' + '<td>'
						+ pacientes[i].iniPrevisto + '</td>' + '<td>'
						+ pacientes[i].iniCirurgia + '</td>' + '<td>'
						+ pacientes[i].fimCirurgia + '</td>' + '<td>'
						+ pacientes[i].saidaPrev + '</td>' + '</tr>';
			}

			document.getElementById("corpo-tabela").innerHTML = tabela;
			localStorage.setItem('corpo-tabela', tabela);
			localStorage.setItem('ls-tabela', JSON.stringify(pacientes));
		}

		function limpaForm() {
			document.getElementById("id").value = '';
			document.getElementById('form-paciente').reset();
		}

		function apagar() {
			var vId = document.getElementById("id").value;
			if (vId != '') {
				var save = confirm("Tem certeza que quer apagar esse registro?");
				if (save) {
					pacientes.splice(vId, 1);
					atualizarTabela();
					limpaForm();
				}
			}
		}
	</script>

	<div class="container">
		<br>
		<h2>Gerenciar Painel dos Paciente no Centro Cirúrgico</h2>
		<form name="form-paciente" id="form-paciente">
			<input type="hidden" id="id" name="id">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Nome Paciente:</label> <input type="text"
						class="form-control" id="nome" placeholder="Nome do Paciente"
						name="nome">
				</div>
				<div class="form-group col-md-3">
					<label for="nome">Status:</label> <select name="status" id="status"
						class="form-control">
						<option value="operatorio">Pré-Operatório</option>
						<option value="sala-cirurgica">Em sala cirúrgica</option>
						<option value="recuperacao">Em recuperação</option>
						<option value="transferido">Transferído</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="local">Local:</label> <input type="text"
						class="form-control" id="local" placeholder="Sala/Quarto"
						name="local">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group  col-md-3">
					<label for="inicio-previsto">Início Prevísto:</label> <input
						type="time" class="form-control" id="inicio-previsto"
						name="inicio-previsto" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="inicio-previsto">Início Cirurgia:</label> <input
						type="time" class="form-control" id="inicio-cirurgia"
						name="inicio-previsto" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="inicio-previsto">Fim daCirurgia:</label> <input
						type="time" class="form-control" id="fim-cirurgia"
						name="inicio-previsto" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="inicio-previsto">Saída Prevísto:</label> <input
						type="time" class="form-control" id="saida-previsto"
						name="inicio-previsto" size="20">
				</div>
			</div>
			<button type="button" class="btn btn-secondary" onclick="limpaForm()">Novo</button>
			<button type="button" class="btn btn-primary" onclick="gravar(this)">Gravar</button>
			<button type="button" class="btn btn-danger" onclick="apagar()">Apagar</button>
		</form>

		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="40%">Nome do Paciente</th>
					<th width="30%">Status</th>
					<th width="10%">Início Prevísto</th>
					<th width="10%">Início da Cirurgia</th>
					<th width="10%">Fim da Cirurgia</th>
					<th width="10%">Saída Prevista</th>
				</tr>
			</thead>
			<tbody id="corpo-tabela" style="cursor: pointer;">

			</tbody>
		</table>

		<script type="text/javascript">
			var tabela = localStorage.getItem('corpo-tabela');
			document.getElementById("corpo-tabela").innerHTML = tabela;
		</script>

	</div>

</body>
</html>