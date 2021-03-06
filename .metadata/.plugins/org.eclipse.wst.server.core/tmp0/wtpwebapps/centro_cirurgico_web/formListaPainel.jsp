<%@page import="java.io.PrintWriter"%>
<%@page import="org.cc.model.Painel"%>
<%@page import="org.cc.dao.PainelDao"%>
<%@page import="java.util.List"%>
<%@page import="org.cc.model.Usuario"%>
<%@page import="org.cc.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>Listar Registros Painel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<h2>Painel do Centro Cirúrgico</h2>
<% 
PrintWriter saida = response.getWriter();
%>

<table class="table table-success table-striped table-hover">
	<thead>
		<tr>
			<th>Nome do Paciente</th>
			<th>Status</th>
			<th>Início Previsto</th>
			<th>Início Cirurgia</th>
			<th>Fim Cirurgia</th>
			<th>Saída Prevísta</th>
		</tr>
	</thead>
		<%
		PainelDao objPaiDao = new PainelDao();
		List<Painel> ls = objPaiDao.listarRegistrosPainel();

		if (ls.size() > 0) {
			for (Painel painel : ls) {
		%>
		
		<tr
			onclick="window.location.href = 'formGerenciaPainel.jsp?id=<%=painel.getId()%>'">
			
			<td width="40%"><%=painel.getNomePaciente()%></td>
	
			<%
			if(painel.getStatus().equals("operatorio")){
			%>	
				<td class="operatorio" width="20%">Pré-Operatório</td>
			<%				
			}else if(painel.getStatus().equals("sala-cirurgica")){%>
				<td class="salaCirurgia" width="20%">Em sala cirúrgica</td>
			<% 
			}else if(painel.getStatus().equals("recuperacao")){%>
				<td class="recuperacao" width="20%">Em recuperação</td>
			<% 
			}else if(painel.getStatus().equals("transferido")){%>
				<td class="transferido" width="20%">Transferido</td>
			<%	
			}else{%>
				<td width="20%"><%=painel.getStatus()%></td>
			<%}%>
			
			<td width="10%"><%=painel.getInicioPrevisto()%></td>
			<td width="10%"><%=painel.getInicioCirurgia()%></td>
			<td width="10%"><%=painel.getFimCirurgia()%></td>
			<td width="10%"><%=painel.getSaidaPrevista()%></td>
		</tr>

		<%
		}
		%>



		<%
		} else {
		%>
		<tr>
			<td colspan="8" style="text-align: center">"Nenhuma informação
				encontrada!"</td>
		</tr>
		<%
		}
		%>
</table>

