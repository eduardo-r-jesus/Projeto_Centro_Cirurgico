<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Painel Centro Cirúrgico</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>

<%
        Usuario us = (Usuario) request.getSession().getAttribute("usuario");
    	if(us != null){ %>
    		<%@ include file="menu.jsp" %>
    	<%	} else { %>
    		<span class="bt_acessar" id="botao_direita"><a href="formLogin.jsp" >Acessar</a></span>
		<%	} 
%>

<p>			
		<img
			src="img/Bandeira_do_Distrito_Federal_Brasil.png" height="100px">
		
		<script>
			var myVar = setInterval(myTimer, 1000);
			function myTimer() {
				var d = new Date();
				document.getElementById("dt-hora").innerHTML = d.getDate()+'/'+(d.getMonth()+1)+'/'+d.getFullYear()+' '+ d
						.toLocaleTimeString();
			}
		</script>
		Hospital Regional de Taguatinga|Secretaria de Estado de Saúde do
		Distrito Federal| Pacientes no Centro Cirúgico - <span id="dt-hora"></span>
		
	</p>
	<%@ include file="formListaPainel.jsp"%>

</body>
</html>