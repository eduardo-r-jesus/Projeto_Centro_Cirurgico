<%@page import="java.util.List"%>
<%@page import="org.cc.model.Usuario"%>
<%@page import="org.cc.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>Listar Usuários</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<h2>Listar Usuários</h2>


<table class="table table-success table-striped table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Login</th>
			<th>Perfil</th>
		</tr>
	</thead>
		<%
		UsuarioDao objUDao = new UsuarioDao();
		List<Usuario> ls = objUDao.listarUsuario();

		if (ls.size() > 0) {
			for (Usuario us : ls) {
		%>

		<tr
			onclick="window.location.href = 'formManterUsuario.jsp?id=<%=us.getId()%>'" width="100%">
			<td><%=us.getId()%></td>
			<td><%=us.getEmail()%></td>
			<td><%=us.getPerfil()%></td>
		</tr>

		<%
		}
		%>



		<%
		} else {
		%>
		<tr>
			<td colspan="3" style="text-align: center">"Nenhuma informação
				encontrada!"</td>
		</tr>
		<%
		}
		%>
</table>
