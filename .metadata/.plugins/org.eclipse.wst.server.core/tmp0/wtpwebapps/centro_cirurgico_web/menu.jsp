<%@page import="org.cc.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#dadosUsuario{
	color: yellow;
	padding: 16px;
	display: block;
	text-align: center;
	text-decoration: none;
	float: right;
}
#dadosUsuario a{
	color: black;
	background-color:#fff;
	text-decoration: none;
	float: right;
	padding:2px;
	cursor: pointer;
    border-radius: 3px;
    font-size: 9px;
}
#dadosUsuario a:hover{
	background-color: black;
	color: yellow;
	
}

</style>

	<ul>
	  
	   <%
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
    	boolean verLista = false;
    	if(usuario != null){
    		verLista = true;
    	%>
    	<span id="dadosUsuario"> <a href="loginservlet?acao=sair"><b>Logout</b></a></span>
    	<span id="dadosUsuario">Bem Vindo: <%=usuario.getEmail()%></span>
        <li><a href="index.jsp"><b>Home</b></a></li>
        <li><a href="formGerenciaPainel.jsp"><b>Gerenciar Painel</b></a>
        
        <% if(usuario.getPerfil().equals("administrador")){ %>    
        <li><a href="formManterUsuario.jsp"><b>Manter Usuário</b></a></li>
        <%}else{%>
        <li><a href="formAlterarSenha.jsp"><b>Alterar Senha</b></a></li>
        <%}%>
        
      
      <%
    	}else{
    	%>
   		<li></li>
    	<%	
    	} 
    	%>
    </ul>
