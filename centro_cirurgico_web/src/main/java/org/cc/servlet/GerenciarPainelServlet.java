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

import org.cc.dao.PainelDao;
import org.cc.model.Painel;


import com.google.gson.Gson;

@WebServlet("/GerenciarPainelServlet")
public class GerenciarPainelServlet extends HttpServlet {
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter saida = res.getWriter();
		Map msg = new HashMap<>();
		
		Painel objPnl = new Painel();

		String acao = req.getParameter("acao");
		
		if (acao != null && acao.equals("excluir")) {
			objPnl.setId(Integer.parseInt(req.getParameter("id")));
		} else {

			objPnl.setNomePaciente(req.getParameter("nome"));
			objPnl.setStatus(req.getParameter("status"));
			objPnl.setLocal(req.getParameter("local"));
			objPnl.setInicioPrevisto(req.getParameter("inicioPrevisto"));
			objPnl.setInicioCirurgia(req.getParameter("inicioCirurgia"));
			objPnl.setFimCirurgia(req.getParameter("fimCirurgia"));
			objPnl.setSaidaPrevista(req.getParameter("saidaPrevista"));			
			objPnl.setId(Integer.parseInt(req.getParameter("id")));
		}
		
		PainelDao objPnlDao = new PainelDao();
		
		boolean validar = false;
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		if (objPnl.getId() > 0) {
			
			if (acao != null && acao.equals("excluir")) {
				validar = objPnlDao.excluirRegistroPacienePainel(objPnl.getId());
				
				msg.put("msg", "Registro do painel exclu?do com sucesso!");
			} else {
					validar = objPnlDao.alterarRegistroPacienePainel(objPnl);
					msg.put("msg","Registro do painel alterado com sucesso!");
				} 

		} else {
			
			if(objPnl.getNomePaciente().equals("")) {
				msg.put("msg", "Necess?rio preencher o nome do paciente.");
			}
			
			if (!msg.containsKey("msg")) {
					validar = objPnlDao.adicionarRegistroPacienePainel(objPnl);
					msg.put("msg", "Registro do painel cadastrado com sucesso!");
				} else {
					// vamos tratar o erro.
					msg.put("msg", "Erro ao gravar registro do painel");
				}
		}		
		saida.print(new Gson().toJson(msg));
	}

}
