package org.cc.conexao;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

	public static Connection conectar(){
		try {
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://chunee.db.elephantsql.com:5432/ebjmmhdn";
			String usuarioDb = "ebjmmhdn";
			String senhaDb = "Q_lQBrTw3n5KYMr1FTCsDHp09OO4jpXR";
			return DriverManager.getConnection(url, usuarioDb, senhaDb);
		} catch (Exception e) {
			System.out.println("Erro de Conexão");
			e.printStackTrace();
			return null;
		}
		
	  
	 
	}
}
