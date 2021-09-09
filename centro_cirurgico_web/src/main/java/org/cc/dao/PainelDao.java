package org.cc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.cc.conexao.Conexao;
import org.cc.model.Painel;

public class PainelDao {
	
	public boolean adicionarRegistroPacienePainel(Painel objPnl) {
		try {
			Connection cont = Conexao.conectar();

			String sql = "insert into painel (nome_paciente, status, local, inicio_previsto, inicio_cirurgia, fim_cirurgia, saida_prevista)"
					+ "values(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setString(1, objPnl.getNomePaciente());
			pst.setString(2, objPnl.getStatus());
			pst.setString(3, objPnl.getLocal());
			pst.setString(4, objPnl.getInicioPrevisto());
			pst.setString(5, objPnl.getInicioCirurgia());
			pst.setString(6, objPnl.getFimCirurgia());
			pst.setString(7, objPnl.getSaidaPrevista());							
			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean alterarRegistroPacienePainel(Painel objPnl) {
		try {
			Connection cont = Conexao.conectar();

			String sql = "update painel set nome_paciente = ?, status = ?, local = ?, inicio_previsto = ?, inicio_cirurgia = ?, fim_cirurgia = ?, saida_prevista = ? where id = ?";

			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setString(1, objPnl.getNomePaciente());
			pst.setString(2, objPnl.getStatus());
			pst.setString(3, objPnl.getLocal());
			pst.setString(4, objPnl.getInicioPrevisto());
			pst.setString(5, objPnl.getInicioCirurgia());
			pst.setString(6, objPnl.getFimCirurgia());
			pst.setString(7, objPnl.getSaidaPrevista());			
			pst.setInt(8, objPnl.getId());
			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean excluirRegistroPacienePainel(int id) {
		try {
			Connection cont = Conexao.conectar();

			String sql = "delete from painel where id = ?";

			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setInt(1, id);
			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Painel getRegistroPainel(int id) {
		Painel pnl = new Painel();

		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select * from painel where id = ?");
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				pnl.setId(rs.getInt("id"));
				pnl.setNomePaciente(rs.getString("nome_paciente"));
				pnl.setStatus(rs.getString("status"));
				pnl.setLocal(rs.getString("local"));
				pnl.setInicioPrevisto(rs.getString("inicio_previsto"));
				pnl.setInicioCirurgia(rs.getString("inicio_cirurgia"));
				pnl.setFimCirurgia(rs.getString("fim_cirurgia"));
				pnl.setSaidaPrevista(rs.getString("saida_prevista")); 
			}
			cont.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return pnl;
	}
	
	public List<Painel> listarRegistrosPainel() {
		List<Painel> ls = new ArrayList<>();
		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select * from painel order by id");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Painel pnl = new Painel();
				pnl.setId(rs.getInt("id"));
				pnl.setNomePaciente(rs.getString("nome_paciente"));
				pnl.setStatus(rs.getString("status"));
				pnl.setLocal(rs.getString("local"));
				pnl.setInicioPrevisto(rs.getString("inicio_previsto"));
				pnl.setInicioCirurgia(rs.getString("inicio_cirurgia"));
				pnl.setFimCirurgia(rs.getString("fim_cirurgia"));
				pnl.setSaidaPrevista(rs.getString("saida_prevista")); 
				ls.add(pnl);
			}
			cont.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return ls;
	}
	

}
