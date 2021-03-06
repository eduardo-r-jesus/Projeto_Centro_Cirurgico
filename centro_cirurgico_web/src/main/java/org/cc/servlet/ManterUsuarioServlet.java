package org.cc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cc.dao.UsuarioDao;
import org.cc.model.Usuario;

import com.google.gson.Gson;

@WebServlet("/ManterUsuarioServlet")
public class ManterUsuarioServlet extends HttpServlet {
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter saida = res.getWriter();
		Map msg = new HashMap<>();
		
		Usuario objU = new Usuario();

		String acao = req.getParameter("acao");
		
		if (acao != null && acao.equals("excluir")) {
			objU.setId(Integer.parseInt(req.getParameter("id")));
		} else {

			objU.setEmail(req.getParameter("email"));
			objU.setSenha(req.getParameter("senha"));
			objU.setPerfil(req.getParameter("perfil"));
			objU.setId(Integer.parseInt(req.getParameter("id")));
		}
		
		UsuarioDao objUDao = new UsuarioDao();
		
		boolean validar = false;
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		if (objU.getId() > 0) {
			if (acao != null && acao.equals("excluir")) {
				validar = objUDao.excluirUsuario(objU.getId());
				msg.put("msg", "Usu?rio exclu?do com sucesso!");
			} else {
				
				if (objUDao.verificarEmail(objU.getEmail())) {
					validar = objUDao.alterarUsuario(objU);
					msg.put("msg","Usu?rio alterado com sucesso!");
				} else {
					// vamos tratar o erro.
					msg.put("msg", "Erro ao gravar, email j? existe");
				}
			}

		} else {
			
			if(objU.getEmail().equals("")) {
				msg.put("msg", "Necess?rio preencher o e-mail.");
			}
			
			if (!msg.containsKey("msg")) {
				if (objUDao.verificarEmail(objU.getEmail())) {
					validar = objUDao.cadastrarUsuario(objU);
					msg.put("msg", "Usu?rio cadastrado com sucesso!");
				} else {
					// vamos tratar o erro.
					msg.put("msg", "Erro ao gravar, email j? existe");
				}
			} 
			
		}		
		saida.print(new Gson().toJson(msg));
	}

}
