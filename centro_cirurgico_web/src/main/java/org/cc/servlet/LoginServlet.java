package org.cc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cc.dao.UsuarioDao;
import org.cc.model.Usuario;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet{
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String acao = req.getParameter("acao");

		if (acao != null && acao.equals("sair")) {
			req.getSession().removeAttribute("usuario");
			res.sendRedirect("index.jsp");
		} else {
			String email = req.getParameter("email");
			String senha = req.getParameter("senha");

			UsuarioDao usuDao = new UsuarioDao();
			Usuario usu = usuDao.validarLogin(email, senha);

			if (usu.getId() > 0) {
				res.sendRedirect("formGerenciaPainel.jsp");
				req.getSession().setAttribute("usuario", usu);
			} else {
				res.sendRedirect("formLogin.jsp?erro");
			}

		}
		
	}

	

}
