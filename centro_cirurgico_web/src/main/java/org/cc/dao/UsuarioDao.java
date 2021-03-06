package org.cc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.cc.conexao.Conexao;
import org.cc.model.Usuario;

public class UsuarioDao {
		
	public Usuario validarLogin(String email, String senha) {
		Usuario u = new Usuario();

		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select * from usuario where email = '"+email+"' and senha = '"+senha+"' ");
			//pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setSenha(rs.getString("senha"));
				u.setPerfil(rs.getString("perfil"));				
			};
			cont.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return u;
	}
	
	public Usuario getUsuario(int id) {
		Usuario u = new Usuario();

		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select * from usuario where id = ?");
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setSenha(rs.getString("senha"));
				u.setPerfil(rs.getString("perfil"));
			}
			cont.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return u;
	}
	
	public boolean cadastrarUsuario(Usuario objU) {

		try {
			Connection cont = Conexao.conectar();

			String sql = "insert into usuario (email, senha, perfil)" + "values(?, ?, ?);";

			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setString(1, objU.getEmail());
			pst.setString(2, objU.getSenha());
			pst.setString(3, objU.getPerfil());
			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean alterarUsuario(Usuario objU) {
		try {
			Connection cont = Conexao.conectar();

			String sql = "update usuario set email = ?, senha = ?, perfil = ? where id = ?";

			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setString(1, objU.getEmail());
			pst.setString(2, objU.getSenha());
			pst.setString(3, objU.getPerfil());
			pst.setInt(4, objU.getId());
			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean excluirUsuario(int id) {
		try {
			Connection cont = Conexao.conectar();

			String sql = "delete from usuario where id = ?";

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
	
	public List<Usuario> listarUsuario() {
		List<Usuario> ls = new ArrayList<>();
		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select * from usuario order by id");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Usuario u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setSenha(rs.getString("senha"));
				u.setPerfil(rs.getString("perfil"));
				ls.add(u);
			}
			cont.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ls;
	}
	
	public boolean alterarSenhaUsuario(Usuario objU) {
		try {
			Connection cont = Conexao.conectar();

			String sql = "update usuario set senha = ? where id = ?";

			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setString(1, objU.getSenha());
			pst.setInt(2, objU.getId());
			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean verificarEmail(String email) {
		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select count(*) qtd from usuario where email = ?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			rs.next();
			cont.close();
			if (rs.getInt("qtd") == 0) {
				return true;
			} 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
}
