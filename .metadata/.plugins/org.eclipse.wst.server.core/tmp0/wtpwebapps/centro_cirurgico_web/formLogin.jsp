<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/estilo.css">
</head>
<body id="grad">
	<div class="centro_img">
	<img src="img/Bandeira_do_Distrito_Federal_Brasil.png" alt="Bandeira do Distrito Federal" height="150px">
	</div>
	
		

	<div class="container">
		<fieldset>
			<legend>LOGIN</legend>
			<form action="loginservlet" method="post">
			
			<div class="texto">
			<label for="email">E-mail</label>
			<input type="email" class="larguraTexto" id="email" name="email" autocomplete="off"
				required="required" placeholder="Digite o seu e-mail."> 
			</div>
			<div class="texto">
			<label for="senha">Senha</label> 
			<input type="password"class="larguraTexto" id="senha" name="senha" 
			required="required" placeholder="Digite sua senha."> 
			</div>
			
			<div class="centro">
			<input type="submit" class="bt" value="Acessar">
			</div>
			
			</form>
		</fieldset>
		
		<%
		String erro = request.getParameter("erro");
		if(erro != null){
		%>
		
		<script type="text/javascript">
		
		alert("E-mail ou senha não encontrados!");
		
		</script>
	
		<%
		}
		%>

	</div>

</body>
</html>